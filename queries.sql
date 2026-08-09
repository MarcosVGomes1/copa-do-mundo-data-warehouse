CREATE DATABASE IF NOT EXISTS copa_mundo;


USE copa_mundo;


CREATE OR REPLACE TABLE dim_jogadores (
    id_jogador INT PRIMARY KEY,
    nome_jogador VARCHAR(100)
)
USING DELTA;


CREATE OR REPLACE TABLE dim_selecao (
    id_selecao INT PRIMARY KEY,
    nome_selecao VARCHAR(100),
    continente VARCHAR(100),
    primeira_participacao INT
)
USING DELTA;


CREATE OR REPLACE TABLE dim_tempo (
    id_tempo INT PRIMARY KEY,
    ano int
)
USING DELTA;


CREATE OR REPLACE TABLE dim_posicao (
    id_posicao INT PRIMARY KEY,
    geral_posicao VARCHAR(3),
    setor_posicao VARCHAR(100)
    )
USING DELTA;


CREATE OR REPLACE TABLE dim_clube (
    id_clube INT PRIMARY KEY,
    nome_clube VARCHAR(100),
    pais_clube VARCHAR(100),
    sigla_clube VARCHAR(3)
)
USING DELTA;


CREATE OR REPLACE TABLE fato_resultado (
    id_resultado INT PRIMARY KEY,
    id_selecao INT,
    id_tempo INT,
    id_jogador INT,
    id_posicao INT,
    id_clube INT,
    gols INT,
    assistencia INT,
    amarelo_cartao INT,
    vermelho_cartao INT,
    idade_epoca INT,
    partidas_jogadas INT,
    foreign key (id_selecao) references dim_selecao(id_selecao),
    foreign key (id_tempo) references dim_tempo(id_tempo),
    foreign key (id_jogador) references dim_jogadores(id_jogador),
    foreign key (id_posicao) references dim_posicao(id_posicao),
    foreign key (id_clube) references dim_clube(id_clube)
)
USING DELTA;


INSERT INTO dim_jogadores(
    id_jogador,
    nome_jogador
) VALUES
(1, 'Neymar'),
(2, 'Richarlison'),
(3, 'Vinicius Junior'),
(4, 'Philippe Coutinho'),
(5, 'Raphinha'),
(6, 'Thiago Silva'),
(7, 'Casemiro'),
(8, 'Dani Alves'),
(48, 'Endrick'),            
(49, 'Igor Thiago'),         
(50, 'Rayan'),               

(9, 'Kylian Mbappe'),
(10, 'Antoine Griezmann'),
(11, 'Olivier Giroud'),
(12, 'Ousmane Dembele'),
(13, 'Paul Pogba'),
(14, 'Hugo Lloris'),
(15, 'Raphael Varane'),
(51, 'Warren Zaire-Emery'),  
(52, 'Bradley Barcola'),     
(53, 'Michael Olise'),       

(16, 'Alvaro Morata'),
(17, 'Ferran Torres'),
(18, 'Dani Olmo'),
(19, 'Pedri'),
(20, 'Rodri'),
(21, 'Sergio Busquets'),
(22, 'Jordi Alba'),
(23, 'Gavi'),
(60, 'Lamine Yamal'),        
(61, 'Pau Cubarsi'),         
(62, 'Nico Williams'),       

(24, 'Lionel Messi'),
(25, 'Angel Di Maria'),
(26, 'Julian Alvarez'),
(27, 'Lautaro Martinez'),
(28, 'Enzo Fernandez'),
(29, 'Nicolas Otamendi'),
(30, 'Leandro Paredes'),
(31, 'Javier Mascherano'),
(54, 'Alejandro Garnacho'),  
(55, 'Valentin Carboni'),    
(56, 'Matias Soule'),        

(32, 'Thomas Muller'),
(33, 'Toni Kroos'),
(34, 'Kai Havertz'),
(35, 'Jamal Musiala'),
(36, 'Mesut Ozil'),
(37, 'Manuel Neuer'),
(38, 'Miroslav Klose'),
(39, 'Mats Hummels'),
(63, 'Florian Wirtz'),       
(64, 'Aleksandar Pavlovic'), 
(65, 'Deniz Undav'),         

(40, 'Cristiano Ronaldo'),
(41, 'Pepe'),
(42, 'Bruno Fernandes'),
(43, 'Bernardo Silva'),
(44, 'João Moutinho'),
(45, 'João Cancelo'),
(46, 'Gonçalo Ramos'),
(47, 'Raphael Guerreiro'),
(57, 'Joao Neves'),          
(58, 'Francisco Conceicao'), 
(59, 'Vitinha');             


