-- ============================================================ --
--					 					tcv2bin.vhd							 	 --
-- ============================================================ --
--																					 --
-- 	Convert direct into "additional code".							 --
--																					 --
-- ============================================================ --


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
-- Declaration tcv2bin
entity bin2tcv is
-- Size of "word"
generic (WIDTH: integer := 16);
port (
	-- Input
	x	: in std_logic_vector (WIDTH-1 downto 0);
	-- Output
	y	: out std_logic_vector (WIDTH-1 downto 0)
		);
end bin2tcv;

-- Description tcv2bin
architecture rtl_bin2tcv of bin2tcv is
-- Start
begin
process(x)
	begin
	if (x(WIDTH-1) = '1') then
		y <= x(WIDTH-1) & (not(x(WIDTH-2 downto 0)) + 1);
	else 
		y <= x;
	end if;
end process;
end rtl_bin2tcv;