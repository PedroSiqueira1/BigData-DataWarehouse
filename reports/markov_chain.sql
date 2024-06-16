WITH Movimentacoes AS (
    SELECT
        PatioRetiradoId,
        PatioDevolucaoId,
        COUNT(*) AS Movimentacao
    FROM
        Fato_Locacoes
    GROUP BY
        PatioRetiradoId, PatioDevolucaoId
),

TotalMovimentacoes AS (
    SELECT
        PatioRetiradoId,
        SUM(Movimentacao) AS TotalMovimentacoes
    FROM
        Movimentacoes
    GROUP BY
        PatioRetiradoId
)

SELECT
    M.PatioRetiradoId,
    M.PatioDevolucaoId,
    (M.Movimentacao / T.TotalMovimentacoes) * 100 AS PercentualMovimentacao
FROM
    Movimentacoes M
JOIN
    TotalMovimentacoes T
ON
    M.PatioRetiradoId = T.PatioRetiradoId
ORDER BY
    M.PatioRetiradoId,
    M.PatioDevolucaoId;
