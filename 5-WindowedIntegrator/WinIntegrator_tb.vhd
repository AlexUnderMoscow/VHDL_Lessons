
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY WinIntegrator_tb IS
END WinIntegrator_tb;
 
ARCHITECTURE behavior OF WinIntegrator_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WinIntegrator
    PORT(
         x : IN  std_logic_vector(15 downto 0);
         clk : IN  std_logic;
         y : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal y : std_logic_vector(15 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WinIntegrator PORT MAP (
          x => x,
          clk => clk,
          y => y
        );


	clk <= not clk after 5 ns;


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x<=x"0001";
		wait for 100 ns;
		x<=x"0002";
		wait for 100 ns;
		x<=x"0003";
		wait for 100 ns;
		x<=x"0000";
		wait for 100 ns;

      wait;
   end process;

END;
