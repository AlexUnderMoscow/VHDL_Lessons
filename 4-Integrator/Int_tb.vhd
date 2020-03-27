
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Int_tb IS
END Int_tb;
 
ARCHITECTURE behavior OF Int_tb IS 
 
    COMPONENT Int
    PORT(
         inp : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         outp : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inp : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal outp : std_logic_vector(15 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Int PORT MAP (
          inp => inp,
          clk => clk,
          outp => outp
        );

clk<=not clk after 5 ns;
 

   -- Stimulus process
   stim_proc: process
   begin		
		inp <= x"0001";
   wait;
   end process;

END;
