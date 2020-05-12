
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY gun_tb IS
END gun_tb;
 
ARCHITECTURE behavior OF gun_tb IS 
  
    COMPONENT gun
    PORT(
         freq : IN  std_logic_vector(31 downto 0);
         dfreq : IN  std_logic_vector(31 downto 0);
         sin_out : OUT  std_logic_vector(11 downto 0);
         cos_out : OUT  std_logic_vector(11 downto 0);
         clk : IN  std_logic;
         en : IN  std_logic
        );
    END COMPONENT;

   signal freq : std_logic_vector(31 downto 0) := (others => '0');
   signal dfreq : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal en : std_logic := '0';


   signal sin_out : std_logic_vector(11 downto 0);
   signal cos_out : std_logic_vector(11 downto 0);


 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gun PORT MAP (
          freq => freq,
          dfreq => dfreq,
          sin_out => sin_out,
          cos_out => cos_out,
          clk => clk,
          en => en
        );

   -- Clock process definitions
clk <= not clk after 5 ns;
 

   -- Stimulus process
   stim_proc: process
   begin		

      wait for 1000 ns;	
		en <= '1';
      freq <= x"00110010";
		dfreq <= x"00000010";
		
		wait for 1000 ns;
		dfreq <= x"00000000";
		wait for 10000 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
