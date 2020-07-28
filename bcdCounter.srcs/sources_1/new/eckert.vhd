----------------------------------------------------------------------------------
-- Company: elektrotechniker-aufgaben.de
-- Engineer: 
-- 
-- Create Date: 29.05.2020 12:24:31
-- Design Name: 
-- Module Name: eckert - Behavioral
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

entity bcdCounter is
  Port (
        led: out std_logic_vector (3 downto 0);
        clk: in std_logic:= '0';
        seg: out  STD_LOGIC_VECTOR (6 downto 0);
        an: out  STD_LOGIC_VECTOR (7 downto 0)
        );
end bcdCounter;

architecture Behavioral of bcdCounter is

component displayControl is port (
    Clock: in std_logic;
    inVal: in std_logic_vector(3 downto 0);
    outVal: out std_logic_vector(6 downto 0);
    anVal: out std_logic_vector(7 downto 0)
    );
end component;   

component jkFlipFlop is port (
    J: in std_logic;
    K: in std_logic ;
    Clock: in std_logic;
    Q: out std_logic;
    Qn: out std_logic);
end component;   

component clockDivider is port (
    clk_in: in std_logic;
    clk_out: out std_logic );
end component;

component clk_wiz_0 is port(
	clk_in1 : in std_logic;
	clk_out1 : out std_logic;
	reset: in std_logic);
end component;     

signal J_qa: std_logic:= '0';
signal K_qa: std_logic:= '0';
signal Q_qa: std_logic:= '0';
signal Qn_qa: std_logic:= '0';

signal J_qb: std_logic:= '0';
signal K_qb: std_logic:= '0';
signal Q_qb: std_logic:= '0';
signal Qn_qb: std_logic:= '0';

signal J_qc: std_logic:= '0';
signal K_qc: std_logic:= '0';
signal Q_qc: std_logic:= '0';
signal Qn_qc: std_logic:= '0';

signal J_qd: std_logic:= '0';
signal K_qd: std_logic:= '0';
signal Q_qd: std_logic:= '0';
signal Qn_qd: std_logic:= '0';

signal clk_out_1: std_logic:='0';
signal clk_div: std_logic := '0';

-- 7 segment display

signal inVal_1: std_logic_vector (3 downto 0):=(others => '0');
signal outVal_1: std_logic_vector (6 downto 0):=(others => '0');
signal anVal_1: std_logic_vector (7 downto 0):=(others => '0');

-- LED buffer

signal bufferLed: std_logic_vector (3 downto 0):=(others => '0');
    
begin

displayControl_1:displayControl port map(
    Clock => clk_out_1,
    inVal => inVal_1,
    outVal => outVal_1,
    anVal => anVal_1);

jkFlipFlop_qa:jkFlipFlop port map(
    Clock => clk_div,
    J => J_qa,
    K => K_qa,
    Q => Q_qa,
    Qn => Qn_qa);
 
jkFlipFlop_qb:jkFlipFlop port map(
    Clock => clk_div,
    J => J_qb,
    K => K_qb,
    Q => Q_qb,
    Qn => Qn_qb);
    
jkFlipFlop_qc:jkFlipFlop port map(
    Clock => clk_div,
    J => J_qc,
    K => K_qc,
    Q => Q_qc,
    Qn => Qn_qc);
    
jkFlipFlop_qd:jkFlipFlop port map(
    Clock => clk_div,
    J => J_qd,
    K => K_qd,
    Q => Q_qd,
    Qn => Qn_qd);
        
pll0: clk_wiz_0 port map(
	clk_in1 => clk,
	clk_out1 => clk_out_1,
	reset => '0');

clkDivider_1: clockDivider port map(
    clk_in => clk_out_1,
    clk_out => clk_div);

J_qa <= '1';
K_qa <= '1';  

J_qb <= Q_qa AND Qn_qd;
K_qb <= Q_qa;

J_qc <= Q_qb AND Q_qa;
K_qc <= Q_qb AND Q_qa;

J_qd <= Q_qa AND Q_qb AND Q_qc;
K_qd <= Q_qa;  

bufferLed(0) <= Q_qa;
bufferLed(1) <= Q_qb;
bufferLed(2) <= Q_qc;
bufferLed(3) <= Q_qd;


led(0) <= bufferLed(0);
led(1) <= bufferLed(1);
led(2) <= bufferLed(2);
led(3) <= bufferLed(3);


inVal_1(3 downto 0) <= bufferLed(3 downto 0);

seg(6 downto 0) <= outVal_1(6 downto 0);
an(7 downto 0) <= anVal_1(7 downto 0);

end Behavioral;
