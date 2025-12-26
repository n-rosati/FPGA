PROGECT_NAME = template
PCF_FILE = io.pcf
TOP_MODELE = top
	
# Write your verilog file.
VERILOG_FILES = \
$(TOP_MODELE).v

ICELINK_DEV = $(shell readlink -f /dev/disk/by-label/iCELink)
ICELINK_DIR = /tmp/iCELink
	
build:
	yosys -p "synth_ice40 -top $(TOP_MODELE) -json $(PROGECT_NAME).json" $(VERILOG_FILES)
	nextpnr-ice40 \
		--up5k \
		--package sg48 \
		--json $(PROGECT_NAME).json \
		--pcf $(PCF_FILE) \
		--asc $(PROGECT_NAME).asc
	icepack $(PROGECT_NAME).asc $(PROGECT_NAME).bin
	
flash:
	mkdir -p $(ICELINK_DIR)
	mount -t vfat $(ICELINK_DEV) $(ICELINK_DIR)
	cp $(PROGECT_NAME).bin $(ICELINK_DIR)
	sync
	umount $(ICELINK_DIR)
	
clean:
	rm $(PROGECT_NAME).*