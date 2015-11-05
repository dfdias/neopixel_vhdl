library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity npc is
generic (N : integer := 1);                 -- number of neopixel in string*/
port (clk : in std_logic;			-- i don't know the frequency yet, but i'll use a crystal @50MHz
	   rst : in  std_logic;		-- reset button of the system will be moved to a shell file
	   sw  : in std_logic_vector(2 downto 0); --for demo and test purposes we are going to use those to change color;
	  --RGB : in std_logi_vector(23 downto 0);  -- color datain from serial input(color wheel routine)
	   refresh : out std_logic;
      data_out : out std_logic_vector(23 downto 0)); --to be conected on datapin

end npc;

architecture bhv of npc is

constant reset_time: integer := 25; --cascade transmition time in us
signal s_time, s_time_next : integer range 0 to 1000;
signal s_i, s_i_next : integer range 0 to N;
signal s_color,s_color_next: std_logic_vector(23 downto 0);
--signal d is array of std_logic_vector(23 downto 0) range 1 to N; --array with the size of an N number of pixels on String
--signal PS,NS : state;
--S0,S1,S2;
signal s_R, s_G, s_B : std_logic_vector(7 downto 0);

begin


s_R <= "11111111";
s_G <= (others => '0');
s_B <= "11111111";


state_proc : process (clk,rst) --state machine sync manager process
begin
 if rising_edge(clk) then
   s_time_next <= s_time + 1;
--	PS <= NS;
  if rst <= '1' then
   s_time <= 0;
  end if ;
 end if ;
end process;


comb_proc: process(s_color,s_color_next,s_i,s_i_next) 
begin
 refresh <= '0';
 if s_i < N then
 	s_color_next <= s_G & S_R & S_B;
  s_i_next <= s_i + 1;
 elsif s_i = N then 
  refresh <= '1';
  s_i_next <= 0;
 end if ;
end process;

end bhv;