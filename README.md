# Oficina mecânica:
 Desafio para modelagem de dados para uma oficina mecânica com sistema de ordem de serviços.

## Requisitos:
- Sistema de controle e gerenciamento de execução de ordens de serviço em uma oficina mecânica.
- Clientes levam veículos à oficiona mêcanica para serem consertados ou para passarem por revisões periódicas.
- Cada veículo é designado a uma equipe de mecânicos que identifica os serviços a serem executados e preenche uma OS com data de entrega.
- A parti da OS, calcula-se o valor de cada serviço, consultando-se uma tabela de referência de mão de obra.
- O valor de cada peça também irá compor a OS.
- O cliente autoriza a execução dos serviços.
- A mesma equipe avalia e executa os serviços.
- Os mecânicos possuem código, nome, endereço e especialidade.
- Cada OS possui: nº, data de emissão, um valor, status e uma data para conclusão dos trabalhos.
- Uma OS pode ser composta por vários serviços e um mesmo serviço pode estar contida em mais de uma OS.
- Uma OS pode ter vários tipos de peça e uma peça pode estar presente em mais de uma OS.

## Objetivo do desafio #1 (Modelagem lógica):
- [x] Cria o esquema lógico para o contexto de oficina com base na narrativa fornecida

## Diagrama EER:
 <img title="Diagrama EER" alt="Diagrama EER" src="diagrama-EER.png">

## Objetivo do desafio #2 (Modelagem Física):
- [x] Recuperações simples com SELECT Statement
- [x] Filtros com WHERE Statement
- [x] Crie expressões para gerar atributos derivados
- [x] Defina ordenações dos dados com ORDER BY
- [x] Condições de filtros aos grupos – HAVING Statement
- [x] Crie junções entre tabelas para fornecer uma perspectiva mais complexa dos dados

### Lista de querys (SELECT):
- Todos os cadastros (ORDER BY).
- Todos os mecânicos que já trabalharam na oficina em ordem de contratação (JOIN e ORDER BY).
- Todos os mecânicos que estão trabalhando na oficina em ordem de contratação (JOIN, WHERE e ORDER BY).
- Todos os veiculos cadastrados e seus donos (JOIN).
- Todos os 'carros' e seus donos (JOIN e WHERE).
- Todas as ordem de serviço ordenado, com a equipe de mecanicos (JOIN e GROUP BY).
- Todas as ordem de serviços em aberto (JOIN e WHERE).
- Todos os serviços, solicitações e valor final da OS (JOIN, GROUP BY e ORDER BY).
- Todos os veículos que tiveram um gasto maior que 1000 em todos as OS (SUBQUERY, JOIN, GROUP BY, HAVING e ORDER BY).
- Lista de mecânicos com seu bônus ordenado (SUBQUERY, JOIN, GROUP BY e ORDER BY).
- Todo o estoque de peças.