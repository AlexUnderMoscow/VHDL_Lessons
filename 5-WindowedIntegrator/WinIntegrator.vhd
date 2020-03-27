-- Windowed intergrator 4 samples line, tree-like adders construction

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity WinIntegrator is
    Port ( x : in  STD_LOGIC_VECTOR (15 downto 0);
           clk : in  STD_LOGIC;
           y : out  STD_LOGIC_VECTOR (15 downto 0));
end WinIntegrator;

architecture Behavioral of WinIntegrator is
component add
generic (
	Q: integer := 11;
	N: integer := 16
);	
port (
	a	: in std_logic_vector (N-1 downto 0);
	b	: in std_logic_vector (N-1 downto 0);
	c	: out std_logic_vector (N-1 downto 0)
);
end component;

signal wire1, wire2 : std_logic_vector(15 downto 0);
type delay is array (3 downto 0) of std_logic_vector (15 downto 0); -- (0 to 3) was on Lection -ERROR!
signal delay_line: delay;

begin

process(clk)
begin
	if rising_edge(clk) then		
		delay_line <= x & delay_line(3 downto 1);  --  & signals concatenation
	end if;
end process;	
	
	add1: add port map (a=>delay_line(3),b=>delay_line(2),c=>wire1);
	add2: add port map (a=>delay_line(1),b=>delay_line(0),c=>wire2);
	add3: add port map (a=>wire1,b=>wire2,c=>y);

end Behavioral;

