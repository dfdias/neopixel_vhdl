NeoPixel.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity NeoPixel_controller is
generic (N : 1)                 /* number of neopixel in string*/
port (clk : in std_logic;			-- i don't know the frequency yet, but i'll use a crystal @50MHz
	  rst : in udo std_lolgic;		-- reset button of the system will be moved to a shell file
	  SW  : in std_logic_vector(2 downto 0); --for demo and test purposes we are going to use those to change color;
	  RGB : in std_logi_vector(23 downto 0);  -- color datain from serial input(color wheel routine)
	  data_out : out std_logic_vector(23 downto 0)); --to be conected on datapin

end NeoPixel_controller;

architecture Behav of NeoPixel is

signal s_time, s_time_next : integer range 0 to 1000;
signal s_i, s_i_next : integer range 0 to N;
signal s_color,s_color_next: std_logic;--std_logic_vector(23 downto 0);
signal d is array of std_logic_vector(23 downto 0) range 1 to N; --array with the size of an N number of pixels on String
signal PS,NS : state;
signal s_R, s_G, s_B : std_logic_vector(7 downto 0);

state_proc : process (clk, rst) --state machine sync manager process
begin
 if rising_edge(clk) then
  s_time <= s_time_next;
  PS <= NS;
  if rst <= '1' then
   s_time <= '0';
  end if ;
 end if ;
end process;

time_proc : process(s_time, s_time_next)
begin
 s_time_next <= s_time + 1;
 if s_time <= t_time then
  s_time_next <= 0;
 end if;

comb_proc: process(s_color,s_coolor_next) --combinational logic of NeoPixel Color

		s_data_out <= d(i);
	end loop ; -- identifier

