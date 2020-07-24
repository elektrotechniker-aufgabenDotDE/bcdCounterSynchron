----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.07.2020 13:58:06
-- Design Name: 
-- Module Name: clockDivider - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clockDivider is
  Port (clk_in: in std_logic;
        clk_out: out std_logic);
end clockDivider;

architecture Behavioral of clockDivider is

constant prescal_value : integer := 3125000;

signal prescal_counter: std_logic_vector(21 downto 0):= (others => '0');

signal clk_signal: std_logic:= '0';

begin

clk_out <= clk_signal;

process
begin
    wait until rising_edge (clk_in);
        prescal_counter <= prescal_counter + 1;
        
        if (prescal_counter >= prescal_value) then
            clk_signal <= not(clk_signal);
            prescal_counter <= (others => '0');
        else
        end if;

end process;

end Behavioral;
