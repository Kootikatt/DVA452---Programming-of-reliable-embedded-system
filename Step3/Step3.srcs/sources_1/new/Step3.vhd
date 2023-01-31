library IEEE;
use IEEE.std_logic_1164.all;

entity FI is
    port (
        A, B, FL           : in std_logic_vector(3 downto 0); 
        OP                 : in std_logic_vector(2 downto 0); -- operation
        FOP                : out std_logic_vector(2 downto 0);-- Fault operation
        FA, FB             : out std_logic_vector(3 downto 0) -- Fault A, B
                  
        );
end FI;



architecture FI_F of FI is

begin
process(A, B, FL, OP)
    begin
      
      
        if (FL = "0000") then FA <= A; FA(0) <= not A(0);  FB <= B;  FOP <= OP;
     elsif (FL = "0001") then FA <= A; FA(1) <= not A(1);  FB <= B;  FOP <= OP;
     elsif (FL = "0010") then FA <= A; FA(2) <= not A(2);  FB <= B;  FOP <= OP;
     elsif (FL = "0011") then FA <= A; FA(3) <= not A(3);  FB <= B;  FOP <= OP;
    
     elsif (FL = "0100") then FA <= A;  FB <= B ;FB(0) <= not B(0);  FOP <= OP;
     elsif (FL = "0101") then FA <= A;  FB <= B; FB(1) <= not B(1);  FOP <= OP;
     elsif (FL = "0110") then FA <= A;  FB <= B; FB(2) <= not B(2);  FOP <= OP;
     elsif (FL = "0111") then FA <= A;  FB <= B; FB(3) <= not B(3);  FOP <= OP;
      
     elsif (FL = "1000") then FA <= A; FB <= B; FOP <= OP; FOP(0) <= not OP(0);
     elsif (FL = "1001") then FA <= A; FB <= B; FOP <= OP; FOP(1) <= not OP(1);
     elsif (FL = "1010") then FA <= A; FB <= B; FOP <= OP; FOP(2) <= not OP(2);
      else FA <= a; FB <= b; FOP <= op; 
        
      end if;
   end process;

end  FI_F ;






                                      -- Test Bench --

library IEEE;
use IEEE.std_logic_1164.all;

entity FI_TB is end; 

architecture FI_Test of FI_TB is
    
    component FI is
        port(
          A, B, FL            : in  std_logic_vector(3 downto 0); -- input b and b and Fault location
          OP                  : in  std_logic_vector(2 downto 0); -- operation
          FOP                 : out std_logic_vector(2 downto 0);-- Fault operation
          FA, FB              : out std_logic_vector(3 downto 0) -- Fault A and B
        );
    end component;
    
         signal A, B, FL, FA, FB       :  std_logic_vector(3 downto 0); 
         signal OP, FOP                  :  std_logic_vector(2 downto 0); 
       
 begin
    ENTITY_INCTANCE : FI
    port map(A, B, FL, OP, FOP, FA, FB);
        
   process is
    begin
    --A
    A <= "0000"; B <= "1010"; OP <= "101";
    FL <= "0000";
    wait for 10 ps;
    
    A <= "0000"; B <= "1010"; OP <= "101";
    FL <= "0001";
    wait for 10 ps;
    
    A <= "0000"; B <= "1010"; OP <= "101";
    FL <= "0010";
    wait for 10 ps;
   
    A <= "0000"; B <= "1010"; OP <= "101";
    FL <= "0011";
    wait for 10 ps;
   
    --B
    A <= "1010"; B <= "0000"; OP <= "101"; 
    FL <= "0100";
    wait for 10 ps;
    
     A <= "1010"; B <= "0000"; OP <= "101"; 
     FL <= "0101";
    wait for 10 ps;
    
     A <= "1010"; B <= "0000"; OP <= "101"; 
     FL <= "0110";
    wait for 10 ps;
    
     A <= "1010"; B <= "0000"; OP <= "101"; 
     FL <= "0111";
    wait for 10 ps;
    
    --OP 
    A <= "1010"; B <= "1010"; OP <= "000";
    FL <= "1000";
    wait for 10 ps;
    
    A <= "1010"; B <= "1010"; OP <= "000";
    FL <= "1001";
    wait for 10 ps;
    
    A <= "1010"; B <= "1010"; OP <= "000";
    FL <= "1010";
    wait for 10 ps;
    
    A <= "1010"; B <= "1010"; OP <= "111";
    FL <= "1010";
    wait for 10 ps;
    
    A <= "1001"; B <= "1010"; OP <= "111";
    FL <= "1001";
    wait for 10 ps;
    
    A <= "1000"; B <= "1010"; OP <= "111";
    FL <= "1000";
    wait for 10 ps;
 
         wait;
end process;  
end FI_Test;