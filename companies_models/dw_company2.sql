-- Tabela Cliente
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(255),
    CPF_CNPJ VARCHAR(20),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(255),
    Tipo VARCHAR(10)
);

-- Tabela Condutor
CREATE TABLE Condutor (
    CondutorID INT PRIMARY KEY,
    ClienteID INT,
    Nome VARCHAR(255),
    CNH VARCHAR(20),
    DataExpiracaoCNH DATE,
    Email VARCHAR(255),
    Tipo VARCHAR(10),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID)
);

-- Tabela Reserva
CREATE TABLE Reserva (
    ReservaID INT PRIMARY KEY,
    ClienteID INT,
    Grupo VARCHAR(50),
    VeiculoID INT,
    DataReserva DATE,
    DataInicio DATE,
    DataFim DATE,
    Status VARCHAR(20),
    Observacoes TEXT,
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(VeiculoID)
);

-- Tabela Locação
CREATE TABLE Locacao (
    LocacaoID INT PRIMARY KEY,
    ClienteID INT,
    ReservaID INT,
    CondutorID INT,
    VeiculoID INT,
    Retirada TIMESTAMP,
    DevolucaoPrevista TIMESTAMP,
    DevolucaoRealizada TIMESTAMP,
    PatioRetiradaID INT,
    PatioDevolucaoID INT,
    EstadoEntrega TEXT,
    EstadoDevolucao TEXT,
    ProtecoesAdicionais JSON,
    ValorInicial DECIMAL(10, 2),
    ValorFinal DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Cliente(ClienteID),
    FOREIGN KEY (ReservaID) REFERENCES Reserva(ReservaID),
    FOREIGN KEY (CondutorID) REFERENCES Condutor(CondutorID),
    FOREIGN KEY (VeiculoID) REFERENCES Veiculo(VeiculoID),
    FOREIGN KEY (PatioRetiradaID) REFERENCES Patio(PatioID),
    FOREIGN KEY (PatioDevolucaoID) REFERENCES Patio(PatioID)
);

-- Tabela Veículo
CREATE TABLE Veiculo (
    VeiculoID INT PRIMARY KEY,
    Placa VARCHAR(10) UNIQUE,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Cor VARCHAR(20),
    ArCondicionado BOOLEAN,
    Chassis VARCHAR(17) UNIQUE,
    Grupo VARCHAR(50),
    Mecanizacao VARCHAR(20),
    Cadeirinha BOOLEAN,
    Dimensoes VARCHAR(255),
    Acessorios JSON,
    Fotos JSON,
    EstadoConservacao TEXT,
    Revisoes TEXT,
    RodagemSeguranca TEXT
);

-- Tabela Pátio
CREATE TABLE Patio (
    PatioID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255)
);
