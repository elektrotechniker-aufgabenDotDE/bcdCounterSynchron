----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.05.2020 12:49:08
-- Design Name: 
-- Module Name: eckert_testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcdCounter_testbench is
--  Port ( );
end bcdCounter_testbench;

architecture Behavioral of bcdCounter_testbench is

component bcdCounter is
  Port (
        led: out std_logic_vector (3 downto 0):=(others => '0');
        clk: in std_logic:= '0'
        );
end component;

constant clk_in_half_period : time := 5ns;

signal led_uut: std_logic_vector (3 downto 0):= (others => '0');
signal clk_in: std_logic:= '0';

begin

uut: bcdCounter port map(
    led => led_uut,
    clk => clk_in
    );

clk_in <= not clk_in after clk_in_half_period;

process begin


end process;

end Behavioral;
