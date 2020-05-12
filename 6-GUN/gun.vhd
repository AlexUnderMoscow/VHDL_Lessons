
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity gun is
    Port ( freq : in  STD_LOGIC_VECTOR (31 downto 0);
           dfreq : in  STD_LOGIC_VECTOR (31 downto 0);
           sin_out : out  STD_LOGIC_VECTOR (11 downto 0);
           cos_out : out  STD_LOGIC_VECTOR (11 downto 0);
			  clk : in std_logic;
           en : in  STD_LOGIC);
end gun;

architecture Behavioral of gun is
	component sinlut 
	    Port ( en : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (9 downto 0);
           sin : out  STD_LOGIC_VECTOR (11 downto 0)
			  );
	end component;
	
	component add 
	generic (
		Q: integer := 11;
		N: integer := 32
	);		
	port (
		a	: in std_logic_vector (N-1 downto 0);
		b	: in std_logic_vector (N-1 downto 0);
		c	: out std_logic_vector (N-1 downto 0)
	);
	end component;
	
	signal sum_phase: std_logic_vector(9 downto 0);
	signal tmp: std_logic_vector(9 downto 0);
	signal acc: std_logic_vector(31 downto 0):=x"00000000";
	signal freq_sum: std_logic_vector(31 downto 0);
	
begin
	process(clk)
	begin
		if rising_edge(clk) then
			acc <= acc+freq_sum;
		end if;
	end process;
	
	tmp <= acc(31 downto 22);
	sum_phase <= tmp + "0100000000";	-- 1 0000 0000 ... 256 = 1024/4
	
	sin: sinlut port map (en=>en, 
								addr => tmp, 
								sin => sin_out);
	cos: sinlut port map (en=>en, 
								addr=> sum_phase, 
								sin => cos_out);
	add1:add port map(a=>freq, 
							b=>dfreq , 
							c=>freq_sum);
end Behavioral;

