library ieee;
use ieee.std_logic_1164.all;


entity SYED_tb_16bit is
end SYED_tb_16bit;

architecture tb of SYED_tb_16bit is
    signal a, b, sum : std_logic_vector (15 downto 0);
    signal carry_in, carry_out, overflow 		: std_logic;
begin

	
    -- connecting testbench signals with SYED_nbit_Add_Sub.vhd
    UUT : entity work.SYED_nbit_Add_Sub port map (A => a, B => b, SUM => sum, Cin => carry_in, Cout => carry_out, O_flag => overflow);

    tb1 : process
	
        constant period: time := 20 ns;
        begin
				report "Simulation starting at: " & time'image(now);
            a 			<= "0000000000000000";
            b 			<= "0000000000000000";
				carry_in <= '0';
            wait for period;
            assert ((sum = "0000000000000000") and (carry_out = '0'))  -- expected output
            -- error will be reported if sum is not 0000000000000000 and carry is not 0
            report "test failed for input combination 0000000000000000 0000000000000000" severity error;

            a <= "0111111111111111";
            b <= "0000000000000001";
				carry_in <= '0';
            wait for period;
            assert ((sum = "1000000000000000") and (carry_out = '0') and (overflow = '1'))
            report "test failed for input combination 0111111111111111 0000000000000001" severity error;

            a <= "0111111111111111";
            b <= "0111111111111111";
				carry_in <= '1';
            wait for period;
            assert ((sum = "0000000000000000") and (carry_out = '1') and (overflow = '0'))
            report "test failed for input combination 0111111111111111 0111111111111111" severity error;
	
				report "Simulation ending at: " & time'image(now);
				
	wait; -- indefinitely suspend process
        end process;
end tb;