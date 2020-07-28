----------------------------------------------------------------------------------
-- Company: elektrotechniker-aufgaben.de
-- Engineer: 
-- 
-- Create Date: 28.07.2020 12:03:49
-- Design Name: 
-- Module Name: displayControl - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity displayControl is
  Port (Clock: in std_logic;
        inVal: in std_logic_vector(3 downto 0);
        outVal: out std_logic_vector(6 downto 0);
        anVal: out std_logic_vector(7 downto 0)
        );
end displayControl;

architecture Behavioral of displayControl is

begin

anVal(7 downto 1) <= (7 downto 1 => '1');
anVal(0) <= '0';

with inVal select
	outVal <= "1000000" when "0000",
				  "1111001" when "0001",
				  "0100100" when "0010",
				  "0110000" when "0011",
				  "0011001" when "0100",
				  "0010010" when "0101",
				  "0000010" when "0110",
				  "1111000" when "0111",
				  "0000000" when "1000",
				  "0010000" when "1001",
				  "1111111" when others;


end Behavioral;