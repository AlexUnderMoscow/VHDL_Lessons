-- ============================================================ --
--					 					tcv2bin.vhd							 	 --
-- ============================================================ --
--																					 --
-- 	Convert "additional code" into direct.							 --
--																					 --
-- ============================================================ --


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Declaration tcv2bin
entity tcv2bin is
-- Size of "word"
generic (WIDTH: integer := 16);

port (

	-- Input
	x	: in std_logic_vector (WIDTH-1 downto 0);
	
	-- Output
	y	: out std_logic_vector (WIDTH-1 downto 0)
	
		);
end tcv2bin;
-- Description tcv2bin
architecture rtl_tcv2bin of tcv2bin is
-- Start
begin
process(x)
	begin
	if (x(WIDTH-1) = '1') then
		y <= x(WIDTH-1) & not(x(WIDTH-2 downto 0) - 1);
	else 
		y <= x;
	end if;
end process;
end rtl_tcv2bin;