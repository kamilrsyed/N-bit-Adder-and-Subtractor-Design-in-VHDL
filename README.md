# N-bit-Adder-and-Subtractor-Design-in-VHDL
This was one of the class projects for CSC343 at CCNY

----------------README-------------- 

To verify the design, copy the following files into ModelSim:
1- SYED_Half_Adder
2- SYED_1bit_Full_Adder
3- SYED_nbit_Add_Sub
4- SYED_Overflow_Logic
5- SYED_tb_16bit

Then simulate using the simulate option in ModelSim and verify by inputting different waveforms for n-bits
Alternatively, use SYED_tb_16bit testbench file to verify for 16 bits


NOTE: GENERIC INTEGER n IN SYED_nbit_Add_Sub MUST BE MODIFIED ACCORDING TO THE DESIRED NUMBER OF BITS FOR SIMULATION!!!
		CURRENTLY IT IS SET TO n = 16BITS
