SELECT
    P.Nome AS Patio,
    V.Grupo,
    V.Marca,
    V.Modelo,
    V.MecanizacaoAutomatica
FROM
    Dim_Veiculos V
JOIN
    Fato_Locacoes FL ON V.ID = FL.VeiculoId
JOIN
    Dim_Patios P ON FL.PatioDevolucaoId = P.ID
WHERE
    FL.DataDevolucao IS NULL;
