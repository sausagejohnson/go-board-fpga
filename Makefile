build:
	yosys -s yosys-script.txt
	nextpnr-ice40.exe --hx1k --freq 25 --pcf Go_Board_Constraints.pcf --json design.json --package vq100 --asc bitstream.txt
	icepack bitstream.txt bitstream.bin
