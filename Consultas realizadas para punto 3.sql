
--Total registros cargados
SELECT count(*) total_registros
FROM [dbo].[fact_natalidadBogota]



--Promedio de natalidad en el periodo 2009-20024
SELECT avg(TOTAL_NACIDOS) AS promedio_natalidad
FROM dbo.vwTasaNataliad

--A�o con la mayor tasa de natalidad
SELECT top 1 a�o, TOTAL_NACIDOS
FROM vwTasaNataliad
ORDER BY TOTAL_NACIDOS desc;

--A�o con la menor tasa de natalidad
SELECT top 1 a�o, TOTAL_NACIDOS
FROM vwTasaNataliad
ORDER BY TOTAL_NACIDOS;

--Tendencia de natalidad por d�cada
SELECT 
    CASE 
        WHEN a�o BETWEEN 2009 AND 2014 THEN '2009-2014'
        WHEN a�o BETWEEN 2015 AND 2020 THEN '2015-2020'
        WHEN a�o BETWEEN 2021 AND 2024 THEN '2021-2024'
    END AS periodo,
    AVG(TOTAL_NACIDOS) AS promedio_decada
FROM vwTasaNataliad
group by 
CASE 
        WHEN a�o BETWEEN 2009 AND 2014 THEN '2009-2014'
        WHEN a�o BETWEEN 2015 AND 2020 THEN '2015-2020'
        WHEN a�o BETWEEN 2021 AND 2024 THEN '2021-2024'
		end;

--comportamiento cantidad nacimientos por a�o
WITH NacimientosPorA�o AS (
    SELECT 
        YEAR(anio) AS A�o,
        COUNT(*) AS TotalNacimientos
    FROM [dbo].[fact_natalidadBogota]
    GROUP BY YEAR(anio)
)
SELECT 
    A�o,
    TotalNacimientos,
    LAG(TotalNacimientos) OVER (ORDER BY A�o) AS NacimientosPrevio,
    CAST(
        (CAST(TotalNacimientos AS FLOAT) - LAG(TotalNacimientos) OVER (ORDER BY A�o)) 
        / NULLIF(LAG(TotalNacimientos) OVER (ORDER BY A�o), 0) * 100
        AS DECIMAL(10,2)
    ) AS PorcentajeCambio
FROM NacimientosPorA�o
ORDER BY A�o;

--comportamiento total entre 2009 y 2024
WITH NacimientosPorAnio AS (
    SELECT 
        YEAR(anio) AS A�o,
        sum(total_nacidos) AS TotalNacimientos
    FROM [dbo].[fact_natalidadBogota]
    WHERE YEAR(anio) IN (2009, 2024)
    GROUP BY YEAR(anio)
)
SELECT 
    A�o,
    TotalNacimientos,
    CAST(
        (CAST(TotalNacimientos AS FLOAT) - 
         MAX(CASE WHEN A�o = 2009 THEN TotalNacimientos END) OVER ())
        / NULLIF(MAX(CASE WHEN A�o = 2009 THEN TotalNacimientos END) OVER (), 0) * 100
        AS DECIMAL(10,2)
    ) AS PorcentajeVs2009
FROM NacimientosPorAnio
ORDER BY A�o;


