USE os_mechanical_workshop;

-- Clientes
INSERT INTO Cadastro(Nome, CPF, Endereco, Telefone) VALUES 
	("Filipe Bento Marcos Mendes", "51188365819", "Avenida Zelina 177, Vila Zelina, São Paulo, SP", "11984911216"),	-- id 1
	("Gabriela Antonella Maitê Freitas", "81026903807", "Rua Cajapió 661, Vila Sílvia, São Paulo, SP", "11994244934"), -- id 2
	("Alana Gabrielly Fernandes", "43240866803", "Rua Capitão Rubens 749, Parque Edu Chaves, São Paulo, SP", "11981806370"), -- id 3
	("Filipe Márcio Pinto", "74758776806", "Avenida Cruzeiro do Sul 332, Canindé, São Paulo, SP", "11995002349"), -- id 4
	("Edson Raimundo Melo", "11879701820", "Rua Pão de Açúcar 799, Jardim Marília, São Paulo, SP", "11989616143"), -- id 5
	("Aline Ester Bárbara Silva", "85878133822", "Rua Nicanor Mendes 614, Conjunto Residencial José Bonifácio, São Paulo, SP", "11981011111"), -- id 6
	("Clarice Elisa Sara da Cruz", "97181917803", "Rua Camomila Romana 923, Parque Savoy City, São Paulo, SP", "11985974443"), -- id 7
	("Ian Arthur Silveira", "07617067801", "Rua Sinfonia Inacabada 184, Parque Florestal, São Paulo, SP", "11995869822"), -- id 8
	("Vitória Lúcia Assunção", "84754152883", "Rua Padre Eduardo de Jesus 369, Vila Santa Cruz (Zona Leste), São Paulo, SP", "11993958667"), -- id 9
	("Cauã Cláudio Santos", "63939935883", "Praça Dom Ernesto de Paula 904, Barra Funda, São Paulo, SP", "11992464740"); -- id 10

-- Mecânicos que já trabalharam na oficina
INSERT INTO Mecanico VALUES
	(1, "Moto", "2021-01-15", Null),
	(2, "Caminhão", "2021-01-22", Null),
	(3, "Carro", "2021-01-30", Null),
    (5, "Bicicleta", "2020-12-15", "2021-01-07"),
	(8, "Carro", "2020-12-22", "2021-01-14");
    
-- Veículos do cliente que já passou pela oficina
INSERT INTO Veiculo VALUES 
	("XYZ-7890", 4, "Carro", "Volkswagen", "Gol", "2015"),
	("DEF-4567", 6, "Moto", "Honda", "CG 160", "2020"),
	("GHI-1234", 7, "Caminhão", "Mercedes-Benz", "Actros", "2018"),
	("JKL-5678", 9, "Carro", "Chevrolet", "Onix", "2022"),
	("MNO-9012", 10, "Moto", "Yamaha", "MT-03", "2021"),
	("PQR-3456", 5, "Caminhão", "Volvo", "FH 540", "2019");
    
-- Ordem de serviço aberto por um cliente
INSERT INTO OrdemServico(PlacaVeiculo, DescricaoProblema, Status, DataEntrada, DataSaida) VALUES
	("XYZ-7890", "Problema no motor", "Concluído", "2020-12-12", "2021-03-14"), -- id 1
	("GHI-1234", "Luz do painel não apaga", "Concluído", "2021-01-30", "2021-03-12"), -- id 2
	("PQR-3456", "Problema na suspensão", "Concluído", "2021-02-27", "2021-04-08"), -- id 3
	("DEF-4567", "Bateria descarregando rápido", "Concluído", "2021-04-08", "2021-04-12"), -- id 4
	("JKL-5678", "Vazamento de óleo", "Concluído", "2021-05-18", "2021-07-01"), -- id 5
	("XYZ-7890", "Ar-condicionado não gela", "Concluído", "2021-06-14", "2021-08-25"), -- id 6
	("DEF-4567", "Freios fazendo barulho", "Arguardando retirada", "2021-07-22", NULL), -- id 7
	("MNO-9012", "Pneu furado", "Concluído", "2021-08-12", "2021-08-12"), -- id 8
	("GHI-1234", "Barulho estranho na direção", "Autorizado", "2021-09-20", NULL), -- id 9
	("JKL-5678", "Falha na injeção eletrônica", "Em análise", "2021-11-05", NULL); -- id 10
        
-- Mecanicos trabalha na Ordem de Serviço
INSERT INTO Trabalha VALUES 
	(8, 1), -- Mecanico X trabalha no Serviço Y
	(3, 1), 
	(2, 2),
	(2, 3),
	(1, 4),
	(3, 5),
	(3, 6),
    (1, 7),
    (1, 8),
    (2, 9),
    (3, 10);
    
-- Serviços definidos para cada veículo
INSERT INTO Servico(IdOS, Descricao, Valor) VALUES 
	(1, "Substituição do motor", 4000.00), -- id 1
	(2, "Reparo na fiação do painel", 180.00), -- id 2
	(3, "Reparo na suspensão", 900.00), -- id 3
	(4, "Substituição da bateria", 300.00), -- id 4
	(5, "Substituição da junta do cárter", 140.00), -- id 5
	(6, "Recarga do ar-condicionado", 220.00), -- id 6
	(7, "Substituição dos freios", 750.00), -- id 7
	(8, "Substituição do pneu", 300.00), -- id 8
	(9, "Lubrificação da direção", 95.00), -- id 9
	(10, "Limpeza dos bicos injetores", 275.00); -- id 10
 
-- Estoque de peças
INSERT INTO Estoque(Nome, Descricao, Quantidade, ValorUnitario) VALUES
	("Amortecedores e molas", "Kit de amortecedores e molas", 15, 300.00), -- id 1
	("Bateria nova", "Bateria 60Ah", 25, 150.00), -- id 2
	("Fios e conectores", "Kit de fios e conectores para painel", 30, 20.00), -- id 3
	("Gás refrigerante", "Gás refrigerante R134a", 60, 30.00), -- id 4
	("Graxa", "Graxa para direção", 70, 5.00), -- id 5
	("Junta do cárter", "Junta do cárter em borracha", 40, 10.00), -- id 6
	("Kit de limpeza de bicos injetores", "Kit com solução de limpeza e ferramentas", 45, 25.00), -- id 7
	("Motor completo", "Motor 2.0L 16V", 10, 1000.00), -- id 8
	("Pastilhas de freio", "Pastilhas de freio de cerâmica", 50, 50.00), -- id 9
	("Pneu novo", "Pneu radiais aro 15", 20, 100.00); -- id 10   
    
-- Solicita peças do estoque
INSERT INTO Solicita VALUES 
	(1, 8, 1), -- Serviço X solicia Peça Y em quantidade Z
	(2, 3, 2),
	(3, 1, 1),
	(4, 2, 1),
	(5, 6, 1),
	(6, 4, 1),
	(7, 9, 2),
	(8, 10, 1),
	(9, 5, 1),
	(10, 7, 1);
