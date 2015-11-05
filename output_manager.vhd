--output_manager.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity output_manager is
port( clk     :  in std_logic;--50Mhz
	    rst     :  in std_logic;
	    refresh :  in std_logic;--send refresh signal to the pixels 
	    input   :  in std_logic_vector(23 downto 0);
	    output  : out  std_logic);

end output_manager;

--time constraints still require further conversion
architecture Behav of output_manager is
constant T0H : integer := 4 ; --zero bit high level time constraint
constant T0L : integer := 85 ; --zero bit low level time constraint
constant T1H : integer := 8 ;  --zero bit high level time constraint
constant T1L : integer := 45 ;  --zero bit high level time constraint
constant t_reset : integer := 50 ; --reset time constraint
constant tx_time : integer := 125 ;
signal s_tx_time : integer :=tx_time;
signal s_idx,s_idx_next : integer range 0 to 23 := 0;
signal s_t, s_t_next : integer range 0 to tx_time;
signal s_rst : std_logic;
signal s_in : std_logic;

begin
  s_idx <= 0;

timing_proc : process (clk,s_rst,rst,s_t_next,s_t)
begin
 if rising_edge(clk) then  
  s_idx_next <= s_idx +1; 
  s_in <= input(s_idx_next);
  s_t_next <= s_t + 1;
 elsif rst = '1' then
  s_t_next <= 0;

 elsif s_rst = '1' then
  s_t_next <= 0;
 end if;
end process;

inout_proc : process(s_in,s_tx_time)  
begin
 if s_in = '1' then
  s_rst <= '1';
  if s_t <= s_tx_time then
   if s_t <= T1H then  
    output <= '1';
   elsif s_t > T1H and s_t <= T1L then
    output <= '0';
   end if ;
  end if;
 elsif s_in = '0' then 
   s_rst <= '0';
  if s_t <= s_tx_time then
   if s_t <= T0H then  
    output <= '1';
   elsif s_t > T0H and s_t <= T0L then
    output <= '0';
   end if ;
  end if;
 elsif refresh = '1' then
  output <= '0';
 end if;
end process;

end Behav;



    





