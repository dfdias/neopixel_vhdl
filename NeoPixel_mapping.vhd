library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity NeoPixel_mapping is
generic (K : integer := 1);								--replace num_pixelf by the number of pixel connectedon the string 
port(clk_50		:  in std_logic;
	 sw  			:  in std_logic_vector(3 downto 0);
	 pin_out 	: out std_logic);
end NeoPixel_mapping;

architecture Behav of NeoPixel_mapping is
signal s_clk : std_logic;
signal s_raw_out : std_logic_vector(23 downto 0);
signal s_refresh : std_logic;

begin
s_clk <= clk_50;

controller: entity work.controller(behavioral)
	--generic map(N => 1);
	port map(clk => s_clk,
			   rst => sw(0),
			   sw  => sw(3 downto 1),
			   refresh => s_refresh,
			   data_out =>s_raw_out);

pixel_decoder: entity work.output_manager(Behav)
	port map(
		    clk => clk_50,
			 refresh =>s_refresh,
			 input =>s_raw_out,
			 rst => '0',
			 output => pin_out);

end Behav;
