CREATE TABLE Stage_Cliente_Modelo3 (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(255),
    CPF_CNPJ VARCHAR(20),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    Email VARCHAR(255),
    Tipo VARCHAR(10)
);

CREATE TABLE Stage_Condutor_Modelo3 (
    CondutorID INT PRIMARY KEY,
    ClienteID INT,
    Nome VARCHAR(255),
    CNH VARCHAR(20),
    DataExpiracaoCNH DATE,
    Email VARCHAR(255),
    Tipo VARCHAR(10)
);

CREATE TABLE Stage_Reserva_Modelo3 (
    ReservaID INT PRIMARY KEY,
    ClienteID INT,
    Grupo VARCHAR(50),
    VeiculoID INT,
    DataReserva DATE,
    DataInicio DATE,
    DataFim DATE,
    Status VARCHAR(20),
    Observacoes TEXT
);

CREATE TABLE Stage_Locacao_Modelo3 (
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
    ValorFinal DECIMAL(10, 2)
);

CREATE TABLE Stage_Veiculo_Modelo3 (
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

CREATE TABLE Stage_Patio_Modelo3 (
    PatioID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Endereco VARCHAR(255)
);
