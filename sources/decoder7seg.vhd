-------------------------------------------------------------------------------
--
-- Title       : decoder7seg
-- Design      : Runtime
-- Author      : Nguyen Duc Tien
-- Company     : Home
--
-------------------------------------------------------------------------------
--
-- File        : 7seg-decoder.vhd
-- Generated   : Thu Sep 10 15:33:00 2015
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.20
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {decoder7seg} architecture {decoder7seg}}

library IEEE;
use IEEE.STD_LOGIC_1164.all;		
use IEEE.STD_LOGIC_UNSIGNED.all;

------------------------------------------------------------------
-- Bo giai ma cho led 7 doan loai chung Anode(+) hay la chung Cathode(-)
-- Neu muon bo giai ma co them tin hieu dieu khien, cho phep chon 
-- hoac Anode, hoac Cathode thi lam the nao
------------------------------------------------------------------
entity decoder7seg is
	 port(
		 I : in STD_LOGIC_VECTOR(3 downto 0);
		 a : out STD_LOGIC;
		 b : out STD_LOGIC;
		 c : out STD_LOGIC;
		 d : out STD_LOGIC;
		 e : out STD_LOGIC;
		 f : out STD_LOGIC;
		 g : out STD_LOGIC 
	     );
end decoder7seg;

------------------------------------------------------
-- Thiet ke theo kieu su dung cau truc ROM
------------------------------------------------------
architecture behavior of decoder7seg is	   
	signal tmp: STD_LOGIC_VECTOR(6 downto 0);
begin  
	------------------------------------------------------
	-- Giai ma da tin hieu dau vao --> da tin hieu 7 doan
	------------------------------------------------------
	decode:process (I)
	begin	
		case I is 
			when "0000"	=> tmp <= "0000001";	   
			when "0001"	=> tmp <= "1001111";	  
			when "0010"	=> tmp <= "0010010";	  
			when "0011"	=> tmp <= "0000110";
			when "0100"	=> tmp <= "1001100";
			when "0101"	=> tmp <= "0100100";	  
			when "0110"	=> tmp <= "0100000";	  
			when "0111"	=> tmp <= "0001111";	 
			when "1000"	=> tmp <= "0000000";	   
			when "1001"	=> tmp <= "0000100";	  
			when "1010"	=> tmp <= "0000010";	  
			when "1011"	=> tmp <= "1100000";
			when "1100"	=> tmp <= "0110001";
			when "1101"	=> tmp <= "1000010";	  
			when "1110"	=> tmp <= "0010000";	  
			when "1111"	=> tmp <= "0111000";	
			when others	=> tmp <=(others => 'Z');
		end case;
	end process decode;	
	------------------------------------------------------
	-- Phan tach  da tin hieu 7 doan thanh cac chan pin rieng re
	------------------------------------------------------
	a <= tmp(0);
	b <= tmp(1);
	c <= tmp(2);
	d <= tmp(3);
	e <= tmp(4);
	f <= tmp(5);
	g <= tmp(6);
end behavior;	  	

------------------------------------------------------
-- Thiet ke theo kieu chuyen doi sang so nguyen
------------------------------------------------------
architecture convert of decoder7seg is
begin
	integerprocess: process (I)	
	variable value : integer;
	begin
		value := CONV_INTEGER(I);	 
		--  Giai ma doan   a
		if (value = 0) or (value = 2) or (value = 3) or (value = 5) or (value = 6) 
			or (value = 7) or (value = 8) or (value = 9) or (value = 13) then
			a <= '0';
		else
			a <= '1';
		end if;
		--  Giai ma doan   b
		if (value = 0) or (value = 1) or (value = 2) or (value = 3) or (value = 4) 
			or (value = 7) or (value = 8) or (value = 9) or (value = 12) then
			b <= '0';
		else
			b <= '1';
		end if;
		--  Giai ma doan   c
		if (value = 0) or (value = 1) or (value = 3) or (value = 4) or (value = 5)   
			or (value = 6) or (value = 7) or (value = 8) or (value = 9)	or (value = 11) then
			c <= '0';
		else
			c <= '1';
		end if;		
				--  Giai ma doan   d
		if (value = 0) or (value = 2) or (value = 3) or (value = 5) or (value = 6)   
			or (value = 8) or (value = 10) or (value = 11) or (value = 13) or (value = 14) then
			d <= '0';
		else
			d <= '1';
		end if;			 
		--  Giai ma doan   e
		if (value = 0) or (value = 2) or (value = 6) or (value = 8) or (value = 10) or (value = 14) then
			e <= '0';
		else
			e <= '1';
		end if;	   
		--  Giai ma doan   f
		if (value = 0) or (value = 4) or (value = 5) or (value = 6) or (value = 8)   
			or (value = 9) or (value = 12) or (value = 13) or (value = 14) then
			f <= '0';
		else
			f <= '1';
		end if;			   
		--  Giai ma doan   g
		if (value = 2) or (value = 3) or (value = 4) or (value = 5) or (value = 6)   
			or (value = 8) or (value = 9) or (value = 10) or (value = 11) or (value = 12) or (value = 13) or (value = 14)then
			g <= '0';
		else
			g <= '1';
		end if;	
	end process integerprocess;	
end	 convert;