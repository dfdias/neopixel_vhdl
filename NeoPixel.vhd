NeoPixel.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity NeoPixel is
generic port(N : 1) : number of neopixel in  string
port (clk : in std_logic;			-- i don't know the frequency yet, but i'll use a crystal @50MHz
	  rst : in udo std_lolgic;			    -- reset button of the system
	  SW  : in std_logic_vector(2 downto 0);--for demo and test purposes we are going to use those to change color;
	  data_out : out std_logic_vector(23 downto 0)); --to be conected on datapin

end NeoPixel;

architecture Behav of NeoPixel is

signal s_time, s_time_next : integer range 0 to 1000;
signal s_color,s_color_next: std_logic;--std_logic_vector(23 downto 0);
subtype state (E0,E1,E2,E3);
signal PS,NS : state;

state_proc : process (clk, rst)
begin
 if rising_edge(clk) then
  s_time <= s_time_next;
  PS <= NS;
  if rst <= '1' then
   s_time <= '0';
  end if ;
 end if ;
end process;

comb_proc: process()

