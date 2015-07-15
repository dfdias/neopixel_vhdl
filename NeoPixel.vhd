NeoPixel.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity NeoPixel is
generic port(N : 1) : number of neopixel in  string
port (clk : in std_logic;			-- i don't know the frequency, yet but i'll use a crystal @50MHz
	  rst : in udo std_lolgic;			    -- reset button of the system
	  SW  : in std_logic_vector(2 downto 0);--for demo and test purposes we are going to use those to change color;
	  data_out : out std logic;--std_logic_vector(7 downto 0)); --to be conecte on datapin

end NeoPixel;

architecture Behav of NeoPixel is

signal s_time, s_time_next;
signal s_color,s_color_next: std_logic;--std_logic_vector(7 downto 0);
subtype state (E0,E1,E2,E3);
signal PS,NS : state;

state_proc : process (clk, rst)
begin
 if rising_edge(clk) then
 	s_time_next <= s_time;
 end if ;