SELECT
    V.Grupo,
    V.Marca,
    V.Modelo,
    COUNT(FL.ID) AS NumeroLocacoes,
    C.Endereco AS CidadeOrigemCliente
FROM
    Fato_Locacoes FL
JOIN
    Dim_Veiculos V ON FL.VeiculoId = V.ID
JOIN
    Dim_Clientes C ON FL.ClienteId = C.ID
GROUP BY
    V.Grupo, V.Marca, V.Modelo, C.Endereco
ORDER BY
    NumeroLocacoes DESC;