INSERT INTO dim_selecao(
    id_selecao,
    nome_selecao,
    continente,
    primeira_participacao
) VALUES
(1, 'Brasil', 'America do Sul', 1930),
(3, 'Franca', 'Europa', 1930),
(4, 'Argentina', 'America do Sul', 1930),
(5, 'Alemanha', 'Europa', 1934),
(6, 'Portugal', 'Europa', 1966),      
(7, 'Espanha', 'Europa', 1934);


INSERT INTO dim_tempo(
    id_tempo,
    ano
) VALUES
(1, 2014),
(2, 2018),
(3, 2022),
(4, 2026);


INSERT INTO dim_posicao(
    id_posicao,
    geral_posicao,
    setor_posicao
) VALUES
(1, 'GOL', 'Goleiro'),
(2, 'DEF', 'Zagueiro'),
(3, 'MEI', 'Volante'),
(4, 'DEF', 'Lateral Esquerdo'),
(5, 'DEF', 'Lateral Direito'),
(6, 'MEI', 'Meia Armador'),
(7, 'ATA', 'Ponta Esquerda'),
(8, 'ATA', 'Ponta Direita'),
(9, 'ATA', 'Centroavante');


INSERT INTO dim_clube(
    id_clube,
    nome_clube,
    pais_clube,
    sigla_clube
) VALUES
(1, 'Paris Saint-Germain', 'Franca', 'PSG'),
(2, 'Real Madrid', 'Espanha', 'RMA'),
(3, 'Barcelona', 'Espanha', 'FCB'),
(4, 'Manchester City', 'Inglaterra', 'MCI'),
(5, 'Manchester United', 'Inglaterra', 'MUN'),
(6, 'Chelsea', 'Inglaterra', 'CHE'),
(7, 'Arsenal', 'Inglaterra', 'ARS'),
(8, 'Tottenham Hotspur', 'Inglaterra', 'TOT'),
(9, 'Bayern de Munique', 'Alemanha', 'FCB'),
(10, 'Borussia Dortmund', 'Alemanha', 'BVB'),
(11, 'Juventus', 'Italia', 'JUV'),
(12, 'Atletico de Madrid', 'Espanha', 'ATM'),
(13, 'Inter de Milao', 'Italia', 'INT'),
(14, 'Benfica', 'Portugal', 'SLB'),
(15, 'Porto', 'Portugal', 'FCP'),
(16, 'Sporting', 'Portugal', 'SCP'),
(17, 'Sevilla', 'Espanha', 'SEV'),
(18, 'Villarreal', 'Espanha', 'VIL'),
(19, 'Lazio', 'Italia', 'LAZ'),
(20, 'Monaco', 'Franca', 'ASM'),
(21, 'Liverpool', 'Inglaterra', 'LIV'),
(22, 'Inter Miami', 'Estados Unidos', 'MIA'),
(23, 'Al-Nassr', 'Arabia Saudita', 'NAS'),
(24, 'Bayer Leverkusen', 'Alemanha', 'LEV'),
(25, 'Santos FC', 'Brasil', 'SAN'),
(26, 'Flamengo', 'Brasil', 'FLA'),
(27, 'Lyon', 'Franca', 'OL'),
(28, 'Bournemouth', 'Inglaterra', 'BOU'),
(29, 'Brentford', 'Inglaterra', 'BRE'),
(30, 'Roma', 'Italia', 'ROM'),
(31, 'Fenerbahce', 'Turquia', 'FEN');


INSERT INTO fato_resultado(
    id_resultado,
    id_selecao,
    id_tempo,
    id_jogador,
    id_posicao,
    id_clube,
    gols,
    assistencia,
    amarelo_cartao,
    vermelho_cartao,
    idade_epoca,
    partidas_jogadas
) VALUES
-- COPA DO MUNDO 2014
(1, 1, 1, 1, 7, 3, 4, 1, 1, 0, 22, 5),    
(2, 4, 1, 24, 8, 3, 4, 1, 0, 0, 27, 7),   
(3, 5, 1, 38, 9, 19, 2, 0, 0, 0, 36, 5),  
(4, 5, 1, 32, 6, 9, 5, 3, 0, 0, 24, 7),  
(5, 5, 1, 33, 6, 9, 2, 4, 0, 0, 24, 7),   
(6, 6, 1, 40, 7, 2, 1, 1, 0, 0, 29, 3),
(7, 1, 1, 6, 2, 1, 0, 1, 2, 0, 29, 7),
(8, 1, 1, 8, 5, 3, 0, 0, 1, 0, 31, 7),
(9, 7, 1, 21, 3, 3, 0, 0, 0, 0, 25, 2), 
(10, 7, 1, 22, 4, 3, 0, 0, 1, 0, 25, 3), 
(11, 4, 1, 25, 6, 2, 1, 0, 1, 0, 26, 5),
(12, 4, 1, 31, 3, 3, 0, 0, 1, 0, 30, 7), 
(13, 5, 1, 36, 6, 7, 1, 1, 0, 0, 25, 7),  
(14, 5, 1, 37, 1, 9, 0, 0, 0, 0, 28, 7),  
(15, 5, 1, 39, 2, 10, 1, 0, 0, 0, 25, 6),
(16, 6, 1, 44, 3, 15, 0, 0, 1, 0, 27, 3),

