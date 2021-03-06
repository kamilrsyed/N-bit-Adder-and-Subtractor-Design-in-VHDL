library ieee;
use ieee.std_logic_1164.all;

package add_sub is

    component SYED_Half_Adder
            port (ha_A, ha_B			: in std_logic;
						ha_SUM, ha_Cout	: out std_logic);
    end component;

    component SYED_1bit_Full_Adder is
				port (fa_A, fa_B, fa_Cin	: in std_logic;
						fa_SUM, fa_Cout	: out std_logic);
    end component;
	 
	 component SYED_4bit_Full_Adder is
				port (A, B			: in std_logic_vector(3 downto 0);
						Cin			: in std_logic;
						SUM			: out std_logic_vector(3 downto 0);
						Cout			: out std_logic
						);			
	 end component;
	 
	 component SYED_4bit_Add_Sub is
				port (A, B			: in std_logic_vector(3 downto 0);
						Cin			: in std_logic;
						SUM			: out std_logic_vector(3 downto 0);
						Cout			: out std_logic			
						);			
	 end component;
	 
	 component SYED_nbit_Add_Sub is
				generic 	(n				: integer:= 2
							);
				
				port (A, B			: in std_logic_vector(n-1 downto 0);
						Cin			: in std_logic;
						SUM			: out std_logic_vector(n-1 downto 0);
						Cout			: out std_logic			
						);			
	 end component;
	 

end package add_sub;