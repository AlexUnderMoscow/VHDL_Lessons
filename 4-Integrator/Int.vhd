
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Int is
    Port ( 	inp 		: in  	std_logic_vector (15 downto 0);
				clk		: in 		std_logic;
				outp 		: out  	std_logic_vector (15 downto 0));
end Int;

architecture Behavioral of Int is

component add
generic (
	-- Number bits after point
	Q: integer := 11;
	-- Number bits "word"
	N: integer := 16
);	
port (
	-- Input ports
	a	: in std_logic_vector (N-1 downto 0);
	b	: in std_logic_vector (N-1 downto 0);
	-- Output port
	c	: out std_logic_vector (N-1 downto 0)
);
end component;
signal delay: std_logic_vector(15 downto 0):=x"0000";
signal wire: std_logic_vector(15 downto 0);
begin
	outp<= wire;
	process(clk)
	begin
		if rising_edge(clk) then
			delay <= wire;
		end if;
	end process;
	add1:add generic map (N => 16, Q=> 11) 
				port map(a=>inp, b=>delay , c=>wire);
end Behavioral;

