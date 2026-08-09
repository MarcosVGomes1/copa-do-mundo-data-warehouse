# Data Warehouse - Copa do Mundo
Projeto de Data Warehouse desenvolvido para estruturar e analisar dados das edições da Copa do Mundo (2014, 2018 e 2022).

##  Arquitetura e Modelagem
O projeto utiliza uma modelagem dimensional em **Modelo em Estrela**:

* **Tabela Fato**: `fato_resultado` (métricas de desempenho e estatísticas por partida/jogador)
* **Tabelas Dimensão**:
  * `dim_jogadores`: detalhes dos atletas
  * `dim_clube`: clubes que jogam
  * `dim_selecao`: seleções nacionais e continentes
  * `dim_posicao`: posição dos jogadores
  * `dim_tempo`: anos das edições da Copa

## Tecnologias Utilizadas
* **Banco de Dados**: MySQL / Databricks SQL
* **Linguagem**: SQL
* **Modelagem**: Draw.io
* **Versionamento**: Git / GitHub

## Consultas e Insights de Negócio
O arquivo `queries.sql` contém as consultas que respondem a perguntas como:
1. Top artilheiros por edição da Copa do Mundo.
2. Análise de desempenho por clube de origem dos atletas.
3. Distribuição de gols por continente e posição.