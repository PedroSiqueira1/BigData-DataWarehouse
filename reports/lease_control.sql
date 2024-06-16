SELECT
    V.Grupo,
    V.Marca,
    V.Modelo,
    V.MecanizacaoAutomatica,
    FL.DataRetirada,
    FL.DataDevolucao,
    DATEDIFF(FL.DataDevolucao, FL.DataRetirada) AS TempoLocacao,
    DATEDIFF(FL.DataDevolucao, NOW()) AS TempoRestante
FROM
    Fato_Locacoes FL
JOIN
    Dim_Veiculos V ON FL.VeiculoId = V.ID
WHERE
    FL.DataDevolucao > NOW();
