-- Cria e acessa o banco de dados
CREATE DATABASE os_mechanical_workshop;
USE os_mechanical_workshop;

-- Cria as tabelas
CREATE TABLE Cadastro (
	ID int NOT NULL AUTO_INCREMENT,
    Nome varchar(150) NOT NULL,
    CPF char(11) NOT NULL UNIQUE,
    Endereco varchar(255) NOT NULL,
    Telefone varchar(11) NOT NULL,
    
    PRIMARY KEY (ID)
);

CREATE TABLE Mecanico (
	IdCadastro int,
    Especialidade enum("Moto", "Caminhão", "Carro", "Bicicleta") NOT NULL,
    DataContrato date NOT NULL,
    DataSaida date,
    
    FOREIGN KEY (IdCadastro) REFERENCES Cadastro(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Veiculo (
	Placa char(8) NOT NULL UNIQUE,
    IdCliente int,
    Tipo enum("Moto", "Caminhão", "Carro", "Bicicleta") NOT NULL,
    Marca varchar(45) NOT NULL,
    Modelo varchar(45) NOT NULL,
    Ano year NOT NULL,
    
    PRIMARY KEY (Placa),
    FOREIGN KEY (IdCliente) REFERENCES Cadastro(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrdemServico (
	ID int NOT NULL AUTO_INCREMENT,
    PlacaVeiculo char(8),
    DescricaoProblema varchar(255) NOT NULL,
    Status enum("Entrada", "Em análise", "Arguardando autorização", "Autorizado", "Arguardando retirada", "Concluído") NOT NULL DEFAULT "Entrada",
    DataEntrada date NOT NULL,
    DataSaida date,
    
    PRIMARY KEY (ID),
    FOREIGN KEY (PlacaVeiculo) REFERENCES Veiculo(Placa) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Trabalha (
	IdMecanico int,
    IdOS int,
    
    FOREIGN KEY (IdMecanico) REFERENCES Mecanico(IdCadastro) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdOS) REFERENCES OrdemServico(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Servico (
	ID int NOT NULL AUTO_INCREMENT,
    IdOS int,
    Descricao varchar(255) NOT NULL,
    Valor float NOT NULL DEFAULT 0.0,
    
    PRIMARY KEY (ID),
    FOREIGN KEY (IdOS) REFERENCES OrdemServico(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Estoque (
	ID int NOT NULL AUTO_INCREMENT,
    Nome varchar(150) NOT NULL,
    Descricao varchar(255),
    Quantidade int NOT NULL DEFAULT 1,
    ValorUnitario float NOT NULL DEFAULT 0.0,
    
    PRIMARY KEY (ID)
);

CREATE TABLE Solicita (
	IdServico int,
    IdPeca int,
    Quantidade int NOT NULL DEFAULT 0,
	
    FOREIGN KEY (IdServico) REFERENCES Servico(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdPeca) REFERENCES Estoque(ID) ON DELETE CASCADE ON UPDATE CASCADE
);
