library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity add is
generic (
	Q: integer := 11;
	N: integer := 32
);		
port (
	a	: in std_logic_vector (N-1 downto 0);
	b	: in std_logic_vector (N-1 downto 0);
	c	: out std_logic_vector (N-1 downto 0)
);
end add;
architecture rtl_add of add is
signal res	: std_logic_vector (N-1 downto 0);
begin
	c <= res;
process (a,b)
	begin
	-- both negative or both positive
	if (a(N-1) = b(N-1)) then 		--	Since they have the same sign, absolute magnitude increases
		res(N-2 downto 0) <= a(N-2 downto 0) + b(N-2 downto 0);	--	So we just add the two numbers
		res(N-1) <= a(N-1);			--	and set the sign appropriately...  Doesn't matter which one we use,
											--	they both have the same sign
											--	Do the sign last, on the off-chance there was an overflow..						
											--	Not doing any error checking on this...
											--	one of them is negative...
	elsif (a(N-1) = '0' and b(N-1) = '1') then	--	subtract a-b
		if (a(N-2 downto 0) >= b(N-2 downto 0)) then	--	if a is greater than b,
			res(N-2 downto 0) <= a(N-2 downto 0) - b(N-2 downto 0);	-- then just subtract b from a
			res(N-1) <= '0';			--	and manually set the sign to positive
		else								--	if a is less than b,
			res(N-2 downto 0) <= b(N-2 downto 0) - a(N-2 downto 0);	--	we'll actually subtract a from b to avoid a 2's complement answer	
				res(N-1) <= '1';		--	and manually set the sign to negative
		end if;
	else									--	subtract b-a (a negative, b positive)
		if (a(N-2 downto 0) > b(N-2 downto 0))	then 	--	if a is greater than b,
			res(N-2 downto 0) <= a(N-2 downto 0) - b(N-2 downto 0);	--	we'll actually subtract b from a to avoid a 2's complement answer
			if (res(N-2 downto 0) = x"00000000") then
				res(N-1) <= '0';		--	I don't like negative zero....
			else
				res(N-1) <= '1';		--	and manually set the sign to negative
			end if;
		else	--	if a is less than b,
			res(N-2 downto 0) <= b(N-2 downto 0) - a(N-2 downto 0);	--	then just subtract a from b
			res(N-1) <= '0';			--	and manually set the sign to positive
		end if;
	end if;

end process;
end rtl_add;