
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mult is
generic (
	Q: integer := 11;
	N: integer := 16
		);
port (
	A	: in std_logic_vector (N-1 downto 0);
	B	: in std_logic_vector (N-1 downto 0);
   Y	: out std_logic_vector (N-1 downto 0)
	);		
end mult;
architecture rtl_mult of mult is
signal wire_mult1	: std_logic_vector (N-2 downto 0);
signal wire_mult2	: std_logic_vector (N-2 downto 0);
signal res        : std_logic_vector (2*N-3 downto 0); --temp result 30 bit!
begin
   wire_mult1 <= A(N-2 downto 0);
   wire_mult2 <= B(N-2 downto 0);
   res <= wire_mult1 * wire_mult2;
   Y(N-1) <= A(N-1) xor B(N-1);
   Y(N-2 downto 0) <= res(N-2+Q downto Q);
end rtl_mult;