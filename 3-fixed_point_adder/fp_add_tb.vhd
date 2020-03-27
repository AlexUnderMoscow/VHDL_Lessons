
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY fp_add_tb IS
END fp_add_tb;
 
ARCHITECTURE behavior OF fp_add_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT add
    PORT(
         a : IN  std_logic_vector(15 downto 0);
         b : IN  std_logic_vector(15 downto 0);
         c : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(15 downto 0) := (others => '0');
   signal b : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal c : std_logic_vector(15 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: add PORT MAP (
          a => a,
          b => b,
          c => c
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
