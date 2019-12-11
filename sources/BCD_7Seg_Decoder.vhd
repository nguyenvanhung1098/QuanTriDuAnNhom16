library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

-- --------------------------------------------------------------
-- @brief   Bo giai ma Led 7 doan
-- @remark  Cac chan vao ra se duoc assign vao cac pin co dinh
--          tren kit Actel ProASIC3 A3P250-PQ208 nhu ben duoi    
-- --------------------------------------------------------------
entity DM74LS47 is
    port (
        Ain: in std_logic;   -- Pin 58, 
        Bin: in std_logic;   -- Pin 59, 
        Cin: in std_logic;   -- Pin 60, 
        Din: in std_logic;   -- Pin 61, 
        a  : out std_logic;  -- Pin 30
        b  : out std_logic;  -- Pin 28
        c  : out std_logic;  -- Pin 45
        d  : out std_logic;  -- Pin 47 
        e  : out std_logic;  -- Pin 49
        f  : out std_logic;  -- Pin 32
        g  : out std_logic   -- Pin 34
    );
end DM74LS47;

-- --------------------------------------------------------------
-- @brief   Kien truc hoat dong cua bo giai ma Led 7 doan
-- --------------------------------------------------------------
architecture behaviour of DM74LS47 is
begin
    process (Ain,Bin,Cin,Din)
    -- Gia tri interget tuong ung voi cac bit dau VAO, ung voi Ain -> Din
    variable mergedbits_in: std_logic_vector(3 downto 0); 
        -- Gia tri interget tuong ung voi cac bit dau RA, ung voi a -> g
    variable mergedbits_out: std_logic_vector(0 to 6); 
    begin
        -- Chuyen cac bit roi rac --> chuoi bit cho tien xu ly
        mergedbits_in := Din & Cin & Bin & Ain;
        -- Giai ma 7 doan
        case  (mergedbits_in) is
          when "0000" => mergedbits_out := "0111111";  -- 3F
          when "0001" => mergedbits_out := "0000110";  -- 06
          when "0010" => mergedbits_out := "1011011";  -- 5B
          when "0011" => mergedbits_out := "1001111";  -- 4F
          when "0100" => mergedbits_out := "1100110";  -- 66
          when "0101" => mergedbits_out := "1101101";  -- 6D
          when "0110" => mergedbits_out := "1111101";  -- 7D
          when "0111" => mergedbits_out := "0000111";  -- 07

          when "1000" => mergedbits_out := "1111111";  -- 7F
          when "1001" => mergedbits_out := "1101111";  -- 6F
          when "1010" => mergedbits_out := "1110111";  -- 77
          when "1011" => mergedbits_out := "1111100";  -- 7C
          when "1100" => mergedbits_out := "0111001";  -- 39
          when "1101" => mergedbits_out := "1011110";  -- 5E
          when "1110" => mergedbits_out := "1111001";  -- 79
          when "1111" => mergedbits_out := "1110001";  -- 71

          when others => mergedbits_out := "0000000";
       end case;
       -- Chuyen chuoi bit sau giai ma --> cac bit dau ra
       a <= not mergedbits_out(6);
       b <= not mergedbits_out(5);
       c <= not mergedbits_out(4);
       d <= not mergedbits_out(3);
       e <= not mergedbits_out(2);
       f <= not mergedbits_out(1);
       g <= not mergedbits_out(0);
    end process;
end behaviour;
