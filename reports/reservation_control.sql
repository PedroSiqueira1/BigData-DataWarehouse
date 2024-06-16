SELECT
    V.Grupo,
    V.Marca,
    V.Modelo,
    P.Nome AS Patio,
    COUNT(*) AS NumeroReservas,
    CASE
        WHEN FL.DataPrevistaRetirada BETWEEN NOW() AND DATE_ADD(NOW(), INTERVAL 7 DAY) THEN 'Semana que vem'
        WHEN FL.DataPrevistaRetirada BETWEEN DATE_ADD(NOW(), INTERVAL 8 DAY) AND DATE_ADD(NOW(), INTERVAL 30 DAY) THEN 'Mês que vem'
        ELSE 'Futuro'
    END AS Periodo,
    C.Endereco AS CidadeOrigemCliente
FROM
    Dim_Reservas FL
JOIN
    Dim_Veiculos V ON FL.VeiculoId = V.ID
JOIN
    Dim_Patios P ON FL.PatioId = P.ID
JOIN
    Dim_Clientes C ON FL.ClienteId = C.ID
GROUP BY
    V.Grupo, V.Marca, V.Modelo, P.Nome, Periodo, C.Endereco;
