CREATE TABLE Dim_Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CNH VARCHAR(20),
    ExpiracaoCNH DATE,
    CPF_CNPJ VARCHAR(20),
    PessoaFisica BOOLEAN,
    Endereco TEXT,
    Telefone VARCHAR(15),
    Email VARCHAR(255)
);


CREATE TABLE Dim_Veiculos (
    ID INT PRIMARY KEY,
    Placa VARCHAR(10) NOT NULL,
    Chassis VARCHAR(50),
    Grupo VARCHAR(50),
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Cor VARCHAR(20),
    ArCondicionado BOOLEAN,
    MecanizacaoAutomatica BOOLEAN,
    Cadeirinha BOOLEAN,
    Largura INT,
    Comprimento INT,
    Foto VARCHAR(255),
    Prontuario TEXT
);


CREATE TABLE Dim_Patios (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Localizacao TEXT
);


CREATE TABLE Dim_Reservas (
    ID INT PRIMARY KEY,
    ClienteId INT,
    VeiculoId INT,
    PatioId INT,
    DataReserva DATE,
    DataPrevistaRetirada DATE,
    DataPrevistaDevolucao DATE,
    CarroRetirado BOOLEAN,
    ValorReserva DECIMAL(10, 2)
);



CREATE TABLE Fato_Locacoes (
    ID INT PRIMARY KEY,
    ClienteId INT,
    VeiculoId INT,
    PatioRetiradoId INT,
    PatioDevolucaoId INT,
    ReservaId INT,
    DataRetirada DATE,
    DataDevolucao DATE,
    Valor DECIMAL(10, 2),
    FOREIGN KEY (ClienteId) REFERENCES Dim_Clientes(ID),
    FOREIGN KEY (VeiculoId) REFERENCES Dim_Veiculos(ID),
    FOREIGN KEY (PatioRetiradoId) REFERENCES Dim_Patios(ID),
    FOREIGN KEY (PatioDevolucaoId) REFERENCES Dim_Patios(ID),
    FOREIGN KEY (ReservaId) REFERENCES Dim_Reservas(ID)
);

