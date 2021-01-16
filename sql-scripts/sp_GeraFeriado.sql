IF OBJECT_ID('sp_GeraFeriado', 'P') IS NOT NULL  
   DROP PROCEDURE sp_GeraFeriado;  
GO  
/* --------------------------------------------------------------
	Objeto: sp_GeraFeriado
	Data Cria��o: 16/01/2021
	Responsavel: Tiago Ferrucio
	Hist�rico de mudan�a:/
   --------------------------------------------------------------  */
CREATE PROCEDURE dbo.sp_GeraFeriado
AS BEGIN
    

    -------------------------------
    -- Cria a tabela se n�o existir
    -------------------------------

    IF (OBJECT_ID('dbo.Feriado') IS NULL)
    BEGIN
        
        -- DROP TABLE dbo.Feriado
        CREATE TABLE dbo.Feriado (
            Nr_Ano SMALLINT NOT NULL,
            Nr_Mes SMALLINT NOT NULL,
            Nr_Dia SMALLINT NOT NULL,
            Tp_Feriado CHAR(1) NULL,
            Ds_Feriado VARCHAR(100) NOT NULL,
            Sg_UF CHAR(2) NOT NULL
        )
        
        ALTER TABLE dbo.Feriado ADD CONSTRAINT [Pk_Feriado] PRIMARY KEY CLUSTERED  ([Nr_Ano], [Nr_Mes], [Nr_Dia], [Sg_UF]) WITH (FILLFACTOR=90, PAD_INDEX=ON) ON [PRIMARY]


    END


    -- Apaga os dados se j� tiverem sido populados
    TRUNCATE TABLE dbo.Feriado


    -------------------------------
    -- Feriados nacionais
    -------------------------------

    INSERT INTO dbo.Feriado
    SELECT 0, 1, 1, 1, 'Confraterniza��o Universal', ''
    UNION
    SELECT 0, 4, 21, 1, 'Tiradentes', ''
    UNION
    SELECT 0, 5, 1, 1, 'Dia do Trabalhador', ''
    UNION
    SELECT 0, 9, 7, 1, 'Independ�ncia', ''
    UNION
    SELECT 0, 10, 12, 1, 'Nossa Senhora Aparecida', ''
    UNION
    SELECT 0, 11, 2, 1, 'Finados', ''
    UNION
    SELECT 0, 11, 15, 1, 'Proclama��o da Rep�blica', ''
    UNION
    SELECT 0, 11, 20, 1, 'Consci�ncia Negra', ''
    UNION
    SELECT 0, 12, 25, 1, 'Natal', ''



    -------------------------------
    -- Feriados estaduais
    -------------------------------

    -- Acre
    INSERT INTO dbo.Feriado
    SELECT 0, 1, 23, 2, 'Dia do evang�lico', 'AC'
    UNION
    SELECT 0, 3, 8, 2, 'Alusivo ao Dia Internacional da Mulher', 'AC'
    UNION
    SELECT 0, 6, 15, 2, 'Anivers�rio do estado', 'AC'
    UNION
    SELECT 0, 9, 5, 2, 'Dia da Amaz�nia', 'AC'
    UNION
    SELECT 0, 11, 17, 2, 'Assinatura do Tratado de Petr�polis', 'AC'

    -- Alagoas
    INSERT INTO dbo.Feriado
    SELECT 0, 6, 24, 2, 'S�o Jo�o', 'AL'
    UNION
    SELECT 0, 6, 29, 2, 'S�o Pedro', 'AL'
    UNION
    SELECT 0, 9, 16, 2, 'Emancipa��o pol�tica', 'AL'
    UNION
    SELECT 0, 11, 20, 2, 'Morte de Zumbi dos Palmares', 'AL'

    -- Amap�
    INSERT INTO dbo.Feriado
    SELECT 0, 3, 19, 2, 'Dia de S�o Jos�, santo padroeiro do Estado do Amap�', 'AP'
    UNION
    SELECT 0, 9, 13, 2, 'Cria��o do Territ�rio Federal (Data Magna do estado)', 'AP'

    -- Amazonas
    INSERT INTO dbo.Feriado
    SELECT 0, 9, 5, 2, 'Eleva��o do Amazonas � categoria de prov�ncia', 'AM'
    UNION
    SELECT 0, 11, 20, 2, 'Dia da Consci�ncia Negra', 'AM'

    -- Bahia
    INSERT INTO dbo.Feriado
    SELECT 0, 7, 2, 2, 'Independ�ncia da Bahia�(Data magna do estado)', 'BA'

    -- Cear�
    INSERT INTO dbo.Feriado
    SELECT 0, 3, 25, 2, 'Data magna do estado (data da aboli��o da escravid�o no Cear�)', 'CE'

    -- Distrito Federal
    INSERT INTO dbo.Feriado
    SELECT 0, 4, 21, 2, 'Funda��o de�Bras�lia', 'DF'
    UNION
    SELECT 0, 11, 30, 2, 'Dia do�evang�lico', 'DF'

    -- Maranh�o
    INSERT INTO dbo.Feriado
    SELECT 0, 7, 28, 2, 'Ades�o do Maranh�o �independ�ncia do Brasil', 'MA'

    -- Mato Grosso
    INSERT INTO dbo.Feriado
    SELECT 0, 11, 20, 2, 'Dia da Consci�ncia Negra', 'MT'

    -- Mato Grosso do Sul
    INSERT INTO dbo.Feriado
    SELECT 0, 10, 11, 2, 'Cria��o do estado', 'MS'

    -- Minas Gerais
    INSERT INTO dbo.Feriado
    SELECT 0, 4, 21, 2, 'Data magna do estado', 'MG'

    -- Par�
    INSERT INTO dbo.Feriado
    SELECT 0, 8, 15, 2, 'Ades�o do�Gr�o-Par��independ�ncia do Brasil�(data magna)', 'PA'

    -- Para�ba
    INSERT INTO dbo.Feriado
    SELECT 0, 7, 26, 2, 'Homenagem � mem�ria do ex-presidente Jo�o Pessoa', 'PB'
    UNION
    SELECT 0, 8, 5, 2, 'Funda��o do Estado em 1585', 'PB'

    -- Paran�
    INSERT INTO dbo.Feriado
    SELECT 0, 12, 19, 2, 'Emancipa��o pol�tica (emancipa��o do�Paran�)', 'PR'

    -- Piau�
    INSERT INTO dbo.Feriado
    SELECT 0, 10, 19, 2, 'Dia do�Piau�', 'PI'

    -- Rio de Janeiro
    INSERT INTO dbo.Feriado
    SELECT 0, 4, 23, 2, 'Dia de�S�o Jorge', 'RJ'
    UNION
    SELECT 0, 11, 20, 2, 'Dia da Consci�ncia Negra', 'RJ'

    -- Rio Grande do Norte
    INSERT INTO dbo.Feriado
    SELECT 0, 10, 3, 2, 'M�rtires de Cunha� e Urua�u', 'RN'

    -- Rio Grande do Sul
    INSERT INTO dbo.Feriado
    SELECT 0, 9, 20, 2, 'Proclama��o da Rep�blica Rio-Grandense', 'RS'

    -- Rond�nia
    INSERT INTO dbo.Feriado
    SELECT 0, 1, 4, 2, 'Cria��o do estado (data magna)', 'RO'
    UNION
    SELECT 0, 6, 18, 2, 'Dia do evang�lico', 'RO'

    -- Roraima
    INSERT INTO dbo.Feriado
    SELECT 0, 10, 5, 2, 'Cria��o do estado', 'RR'

    -- Santa Catarina
    INSERT INTO dbo.Feriado
    SELECT 0, 10, 5, 2, 'Dia de Santa Catarina', 'SC'

    -- S�o Paulo
    INSERT INTO dbo.Feriado
    SELECT 0, 7, 9, 2, 'Revolu��o Constitucionalista de 1932�(Data magna do estado)', 'SP'
	union
	SELECT 0, 1, 25, 2, 'Anivers�rio de S�o Paulo', 'SP'

    -- Sergipe
    INSERT INTO dbo.Feriado
    SELECT 0, 3, 17, 2, 'Anivers�rio de Aracaju', 'SE'
    UNION
    SELECT 0, 6, 24, 2, 'S�o Jo�o', 'SE'
    UNION
    SELECT 0, 7, 8, 2, 'Autonomia pol�tica de Sergipe', 'SE'
    UNION
    SELECT 0, 12, 8, 2, 'Nossa Senhora da Concei��o', 'SE'

    -- Tocantins
    INSERT INTO dbo.Feriado
    SELECT 0, 10, 5, 2, 'Cria��o do estado', 'TO'
    UNION
    SELECT 0, 3, 18, 2, 'Autonomia do Estado (cria��o da Comarca do Norte)', 'TO'
    UNION
    SELECT 0, 9, 8, 2, 'Padroeira do Estado (Nossa Senhora da Natividade)', 'TO'

    
    -------------------------------
    -- Feriados m�veis
    -------------------------------

    DECLARE
        @ano INT,
        @seculo INT,
        @G INT,
        @K INT,
        @I INT,
        @H INT,
        @J INT,
        @L INT,
        @MesDePascoa INT,
        @DiaDePascoa INT,
        @pascoa DATETIME 


    DECLARE 
        @Dt_Inicial datetime = '1990-01-01',
        @Dt_Final datetime = '2099-01-01'


    WHILE(@Dt_Inicial <= @Dt_Final)
    BEGIN
        
        SET @ANO = YEAR(@Dt_Inicial)

        SET @seculo = @ano / 100 
        SET @G = @ano % 19
        SET @K = ( @seculo - 17 ) / 25
        SET @I = ( @seculo - CAST(@seculo / 4 AS int) - CAST(( @seculo - @K ) / 3 AS int) + 19 * @G + 15 ) % 30
        SET @H = @I - CAST(@I / 28 AS int) * ( 1 * -CAST(@I / 28 AS int) * CAST(29 / ( @I + 1 ) AS int) ) * CAST(( ( 21 - @G ) / 11 ) AS int)
        SET @J = ( @ano + CAST(@ano / 4 AS int) + @H + 2 - @seculo + CAST(@seculo / 4 AS int) ) % 7
        SET @L = @H - @J
        SET @MesDePascoa = 3 + CAST(( @L + 40 ) / 44 AS int)
        SET @DiaDePascoa = @L + 28 - 31 * CAST(( @MesDePascoa / 4 ) AS int)
        SET @pascoa = CAST(@MesDePascoa AS varchar(2)) + '-' + CAST(@DiaDePascoa AS varchar(2)) + '-' + CAST(@ano AS varchar(4))

        
        INSERT INTO dbo.Feriado
        SELECT YEAR(DATEADD(DAY , -2, @pascoa)), MONTH(DATEADD(DAY , -2, @pascoa)), DAY(DATEADD(DAY , -2, @pascoa)), 1, 'Paix�o de Cristo', ''
        
        INSERT INTO dbo.Feriado
        SELECT YEAR(DATEADD(DAY , -48, @pascoa)), MONTH(DATEADD(DAY , -48, @pascoa)), DAY(DATEADD(DAY , -48, @pascoa)), 1, 'Carnaval', ''
        
        INSERT INTO dbo.Feriado
        SELECT YEAR(DATEADD(DAY , -47, @pascoa)), MONTH(DATEADD(DAY , -47, @pascoa)), DAY(DATEADD(DAY , -47, @pascoa)), 1, 'Carnaval', ''
        
        INSERT INTO dbo.Feriado
        SELECT YEAR(DATEADD(DAY , 60, @pascoa)), MONTH(DATEADD(DAY , 60, @pascoa)), DAY(DATEADD(DAY , 60, @pascoa)), 1, 'Corpus Christi', ''
        

        SET @Dt_Inicial = DATEADD(YEAR, 1, @Dt_Inicial)
        

    END

    
END