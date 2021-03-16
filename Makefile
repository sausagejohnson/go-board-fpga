MODULE_FILE_TO_TEST = top
#counter-segments-driver

build:
	yosys -s yosys-script.txt
	nextpnr-ice40.exe --hx1k --freq 25 --pcf Go_Board_Constraints.pcf --json design.json --package vq100 --asc bitstream.txt
	icepack bitstream.txt bitstream.bin


simulate:
	iverilog -Wall -o sim/$(MODULE_FILE_TO_TEST)_tb $(MODULE_FILE_TO_TEST)_tb.v
	vvp sim/$(MODULE_FILE_TO_TEST)_tb -lxt2
	mv $(MODULE_FILE_TO_TEST)_tb.lxt sim/$(MODULE_FILE_TO_TEST)_tb.lxt
	gtkwave sim/$(MODULE_FILE_TO_TEST)_tb.lxt sim/gtkwaveConfig.gtkw
