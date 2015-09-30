output_manager.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity output_manager is
port( clk  :  in std_logic;--50Mhz
	  rst  :  in std_logic;
	  refresh :  in std_logic;--send refresh signal to the pixels 
	  s_in   :  in std_logic;
	  s_out  : out  std_logic; )

end output_manager;

architecture Behav of output_manager is
constant T0H : integer := 0.4 us; --zero bit high level time constraint
constant T0L : integer := 0.85 us; --zero bit low level time constraint
constant T1H : integer := 0.8 us;  --zero bit high level time constraint
constant T1L : integer := 0.45 us;  --zero bit high level time constraint
constant t_reset : integer := 50 us; --reset time constraint
constant tx_time : integer := T0H + T0L us;
signal s_t, s_t_next : integer range 0 to tx_time;
signal s_rst : std_logic;


begin

timing_proc : process (clk,s_rst,rst)
begin
 if rising_edge(clk) then  
  s_t_next <= s_t + 1;
 elsif s_t = 0 then
  s_t_next <= 0;
 elsif rst <= '1' then
  s_t_next <= 0;
 elsif s_rst <= '1' then
  s_t_next <= 0;

end;

inout_proc : process(s_in,tx_time,)  
begin
 if s_in = '1' then
  s_rst <= '1'
  if s_t <= tx_time then
   if s_t <= T1H then  
    s_out <= '1'
   elsif s_t > T1H and s_t <= T1L then
    s_out <= '0'
   end if ;
  end if;
 elsif s_in = '0' then 
   s_rst <= '0'
  if s_t <= tx_time then
   if s_t <= T0H then  
    s_out <= '1'
   elsif s_t > T0H and s_t <= T0L then
    s_out <= '0'
   end if ;
  end if;
 elsif refresh = '1' then
  s_out <= '0'
 end if;
end;

end Behav;



    





