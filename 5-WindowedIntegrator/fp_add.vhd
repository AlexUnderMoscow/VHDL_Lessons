library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity add is
generic (
	Q: integer := 11;
	N: integer := 16
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
	if (a(N-1) = b(N-1)) then 												--	 same sign, 
		res(N-2 downto 0) <= a(N-2 downto 0) + b(N-2 downto 0);	--	 add the two numbers
		res(N-1) <= a(N-1);										
	elsif (a(N-1) = '0' and b(N-1) = '1') then	--	subtract a-b
		if (a(N-2 downto 0) >= b(N-2 downto 0)) then	--	if a is greater than b,
			res(N-2 downto 0) <= a(N-2 downto 0) - b(N-2 downto 0);	-- subtract b from a
			res(N-1) <= '0';			--	 set the sign to positive
		else								--	if a is less than b,
			res(N-2 downto 0) <= b(N-2 downto 0) - a(N-2 downto 0);	--	 subtract a from b
				res(N-1) <= '1';		--	 set the sign to negative
		end if;
	else									--	subtract b-a (a negative, b positive)
		if (a(N-2 downto 0) > b(N-2 downto 0))	then 	--	if a is greater than b,
			res(N-2 downto 0) <= a(N-2 downto 0) - b(N-2 downto 0);	--	 subtract b from a
			if (res(N-2 downto 0) = "0000000000000000") then				--?\_(?)_/?
				res(N-1) <= '0';		--	not negative zero....
			else
				res(N-1) <= '1';		--	 set the sign to negative
			end if;
		else	--	if a is less than b,
			res(N-2 downto 0) <= b(N-2 downto 0) - a(N-2 downto 0);	--	 subtract a from b
			res(N-1) <= '0';			--	 set the sign to positive
		end if;
	end if;

end process;
end rtl_add;