-- COPA DO MUNDO 2018
(17, 3, 2, 9, 8, 20, 4, 0, 1, 0, 19, 7),
(18, 3, 2, 10, 6, 12, 4, 2, 0, 0, 27, 7),
(19, 1, 2, 1, 7, 1, 2, 1, 1, 0, 26, 5),
(20, 6, 2, 40, 9, 2, 4, 0, 1, 0, 33, 4),
(21, 1, 2, 4, 6, 21, 2, 2, 0, 0, 26, 5), 
(22, 1, 2, 6, 2, 1, 1, 0, 0, 0, 33, 5),
(23, 1, 2, 8, 5, 1, 0, 0, 0, 0, 35, 5),
(24, 1, 2, 7, 3, 2, 0, 0, 2, 0, 26, 5),
(25, 3, 2, 13, 6, 5, 1, 0, 1, 0, 25, 7),
(26, 3, 2, 14, 1, 8, 0, 0, 0, 0, 31, 7),
(27, 3, 2, 15, 2, 2, 1, 0, 0, 0, 25, 7),
(28, 7, 2, 21, 3, 3, 0, 0, 1, 0, 29, 4),
(29, 7, 2, 22, 4, 3, 0, 1, 0, 0, 29, 4),
(30, 4, 2, 24, 6, 3, 1, 2, 0, 0, 31, 4),
(31, 4, 2, 25, 6, 1, 1, 0, 0, 0, 30, 3),
(32, 4, 2, 31, 3, 3, 0, 0, 2, 0, 34, 4),
(33, 5, 2, 32, 6, 9, 0, 0, 1, 0, 28, 3),
(34, 5, 2, 33, 6, 2, 1, 0, 0, 0, 28, 3),
(35, 6, 2, 41, 2, 12, 1, 0, 1, 0, 35, 4),
(36, 6, 2, 43, 6, 4, 0, 0, 1, 0, 23, 4),
(37, 6, 2, 47, 4, 10, 0, 1, 0, 0, 24, 4),

-- COPA DO MUNDO 2022
(38, 4, 3, 24, 6, 1, 7, 3, 1, 0, 35, 7),
(39, 3, 3, 9, 7, 1, 8, 2, 0, 0, 23, 7),
(40, 1, 3, 2, 9, 8, 3, 0, 0, 0, 25, 4),
(41, 4, 3, 26, 9, 4, 4, 0, 0, 0, 22, 7),
(42, 6, 3, 42, 6, 5, 2, 3, 1, 0, 28, 4),
(43, 7, 3, 23, 6, 3, 1, 0, 1, 0, 18, 4),
(44, 6, 3, 41, 2, 15, 1, 0, 0, 0, 39, 4),
(45, 4, 3, 30, 3, 11, 0, 0, 2, 0, 28, 5),
(46, 1, 3, 1, 7, 1, 2, 1, 0, 0, 30, 3),
(47, 1, 3, 3, 7, 2, 1, 2, 0, 0, 22, 4),
(48, 1, 3, 5, 8, 3, 0, 0, 0, 0, 25, 5),
(49, 1, 3, 6, 2, 6, 0, 0, 0, 0, 38, 4),
(50, 1, 3, 7, 3, 5, 1, 0, 1, 0, 30, 4),   
(51, 3, 3, 11, 9, 11, 4, 0, 1, 0, 36, 7), 
(52, 3, 3, 12, 8, 3, 0, 2, 0, 0, 25, 7), 
(53, 3, 3, 14, 1, 8, 0, 0, 0, 0, 35, 6),
(54, 7, 3, 16, 9, 12, 3, 0, 0, 0, 30, 4), 
(55, 7, 3, 17, 7, 3, 2, 0, 0, 0, 22, 4), 
(56, 7, 3, 18, 8, 18, 1, 1, 0, 0, 24, 4), 
(57, 7, 3, 19, 6, 3, 0, 0, 0, 0, 20, 4), 
(58, 7, 3, 20, 3, 4, 0, 0, 0, 0, 26, 4), 
(59, 4, 3, 25, 7, 11, 1, 1, 0, 0, 34, 5), 
(60, 4, 3, 27, 9, 13, 0, 0, 0, 0, 25, 6),
(61, 4, 3, 28, 6, 14, 1, 1, 0, 0, 21, 7),
(62, 5, 3, 34, 6, 6, 2, 0, 0, 0, 23, 3), 
(63, 5, 3, 35, 6, 9, 0, 1, 0, 0, 19, 3),  
(64, 6, 3, 40, 9, 5, 1, 0, 0, 0, 37, 5),  
(65, 6, 3, 43, 6, 4, 0, 1, 0, 0, 27, 5), 
(66, 6, 3, 45, 4, 4, 0, 0, 0, 0, 28, 4),
(67, 6, 3, 46, 9, 14, 3, 1, 0, 0, 21, 4);


