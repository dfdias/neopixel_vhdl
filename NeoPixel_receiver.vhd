NeoPixel_receiver.vhd

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity NeoPixel_receiver is --this module will receive some data from serial port
port(clk :in std_logic;
	 )
end NeoPixel_receiver;

architecture Behav of NeoPixel_receiver is
signal
