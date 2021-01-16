IF OBJECT_ID('sp_GeraDimCalendario', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GeraDimCalendario;  
GO  
/* --------------------------------------------------------------
	Objeto: sp_GeraDimCalendario
	Data Criação: 16/01/2021
	Responsavel: Tiago Ferrucio
	Histórico de mudança:/
   --------------------------------------------------------------  */
CREATE PROCEDURE [dbo].[sp_GeraDimCalendario] (@FIRST_DATE  DATETIME 
                                               , @LAST_DATE DATETIME) 
AS 
  BEGIN
	SET LANGUAGE 'Portuguese';
	EXEC dbo.sp_GeraFeriado;
      WITH te_os_dim_date 
           AS (SELECT Cast (@FIRST_DATE AS DATETIME) Date --Start Date 
               UNION ALL 
               SELECT date + 1 
               FROM   te_os_dim_date 
               WHERE  date + 1 < = @LAST_DATE --End date 
              )
	  INSERT INTO DimCalendario (
								  SKCalendario
								, DataCompleta
								, Dia
								, Semana
								, DiaSemana
								, DiaSemanaAbreviado
								, NomeSemana
								, Mes
								, NomeMes
								, NomeMesAbreviado
								, Trimestre
								, NomeTrimestre
								, TrimestreAbreviado
								, Ano
								, AnoAbreviado
								, MesAno
								, Feriado
								, DescricaoFeriado
								, DiaUtil
								) 
      SELECT Cast(CONVERT(NVARCHAR(30), date, 112) AS INT)                 AS SkCalendario 
             , LEFT(Cast(CONVERT(NVARCHAR(30), date, 120) AS VARCHAR), 10) AS DataCompleta
			 , Day (date)												   AS Dia
			 , Datepart (dw, date)                                         AS Semana
             , Datename (dw, date)                                         AS DiaSemana 
             , LEFT (Datename (dw, date), 3)                               AS DiaSemanaAbreviado 
             , CONVERT(VARCHAR(4), Year(date)) + '-Semana-' 
               + Cast(Datepart (wk, date) AS VARCHAR)                      AS NomeSemana 
			 , Month(date)                                                 AS Mes
             , Datename (mm, date)                                         AS NomeMes 
             , LEFT (Datename (mm, date), 3)                               as NomeMesAbreviado 
             , Datepart (qq, date)                                         AS Trimestre 
             , Datename(year, date) + ' Tri '
               + Datename(quarter, date)                                   AS NomeTrimestre 
             , 'Tri ' + Datename(quarter, date)                            AS NomeTrimestreAbreviado
             , Year (date)                                                 AS Ano
			 , RIGHT(Year (date),2)										   AS AnoAbreviado
			 , LEFT(Datename(mm,date),3) + '/' 
			  + CONVERT(VARCHAR(4),Year(date))							   AS AnoMes
			 , case 
				when (feriado_fixo.Ds_Feriado is not null) or (feriado_movel.Ds_Feriado is not null)  then 'Sim' 
				else 'Não' end											   AS Feriado
			 , ISNULL(feriado_fixo.Ds_Feriado,feriado_movel.Ds_Feriado)	   AS DescricaoFeriado
			 , Case 
			    when (feriado_fixo.Ds_Feriado is not null) or (feriado_movel.Ds_Feriado is not null) or  Datepart (dw, date) in (1,7) then 'Sim'
				else 'Não' end											   AS DiaUtil 
      FROM   te_os_dim_date
	  left join (select * from dbo.Feriado where nr_ano = 0 and (Sg_UF = 'SP' or Sg_UF = '')) as feriado_fixo
	   on   feriado_fixo.Nr_Mes = Month(te_os_dim_date.date) 
	    and feriado_fixo.Nr_Dia = Day(te_os_dim_date.date)
	  left join (select * from dbo.Feriado where nr_ano != 0 and (Sg_UF = 'SP' or Sg_UF = '')) as feriado_movel
	   on  feriado_movel.Nr_Mes = Month(te_os_dim_date.date) 
	   and feriado_movel.Nr_Dia = Day(te_os_dim_date.date)
	   and feriado_movel.Nr_Ano = Year(te_os_dim_date.date)
      OPTION (maxrecursion 0) 
  END 

go


