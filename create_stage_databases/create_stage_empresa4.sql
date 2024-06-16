CREATE TABLE Stage_Clientes_Modelo4 (
    ID_Cliente INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(90) NOT NULL,
    Tipo_Cliente ENUM('Fisica', 'Juridica') NOT NULL,
    Documento VARCHAR(14) NOT NULL,
    ID_Endereco INT NOT NULL,
    Telefone INT NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Data_Nascimento DATE NOT NULL,
    CNH INT NULL,
    Data_Validade_CNH DATE NULL,
    CNPJ_Empresa VARCHAR(14) NULL
);

CREATE TABLE Stage_Veiculos_Modelo4 (
    ID_Veiculo INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ID_Grupo INT NOT NULL,
    Placa VARCHAR(10) NOT NULL,
    Marca VARCHAR(45) NOT NULL,
    Modelo VARCHAR(45) NOT NULL,
    Cor VARCHAR(45) NOT NULL,
    Ar_Condicionado BIT NOT NULL,
    Mecanizacao ENUM('Manual', 'Automatica') NOT NULL,
    Cadeirinha BIT NOT NULL,
    Link_Fotos VARCHAR(255) NOT NULL,
    Assentos INT NOT NULL,
    Tamanho_Mala FLOAT NOT NULL,
    Carga_Maxima FLOAT NOT NULL
);

CREATE TABLE Stage_Reservas_Modelo4 (
    ID_Reserva INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ID_Cliente INT NOT NULL,
    ID_Veiculo INT NOT NULL,
    Data_Reserva DATE NOT NULL,
    Data_Inicio DATE NOT NULL,
    Data_Fim DATE NOT NULL,
    Status_Reserva ENUM('Ativa', 'Cancelada', 'Concluida') NOT NULL,
    Patio_Retirada INT NOT NULL,
    Patio_Devolucao INT NOT NULL
);

CREATE TABLE Stage_Locacoes_Modelo4 (
    ID_Locacao INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    ID_Reserva INT NOT NULL,
    Data_Retirada DATE NOT NULL,
    Data_Devolucao_Prevista DATE NOT NULL,
    Data_Devolucao_Realizada DATE NOT NULL,
    Valor_Aluguel FLOAT NOT NULL,
    Patio_Retirada INT NOT NULL,
    Patio_Devolucao INT NOT NULL,
    Status_Locacao ENUM('Em andamento', 'Concluida', 'Cancelada') NOT NULL
);

CREATE TABLE Stage_Patios_Modelo4 (
    ID_Patio INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    Nome VARCHAR(255),
    Endereco VARCHAR(255)
);
