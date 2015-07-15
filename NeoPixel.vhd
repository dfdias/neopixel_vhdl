NeoPixel.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity NeoPixel is
generic port(N : 1) : number of neopixel in  string
port (clk : in std_logic;
	  rst : in std_lolgic;
	  SW  : in std_logic_vector(2 downto 0);--for demo and test purposes we are going to use those to change color;
	  OUT : out is array of std_logic_vector(7 downto 0) range 0 to N-1);