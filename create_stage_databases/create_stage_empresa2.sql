CREATE TABLE Stage_Clientes_Modelo2 (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    CNH VARCHAR(20) NOT NULL,
    ExpiracaoCNH DATE NOT NULL,
    CPF_CNPJ VARCHAR(20) NOT NULL,
    PessoaFisica BOOLEAN NOT NULL,
    Endereco TEXT,
    Telefone VARCHAR(15),
    Email VARCHAR(255)
);

CREATE TABLE Stage_Veiculo_Modelo2 (
    ID INT PRIMARY KEY,
    Placa VARCHAR(10) NOT NULL,
    Chassis VARCHAR(50) NOT NULL,
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

CREATE TABLE Stage_Reservas_Modelo2 (
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

CREATE TABLE Stage_Locacao_Modelo2 (
    ID INT PRIMARY KEY,
    ClienteId INT,
    VeiculoId INT,
    PatioRetiradoId INT,
    PatioDevolucaoId INT,
    DataRetirada DATE,
    DataDevolucao DATE,
    Devolvido BOOLEAN,
    Protecoes_Adicionais TEXT,
    EstadoEntrega TEXT,
    EstadoDevolucao TEXT
);

CREATE TABLE Stage_Patio_Modelo2 (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Localizacao TEXT
);
