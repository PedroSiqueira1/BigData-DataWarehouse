-- Modelo 1
INSERT INTO Stage_Clientes_Modelo1
SELECT * FROM Fonte_Clientes_Modelo1;

INSERT INTO Stage_Veiculo_Modelo1
SELECT * FROM Fonte_Veiculos_Modelo1;

INSERT INTO Stage_Reservas_Modelo1
SELECT * FROM Fonte_Reservas_Modelo1;

INSERT INTO Stage_Locacao_Modelo1
SELECT * FROM Fonte_Locacoes_Modelo1;

INSERT INTO Stage_Patio_Modelo1
SELECT * FROM Fonte_Patios_Modelo1;

-- Modelo 2
INSERT INTO Stage_Clientes_Modelo2
SELECT * FROM Fonte_Clientes_Modelo2;

INSERT INTO Stage_Veiculo_Modelo2
SELECT * FROM Fonte_Veiculos_Modelo2;

INSERT INTO Stage_Reservas_Modelo2
SELECT * FROM Fonte_Reservas_Modelo2;

INSERT INTO Stage_Locacao_Modelo2
SELECT * FROM Fonte_Locacoes_Modelo2;

INSERT INTO Stage_Patio_Modelo2
SELECT * FROM Fonte_Patios_Modelo2;

-- Modelo 3
INSERT INTO Stage_Cliente_Modelo3
SELECT * FROM Fonte_Clientes_Modelo3;

INSERT INTO Stage_Condutor_Modelo3
SELECT * FROM Fonte_Condutores_Modelo3;

INSERT INTO Stage_Reserva_Modelo3
SELECT * FROM Fonte_Reservas_Modelo3;

INSERT INTO Stage_Locacao_Modelo3
SELECT * FROM Fonte_Locacoes_Modelo3;

INSERT INTO Stage_Veiculo_Modelo3
SELECT * FROM Fonte_Veiculos_Modelo3;

INSERT INTO Stage_Patio_Modelo3
SELECT * FROM Fonte_Patios_Modelo3;

-- Modelo 4
INSERT INTO Stage_Clientes_Modelo4
SELECT * FROM Fonte_Clientes_Modelo4;

INSERT INTO Stage_Veiculos_Modelo4
SELECT * FROM Fonte_Veiculos_Modelo4;

INSERT INTO Stage_Reservas_Modelo4
SELECT * FROM Fonte_Reservas_Modelo4;

INSERT INTO Stage_Locacoes_Modelo4
SELECT * FROM Fonte_Locacoes_Modelo4;

INSERT INTO Stage_Patios_Modelo4
SELECT * FROM Fonte_Patios_Modelo4;