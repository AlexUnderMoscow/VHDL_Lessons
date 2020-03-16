
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mult_tb IS
END mult_tb;
ARCHITECTURE behavior OF mult_tb IS 

    COMPONENT mult
	 generic (
			Q: integer := 11;
			N: integer := 16
		);
    PORT(
         A : IN  std_logic_vector(N-1 downto 0);
         B : IN  std_logic_vector(N-1 downto 0);
         Y : OUT  std_logic_vector(N-1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0); --:= (others => '0')
   signal B : std_logic_vector(15 downto 0);

 	--Outputs
   signal Y : std_logic_vector(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mult
	generic map(N =>16, Q=>11)
	PORT MAP (
          A => A,
          B => B,
          Y => Y
        );

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 400 ns;
      A <= "0010100000000101"; --5,000...
		B <= "0001100000000011"; --3,000...
		wait for 400 ns;
      wait;
   end process;

END;
