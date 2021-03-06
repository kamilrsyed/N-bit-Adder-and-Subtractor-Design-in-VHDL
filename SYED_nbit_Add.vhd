library ieee;
use ieee.std_logic_1164.all;

entity SYED_nbit_Add is

	generic 	(n				: integer:= 2;
				 i				: integer:= 0
	);
	
	port 		(A, B			: in std_logic_vector(n-1 downto 0);
				Cin			: in std_logic;
				SUM			: out std_logic_vector(n-1 downto 0);
				Cout			: out std_logic			
	);
			
end SYED_nbit_Add;

architecture Structure of SYED_nbit_Add is
	
	component SYED_1bit_Full_Adder is
	
		port (fa_A, fa_B, fa_Cin	: in std_logic;
				fa_SUM, fa_Cout		: out std_logic);
				
	end component;
	
	signal onebitSUM 			: std_logic_vector (n-1 downto 0);
	signal Carry				: std_logic_vector (n-1 downto 0);

	
begin
	
	
	FA_0 : SYED_1bit_Full_Adder
			port map ( 	fa_A=>A(0),
							fa_B=>B(0),
							fa_Cin=>Cin,
							fa_SUM=>onebitSUM(0),
							fa_Cout=>Carry(0) 
			);
	
	FA: for i in 1 to n-1 generate	
		FA_i : SYED_1bit_Full_Adder
			port map ( 	fa_A=>A(i),
							fa_B=>B(i),
							fa_Cin=>Carry(i-1),
							fa_SUM=>onebitSUM(i),
							fa_Cout=>Carry(i) 
			);		
	end generate;
		
	SUM <= onebitSUM;
	Cout <= Carry(n-1);
		
end Structure;	