
INSERT INTO Dim_Clientes (ID, Nome, CNH, ExpiracaoCNH, CPF_CNPJ, PessoaFisica, Endereco, Telefone, Email)
SELECT ID, Nome, CNH, ExpiracaoCNH, CPF_CNPJ, PessoaFisica, Endereco, Telefone, Email
FROM (
    SELECT * FROM Stage_Clientes_Modelo1
    UNION ALL
    SELECT * FROM Stage_Clientes_Modelo2
    UNION ALL
    SELECT ClienteID AS ID, Nome, CNH, DataExpiracaoCNH AS ExpiracaoCNH, CPF_CNPJ, (CASE WHEN Tipo = 'Fisica' THEN 1 ELSE 0 END) AS PessoaFisica, Endereco, Telefone, Email
    FROM Stage_Cliente_Modelo3
    UNION ALL
    SELECT ID_Cliente AS ID, Nome, CNH, Data_Validade_CNH AS ExpiracaoCNH, Documento AS CPF_CNPJ, (CASE WHEN Tipo_Cliente = 'Fisica' THEN 1 ELSE 0 END) AS PessoaFisica, Endereco, Telefone, Email
    FROM Stage_Clientes_Modelo4
) AS Clientes;

INSERT INTO Dim_Veiculos (ID, Placa, Chassis, Grupo, Marca, Modelo, Cor, ArCondicionado, MecanizacaoAutomatica, Cadeirinha, Largura, Comprimento, Foto, Prontuario)
SELECT ID, Placa, Chassis, Grupo, Marca, Modelo, Cor, ArCondicionado, MecanizacaoAutomatica, Cadeirinha, Largura, Comprimento, Foto, Prontuario
FROM (
    SELECT * FROM Stage_Veiculo_Modelo1
    UNION ALL
    SELECT * FROM Stage_Veiculo_Modelo2
    UNION ALL
    SELECT VeiculoID AS ID, Placa, Chassis, Grupo, Marca, Modelo, Cor, ArCondicionado, (CASE WHEN Mecanizacao = 'Automatica' THEN 1 ELSE 0 END) AS MecanizacaoAutomatica, Cadeirinha, NULL AS Largura, NULL AS Comprimento, NULL AS Foto, NULL AS Prontuario
    FROM Stage_Veiculo_Modelo3
    UNION ALL
    SELECT ID_Veiculo AS ID, Placa, NULL AS Chassis, ID_Grupo AS Grupo, Marca, Modelo, Cor, Ar_Condicionado, (CASE WHEN Mecanizacao = 'Automatica' THEN 1 ELSE 0 END) AS MecanizacaoAutomatica, Cadeirinha, NULL AS Largura, NULL AS Comprimento, Link_Fotos AS Foto, NULL AS Prontuario
    FROM Stage_Veiculos_Modelo4
) AS Veiculos;

INSERT INTO Dim_Reservas (ID, ClienteId, VeiculoId, PatioId, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao, CarroRetirado, ValorReserva)
SELECT ID, ClienteId, VeiculoId, PatioId, DataReserva, DataPrevistaRetirada, DataPrevistaDevolucao, CarroRetirado, ValorReserva
FROM (
    SELECT * FROM Stage_Reservas_Modelo1
    UNION ALL
    SELECT * FROM Stage_Reservas_Modelo2
    UNION ALL
    SELECT ReservaID AS ID, ClienteID AS ClienteId, VeiculoID AS VeiculoId, NULL AS PatioId, DataReserva, DataInicio AS DataPrevistaRetirada, DataFim AS DataPrevistaDevolucao, (CASE WHEN Status = 'Ativa' THEN 1 ELSE 0 END) AS CarroRetirado, NULL AS ValorReserva
    FROM Stage_Reserva_Modelo3
    UNION ALL
    SELECT ID_Reserva AS ID, ID_Cliente AS ClienteId, ID_Veiculo AS VeiculoId, Patio_Retirada AS PatioId, Data_Reserva AS DataReserva, Data_Inicio AS DataPrevistaRetirada, Data_Fim AS DataPrevistaDevolucao, (CASE WHEN Status_Reserva = 'Ativa' THEN 1 ELSE 0 END) AS CarroRetirado, NULL AS ValorReserva
    FROM Stage_Reservas_Modelo4
) AS Reservas;

INSERT INTO Dim_Patios (ID, Nome, Localizacao)
SELECT ID, Nome, Localizacao
FROM (
    SELECT * FROM Stage_Patio_Modelo1
    UNION ALL
    SELECT * FROM Stage_Patio_Modelo2
    UNION ALL
    SELECT PatioID AS ID, Nome, Endereco AS Localizacao
    FROM Stage_Patio_Modelo3
    UNION ALL
    SELECT ID_Patio AS ID, Nome, Endereco AS Localizacao
    FROM Stage_Patios_Modelo4
) AS Patios;

INSERT INTO Fato_Locacoes (ID, ClienteId, VeiculoId, PatioRetiradoId, PatioDevolucaoId, ReservaId, DataRetirada, DataDevolucao, Valor)
SELECT ID, ClienteId, VeiculoId, PatioRetiradoId, PatioDevolucaoId, ReservaId, DataRetirada, DataDevolucao, Valor
FROM (
    SELECT L.ID, L.ClienteId, L.VeiculoId, L.PatioRetiradoId, L.PatioDevolucaoId, L.ReservaId, L.DataRetirada, L.DataDevolucao, L.Valor
    FROM Stage_Locacao_Modelo1 AS L
    UNION ALL
    SELECT L.ID, L.ClienteId, L.VeiculoId, L.PatioRetiradoId, L.PatioDevolucaoId, L.ReservaId, L.DataRetirada, L.DataDevolucao, L.Valor
    FROM Stage_Locacao_Modelo2 AS L
    UNION ALL
    SELECT L.LocacaoID AS ID, L.ClienteID AS ClienteId, L.VeiculoID AS VeiculoId, L.PatioRetiradaID AS PatioRetiradoId, L.PatioDevolucaoID AS PatioDevolucaoId, L.ReservaID AS ReservaId, L.Retirada AS DataRetirada, L.DevolucaoRealizada AS DataDevolucao, L.Valor
    FROM Stage_Locacao_Modelo3 AS L
    UNION ALL
    SELECT L.ID_Locacao AS ID, R.ID_Cliente AS ClienteId, R.ID_Veiculo AS VeiculoId, L.Patio_Retirada AS PatioRetiradoId, L.Patio_Devolucao AS PatioDevolucaoId, L.ID_Reserva AS ReservaId, L.Data_Retirada AS DataRetirada, L.Data_Devolucao_Realizada AS DataDevolucao, L.Valor
    FROM Stage_Locacoes_Modelo4 AS L
    LEFT JOIN Stage_Reservas_Modelo4 AS R ON L.ID_Reserva = R.ID_Reserva
) AS Locacoes;
