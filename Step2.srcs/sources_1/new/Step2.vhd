library ieee;
use ieee.std_logic_1164.all;
use Ieee.NUMERIC_STD.ALL;

entity ArithLogic is
    port( 
        A, B : in std_logic_vector (3 downto 0);
        AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero : out std_logic_vector(3 downto 0)
        
        );
end ArithLogic;

architecture A_F of ArithLogic is
begin
    AplusB <= std_logic_vector( signed(A) + signed(B));
    AandB <= A AND B;
    AxorB <= A XOR B;
    AnandB <= A NAND B;
    APlusOne <= std_logic_vector( signed(A)+ "0001");
    Ao <= A;
    Bo <= B;
    ALLZero <="0000";
end A_F;

--TB--
library ieee;
use ieee.std_logic_1164.all;

Entity tb is
end;

architecture Arth_tb of tb is
component ArithLogic is
    port(
        A, B: in std_logic_vector (3 downto 0);
        AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero : out std_logic_vector(3 downto 0)
        );
end component;

signal A, B: std_logic_vector(3 downto 0);
signal AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero : std_logic_vector(3 downto 0);

begin Entity_instance: ArithLogic
       port map(A, B, AplusB, AandB, AxorB, AnandB, APlusOne, Ao, Bo, AllZero);
       
 process is
 begin
    
    
        A  <= "0000";  B  <= "1001";
        wait for 10 ps;
        
        
        A  <= "0010";  B  <= "1000";
        wait for 10 ps;
           
         
        A  <= "0011"; B  <= "0111";
        wait for 10 ps;
         
        
        A  <= "0100";  B  <= "0110";
        wait for 10 ps;
        
        
       
        A  <= "0101"; B  <= "0101";
        wait for 10 ps;
        
       
        A  <= "0110"; B  <= "0100";
        wait for 10 ps;
        
       
        A  <= "0111"; B  <= "0011";
        wait for 10 ps;
        
       
        A  <= "1000"; B  <= "0010";
        wait for 10 ps;
        
       
        A  <= "1001"; B  <= "0001";
        wait for 10 ps;
        
       
        A  <= "1010"; B  <= "0000";
        wait;
        
    
    
 end process;
end Arth_tb;





