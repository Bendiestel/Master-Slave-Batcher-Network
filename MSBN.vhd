library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity MSBN is
		Port (In_1, In_2, In_3, In_4, In_5, In_6, In_7, In_8 : in std_logic_vector(4 downto 0);
		Out_1, Out_2, Out_3, Out_4, Out_5, Out_6, Out_7, Out_8 : out std_logic_vector(2 downto 0));
		end MSBN;
		
architecture Structural of MSBN is
-- Sorter
	component g90_SO 
		Port (
        In1, In2 : in std_logic_vector(4 downto 0);
        Out1, Out2 : out std_logic_vector(4 downto 0);
        Permutation_out : out std_logic
    );
	end component g90_SO;
	--Switch 
	component SW
		 Port (
        Idx1, Idx2 : in std_logic_vector(2 downto 0);
        Permutation_in : in std_logic;
		  Out_idx1, Out_idx2 : out std_logic_vector(2 downto 0)
    );
		end component SW;
--signal Declaration		
		signal t1, t2, t3, t4, t5, t6, t7, t8: std_logic_vector(4 downto 0);
		signal w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17, w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30: std_logic_vector(4 downto 0);
		signal b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19: std_logic;
		signal z1, z2, z3, z4, z5, z6, z7, z8: std_logic_vector(2 downto 0);
		signal j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15, j16, j17, j18, j19, j20 , j21, j22, j23, j24, j25, j26, j27, j28, j29, j30: std_logic_vector(2 downto 0);
		
		
		
-- Master Network	
begin
SO1: g90_SO port map (In1 => In_1, In2 => In_2, Out1 => w1, Out2 => w2, Permutation_out => b1);
SO2: g90_SO port map (In1 => In_3, In2 => In_4, Out1 => w3, Out2 =>w4, Permutation_out => b2);
SO3: g90_SO port map (In1 => In_5, In2 => In_6, Out1 => w5, Out2 =>w6, Permutation_out => b3);
SO4: g90_SO port map (In1 => In_7, In2 => In_8, Out1 => w7, Out2 =>w8, Permutation_out => b4);
SO5: g90_SO port map (In1 => w1, In2 => w5, Out1 => w9, Out2 =>w10,Permutation_out  => b5);
SO6: g90_SO port map (In1 => w3,In2 =>  w7,Out1 =>  w11, Out2 =>w12,Permutation_out  => b6);
SO7: g90_SO port map (In1 => w2, In2 => w6, Out1 => w13, Out2 =>w14, Permutation_out => b7);
SO8: g90_SO port map (In1 => w4, In2 => w8, Out1 => w15, Out2 => w16,Permutation_out =>  b8);
SO9: g90_SO port map (In1 => w9, In2 =>  w11, Out1 => w17, Out2 =>t5,Permutation_out  => b9);
SO10: g90_SO port map (In1 => w10, In2 =>  w13, Out1 => w18, Out2 =>w19, Permutation_out => b10);
SO11: g90_SO port map (In1 => w12,In2 =>  w15, Out1 => w20, Out2 =>w21,Permutation_out  => b11);
SO12: g90_SO port map (In1 => w14, In2 => w16, Out1 => w22, Out2 =>t2, Permutation_out => b12);
SO13: g90_SO port map (In1 => w18,In2 =>  w20, Out1 => w23,Out2 => w24, Permutation_out => b13);
SO14: g90_SO port map (In1 => w19,In2 =>  w21, Out1 => w25, Out2 =>w26, Permutation_out => b14);
SO15: g90_SO port map (In1 => w17,In2 =>  w25, Out1 => w27,Out2 => w28, Permutation_out => b15);
SO16: g90_SO port map (In1 => w24,In2 =>  w23, Out1 => w29, Out2 =>w30, Permutation_out => b16);
SO17: g90_SO port map (In1 => w27,In2 =>  w23, Out1 => t7, Out2 =>t8,Permutation_out  => b17);
SO18: g90_SO port map (In1 => w29,In2 =>  w28, Out1 => t3, Out2 =>t4, Permutation_out => b18);
SO19: g90_SO port map (In1 => w26, In2 => w30, Out1 => t1, Out2 =>t6, Permutation_out => b19);

t1 <= In_1;
t2 <= In_2;
t3 <= In_3;
t4 <= In_4;
t5 <= In_5;
t6 <= In_6;
t7 <= In_7;
t8 <= In_8;

--Slave Network
SW1: SW port map (Idx1 => z7,Idx2 => z6,Permutation_in => b17,Out_idx1=> j1, Out_idx2=> j2);
SW2: SW port map (Idx1 =>z5,Idx2 => z4,Permutation_in => b18,Out_idx1=>  j3,Out_idx2=>  j4);
SW3: SW port map (Idx1 =>z3, Idx2 =>z2,Permutation_in => b19,Out_idx1=>  j5,Out_idx2=>  j6);
SW4: SW port map (Idx1 =>j1, Idx2 =>j4,Permutation_in => b15,Out_idx1=>  j7,Out_idx2=>  j8);
SW5: SW port map (Idx1 =>j3, Idx2 =>j6,Permutation_in => b16,Out_idx1=>  j9,Out_idx2=>  j10);
SW6: SW port map (Idx1 =>j2, Idx2 =>j9,Permutation_in => b13,Out_idx1=>  j11,Out_idx2=>  j12);
SW7: SW port map (Idx1 =>j8, Idx2 =>z5,Permutation_in => b14,Out_idx1=>  j13,Out_idx2=>  j14);
SW8: SW port map (Idx1 =>j8, Idx2 =>z7,Permutation_in => b9,Out_idx1=>  j15,Out_idx2=>  j16);
SW9: SW port map (Idx1 =>j11, Idx2 =>j13,Permutation_in => b10,Out_idx1=>  j17,Out_idx2=>  j18);
SW10: SW port map (Idx1 =>j12, Idx2 =>j14,Permutation_in => b11,Out_idx1=>  j19,Out_idx2=>  j20);
SW11: SW port map (Idx1 =>j10, Idx2 =>z1,Permutation_in => b12,Out_idx1=>  j21,Out_idx2=>  j22);
SW12: SW port map (Idx1 =>j15, Idx2 =>j17,Permutation_in => b5,Out_idx1=>  j23,Out_idx2=>  j24);
SW13: SW port map (Idx1 =>j16, Idx2 =>j19,Permutation_in => b6,Out_idx1=>  j25,Out_idx2=>  j26);
SW14: SW port map (Idx1 => j18,Idx2 => j21,Permutation_in => b7,Out_idx1=>  j27,Out_idx2=>  j28);
SW15: SW port map (Idx1 => j20,Idx2 => j22,Permutation_in => b8,Out_idx1=>  j29,Out_idx2=>  j30);
SW16: SW port map (Idx1 => j23,Idx2 => j27,Permutation_in => b1,Out_idx1=>  z3, Out_idx2=> z1);
SW17: SW port map (Idx1 => j25,Idx2 => j29,Permutation_in => b2,Out_idx1=>  z5,Out_idx2=>  z4);
SW18: SW port map (Idx1 => j24,Idx2 => j28,Permutation_in => b3,Out_idx1=>  z8,Out_idx2=>  z2);
SW19: SW port map (Idx1 => j29,Idx2 => j30,Permutation_in => b4,Out_idx1=>  z7,Out_idx2=>  z6);

out_1 <= z1;
Out_2 <= z2;
Out_3 <= z3;
Out_4 <= z4;
Out_5 <= z5;
Out_6 <= z6;
Out_7 <= z7;
Out_8 <= z8;

end Structural; 
		