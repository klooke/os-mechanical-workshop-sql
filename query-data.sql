-- Mostra todos os cadastros
SELECT CPF, Nome, Endereco, Telefone FROM Cadastro ORDER BY Nome;

-- Mostra todos os mecânicos que já trabalharam na oficina em ordem de contratação
SELECT c.CPF, c.Nome, c.Endereco, c.Telefone, m.Especialidade, m.DataContrato as 'Data Contratação', Coalesce(m.DataSaida, "Em contrato") as 'Data Saída'
	FROM Cadastro as c
    JOIN Mecanico as m ON c.ID = m.IdCadastro
    ORDER BY m.DataContrato;

-- Mostra todos os mecânicos que estão trabalhando na oficina em ordem de contratação
SELECT c.CPF, c.Nome, c.Endereco, c.Telefone, m.Especialidade, m.DataContrato as 'Data Contratação'
	FROM Cadastro as c
    JOIN Mecanico as m ON c.ID = m.IdCadastro
    WHERE m.DataSaida IS NULL
    ORDER BY m.DataContrato;

-- Mostra todos os veiculos cadastrados e seus donos
SELECT v.Placa, v.Tipo, Concat(v.Marca, " ", v.Modelo, " ", v.Ano) as Modelo, c.Nome as Dono
	FROM Veiculo as v
    JOIN Cadastro as c ON v.IdCliente = c.ID;
    
-- Mostra todos os 'carros' e seus donos
SELECT v.Placa, Concat(v.Marca, " ", v.Modelo, " ", v.Ano) as Veiculo, c.Nome as Dono
	FROM Veiculo as v
    JOIN Cadastro as c ON v.IdCliente = c.ID
    WHERE v.Tipo = "Carro";

-- Mostra todas as ordem de serviço ordenado pelo ID, com a equipe de mecanicos
SELECT os.ID as 'Nº', concat(v.Marca, " ", v.Modelo, " ", v.Ano) as Veiculo, os.PlacaVeiculo as Placa, os.DescricaoProblema as Problema, os.Status as Situacao, Group_concat(c.Nome) as Mecanicos
	FROM Trabalha as t
    JOIN Cadastro as c ON t.IdMecanico = c.ID
    JOIN OrdemServico as os ON t.IdOS = os.ID
    JOIN Veiculo as v ON os.PlacaVeiculo = v.Placa
    GROUP BY os.ID;

-- Mostra apenas as ordem de serviços em aberto
SELECT os.ID as 'Nº', concat(v.Marca, " ", v.Modelo, " ", v.Ano) as Veiculo, os.PlacaVeiculo as Placa, os.DescricaoProblema as Problema, os.Status as Situacao
	FROM OrdemServico as os
    JOIN Veiculo as v ON os.PlacaVeiculo = v.Placa
    WHERE os.Status != "Concluído";

-- Mostra todos os serviços, solicitações e valor final de uma OS
SELECT 
 os.ID as 'Nº', 
 concat(v.Marca, " ", v.Modelo, " ", v.Ano) as Veiculo,
 os.PlacaVeiculo as Placa, os.DescricaoProblema as Problema,
 s.Descricao,
 group_concat(e.Nome, " x", sol.Quantidade) as 'Peças',
 Concat("R$ ", Round(Sum(s.Valor) + Sum(sol.Quantidade * e.ValorUnitario), 2)) as Total
--
	FROM OrdemServico as os    
	JOIN Servico as s ON os.ID = s.IdOs
    JOIN Solicita as sol ON s.ID = sol.IdServico
    JOIN Estoque as e ON sol.IdPeca = e.ID
    JOIN Veiculo as v ON os.PlacaVeiculo = v.Placa
    GROUP BY s.ID
    ORDER BY os.ID;

-- Mostra somente os veículos que tiveram um gasto maior que 1000 em todos os serviços
SELECT n_os as Entradas, Veiculo, Total_Display as Total
	FROM (
		SELECT count(*) as n_os, concat(v.Marca, " ", v.Modelo, " ", v.Ano) as Veiculo, concat("R$ ", round(sum(s.valor + (sol.Quantidade * e.ValorUnitario)), 2)) as Total_Display, round(sum(s.valor + (sol.Quantidade * e.ValorUnitario)), 2) as Total
			FROM OrdemServico as os
			JOIN Servico as s ON os.ID = s.IdOS
			JOIN Solicita as sol ON s.ID = sol.IdServico
			JOIN Estoque as e ON sol.IdPeca = e.ID
			JOIN Veiculo as v ON os.PlacaVeiculo = v.Placa
			GROUP BY Veiculo
			HAVING Total > 1000
			ORDER BY Total DESC
        ) as subquery;

-- Mostra o número de serviços por mecânico e seus ganhos (15% por serviço), ordenado por quem mais ganhou
SELECT Mecanico, Servicos, Bonus_Display as 'Bônus 15%'
	FROM ( 
	SELECT c.Nome as Mecanico, COUNT(*) as Servicos, concat("R$ ", sum(s.Valor * 0.15)) as Bonus_Display, sum(s.Valor * 0.15) as Bonus
		FROM OrdemServico as os
		JOIN Servico as s ON os.ID = s.IdOS
		JOIN Trabalha as t ON os.ID = t.IdOS
		JOIN Cadastro as c ON t.IdMecanico = c.ID
		GROUP BY c.Nome
		ORDER BY Bonus DESC
		) as subquery;

-- Mostra o estoque de peças da oficina
SELECT Nome, Descricao, Quantidade as Disponivel, Concat("R$ ", Round(ValorUnitario, 2)) as Valor FROM Estoque;
    
-- Deletar tudo
DROP DATABASE os_mechanical_workshop;