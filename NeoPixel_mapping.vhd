--NeoPixel_mapping.vhd

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all

NeoPixel_mapping is
generic (K := num_pixels)								--replace num_pixelf by the number of pixel connectedon the string 
port(clk50		:  in stdlogic;
	 sw  		:  in std_logic_vector(3 downto 0);
	 pin_out 	: out std_logic);
end;

architecture Behav of NeoPixel_mapping is
signal s_clk is std_logic;
signal s_raw_out is std_logic;
signal s_refresh is std_logic;

begin

Controller: entity.work.NeoPixel_controller(Behav)
	generic port(N => K);
	port map (clk => clk50;
			  rst => sw(0);
			  sw  => sw(3 downto 1);
			  refresh => s_refresh;
			  data_out =>s_out);

Pixel_decoder: entity.work.output_manager(Behav)
	port map(clk => clk50;
			 refresh =>s_refresh;
			 input =>s_raw_out;
			 output => pin_out);

end Behav;
