----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.07.2020 12:25:07
-- Design Name: 
-- Module Name: jkFlipFlop - Behavioral
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

entity jkFlipFlop is
  Port (J, K, Clock: in std_logic;
        Q, Qn: out std_logic);
end jkFlipFlop;

architecture Behavioral of jkFlipFlop is

signal tmp: std_logic:='0';

begin

    Q <= tmp;
    Qn <= not(tmp);

process
begin
    wait until rising_edge (Clock);
    
    if (J = '0' and K = '0') then
        tmp <= tmp;
    elsif (J = '1' and K = '0') then
        tmp <= '1';
    elsif (J = '0' and K = '1') then
        tmp <= '0';
    else
        tmp <= not(tmp);
    end if;
       
end process;
    


end Behavioral;