SELECT * 
from fato_resultado LIMIT 5;

-- baseado nas 3 copas do mundo, conseguimos identificar o maior artilheiro, somando os gols deles nas edições.
select a.nome_jogador, sum(gols) as total_gols
from dim_jogadores a
inner join fato_resultado b
on a.id_jogador = b.id_jogador
where gols > 0
group by a.nome_jogador
order by total_gols desc;

 -- tambem podemos ver quem foi o lider de assistencias, somando as assistencias deles nas edições.
select a.nome_jogador, sum(assistencia) as total_assistencias
from dim_jogadores a
inner join fato_resultado b
on a.id_jogador = b.id_jogador
where assistencia > 0
group by a.nome_jogador
order by total_assistencias desc;

-- qual jogador mais jogou jogos dentro dessas 3 copas
select a.nome_jogador, sum(partidas_jogadas) as total_partidas_jogadas
from dim_jogadores a
inner join fato_resultado b
on a.id_jogador = b.id_jogador
group by a.nome_jogador
order by total_partidas_jogadas desc;

-- jogador mais jovem que jogou dentro dessas 3 edições
select a.nome_jogador, min(idade_epoca) as idade_mais_jovem
from dim_jogadores a
inner join fato_resultado b
on a.id_jogador = b.id_jogador
group by a.nome_jogador
order by idade_mais_jovem asc;

-- jogador mais velho a jogar dentro dessas 3 edicões
select a.nome_jogador, max(idade_epoca) as idade_mais_velha
from dim_jogadores a
inner join fato_resultado b
on a.id_jogador = b.id_jogador
group by a.nome_jogador
order by idade_mais_velha desc;

-- jogador que mais tomou cartoes amarelos dentro das 3 ediçoes
select a.nome_jogador, sum(amarelo_cartao) as cartoes_amarelos
from dim_jogadores a
inner join fato_resultado b
on a.id_jogador = b.id_jogador
where amarelo_cartao > 0
group by a.nome_jogador
order by cartoes_amarelos desc;

-- clube tem a maior quantidade de gols marcados por seus jogadores dentro das 3 ediçoes
select a.nome_clube, sum(gols) as total_gols
from dim_clube a
inner join fato_resultado b
on a.id_clube = b.id_clube
where gols > 0
group by a.nome_clube
order by total_gols desc;

-- podemos fazer alguns filtros com posicoes, qual centroavante mais jogou jogos dentro desse banco de dados
select a.nome_jogador, c.setor_posicao, sum(partidas_jogadas) as total_partidas_jogadas
from dim_jogadores a
inner join fato_resultado b
on a.id_jogador = b.id_jogador
inner join dim_posicao c
on b.id_posicao = c.id_posicao
where c.setor_posicao = 'Centroavante'
group by a.nome_jogador,c.setor_posicao
order by total_partidas_jogadas desc;

SELECT id_tempo AS ano, sum(gols) AS total_gols
FROM fato_resultado
GROUP BY id_tempo
ORDER BY total_gols DESC;


SELECT
  f.id_resultado,
  j.nome_jogador,
  s.nome_selecao,
  s.continente,
  t.ano,
  p.setor_posicao,
  p.geral_posicao,
  c.nome_clube,
  c.pais_clube,
  f.gols,
  f.assistencia,
  f.amarelo_cartao,
  f.vermelho_cartao,
  f.idade_epoca,
  f.partidas_jogadas
FROM
  workspace.copa_mundo.fato_resultado f
    JOIN workspace.copa_mundo.dim_jogadores j
      ON f.id_jogador = j.id_jogador
    JOIN workspace.copa_mundo.dim_selecao s
      ON f.id_selecao = s.id_selecao
    JOIN workspace.copa_mundo.dim_tempo t
      ON f.id_tempo = t.ano
    JOIN workspace.copa_mundo.dim_posicao p
      ON f.id_posicao = p.id_posicao
    JOIN workspace.copa_mundo.dim_clube c
      ON f.id_clube = c.id_clube
      ORDER BY f.id_jogador ASC;

select a.nome_jogador, c.ano, b.idade_epoca as idade
from dim_jogadores a
inner join fato_resultado b
on b.id_jogador = a.id_jogador
inner join dim_tempo c
on c.id_tempo = b.id_tempo
order by b.idade_epoca desc
limit 10