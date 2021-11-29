-- Iara de Melo Dantas Bezerra							|
------------------------------------------------------|

LIBRARY IEEE; -- 1° > Importar a biblioteca IEEE e os Pacotes necessários
USE IEEE.STD_LOGIC_1164.ALL; 		-- Pac. p/ def. de tipos de dados
USE IEEE.STD_LOGIC_UNSIGNED.ALL; -- Pac. p/ operações

ENTITY ula IS PORT ( -- 2° > Criar a entidade lógica
	ent_a, ent_b   : IN   STD_LOGIC_VECTOR(3 DOWNTO 0); -- Entradas
	fixo_a, fixo_b : OUT  STD_LOGIC_VECTOR(6 DOWNTO 0); -- Displays Fixos
	fixo_1, fixo_2 : OUT  STD_LOGIC_VECTOR(6 DOWNTO 0); -- Displays Fixos
	fixo_3, Led_s	: OUT  STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display Fixo / Display saida
	Led_a, Led_b   : OUT  STD_LOGIC_VECTOR(6 DOWNTO 0); -- Display variavel
	saida  			: OUT  STD_LOGIC_VECTOR(3 DOWNTO 0); -- Saida
	OP_som, OP_sub 	 : IN  STD_LOGIC; -- Operações
	OP_or, OP_and		 : IN  STD_LOGIC  -- Operações
);
END ENTITY;

architecture hardware OF ula IS -- 3º > Criar a parte física.
BEGIN

process(ent_a,ent_b, OP_som, OP_sub, OP_or, OP_and) --4° > Executar o processo

	variable saida_ghost : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Saida fantasma
	BEGIN	
	-- Fixar os displays
	fixo_a <= "1000000";
	fixo_b <= "1000000";	
	fixo_1 <= "1000000";
	fixo_2 <= "1000000";
	fixo_3 <= "1000000";
	
	case ent_a is -- Determinar Led_a
		when "0000" => Led_a <= "1000000";
		when "0001" => Led_a <= "1111001";
		when "0010" => Led_a <= "0100100";
		when "0011" => Led_a <= "0110000";
		when "0100" => Led_a <= "0011001";
		when "0101" => Led_a <= "0010010";
		when "0110" => Led_a <= "0000010";
		when "0111" => Led_a <= "0111000";
		when "1000" => Led_a <= "0000000";
		when "1001" => Led_a <= "0010000";
		when "1010" => Led_a <= "0001000";
		when "1011" => Led_a <= "0000011";
		when "1100" => Led_a <= "0100111";
		when "1101" => Led_a <= "0100001";
		when "1110" => Led_a <= "0000110";
		when "1111" => Led_a <= "0001110";
		when others => Led_a <= "0111111";
	end case;	
	
	case ent_b is -- Determinar Led_b
		when "0000" => Led_b <= "1000000";
		when "0001" => Led_b <= "1111001";
		when "0010" => Led_b <= "0100100";
		when "0011" => Led_b <= "0110000";
		when "0100" => Led_b <= "0011001";
		when "0101" => Led_b <= "0010010";
		when "0110" => Led_b <= "0000010";
		when "0111" => Led_b <= "0111000";
		when "1000" => Led_b <= "0000000";
		when "1001" => Led_b <= "0010000";
		when "1010" => Led_b <= "0001000";
		when "1011" => Led_b <= "0000011";
		when "1100" => Led_b <= "0100111";
		when "1101" => Led_b <= "0100001";
		when "1110" => Led_b <= "0000110";
		when "1111" => Led_b <= "0001110";
		when others => Led_b <= "0111111";
	end case;	

	-- Testes de operações com as entradas
	if(OP_som='1')then
		saida_ghost := ent_a + ent_b;
	end if;
	
	if(OP_sub='1')then
		saida_ghost := ent_a - ent_b;
	end if;
	
	if(OP_or='1')then
		saida_ghost := ent_a OR ent_b;
	end if;
	
	if(OP_and='1')then
		saida_ghost := ent_a AND ent_b;		
	end if;
	
	case saida_ghost is -- Determinar saida
		when "0000" => led_s <= "1000000";
		when "0001" => led_s <= "1111001";
		when "0010" => led_s <= "0100100";
		when "0011" => led_s <= "0110000";
		when "0100" => led_s <= "0011001";
		when "0101" => led_s <= "0010010";
		when "0110" => led_s <= "0000010";
		when "0111" => led_s <= "0111000";
		when "1000" => led_s <= "0000000";
		when "1001" => led_s <= "0010000";
		when "1010" => led_s <= "0001000";
		when "1011" => led_s <= "0000011";
		when "1100" => led_s <= "0100111";
		when "1101" => led_s <= "0100001";
		when "1110" => led_s <= "0000110";
		when "1111" => led_s <= "0001110";
		when others => led_s <= "0111111";
	end case;
END PROCESS; -- 5º > Encerrar o processo
END HARDWARE; -- 6º > Encerrar a parte física.