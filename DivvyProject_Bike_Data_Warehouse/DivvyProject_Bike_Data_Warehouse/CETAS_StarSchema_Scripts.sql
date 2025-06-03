-- Script to create dim_rider
IF OBJECT_ID('dbo.dim_rider') IS NOT NULL 
BEGIN
    DROP EXTERNAL TABLE dbo.dim_rider;
END

CREATE EXTERNAL TABLE [dbo].[dim_rider] WITH(
    LOCATION = 'Star_schemas/dim_rider',
    DATA_SOURCE = [data_bikesharedata_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
SELECT
    [Rider_Id],
    [Address],
    [First_Name],
    [Last_Name],
    [Birthday],
    [Account_start_date],
    [Account_end_date],
    [Is_member]
FROM
    dbo.staging_rider
);

Go

SELECT
    TOP 10*
FROM 
    [dbo].[dim_rider];

-- Script to create dim_station
IF OBJECT_ID('dbo.dim_station') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.dim_station
END

CREATE EXTERNAL TABLE [dbo].[dim_station] WITH(
    LOCATION = 'Star_schemas/dim_station',
    DATA_SOURCE = [data_bikesharedata_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        [Station_ID],
        [Name],
        [Latitude],
        [Longitude]
    FROM
        dbo.staging_station
);

Go
SELECT
    TOP 10*
FROM 
    [dbo].[dim_station];

-- Script to create fact_trip
IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.fact_trip
END

CREATE EXTERNAL TABLE [dbo].[fact_trip] WITH(
    LOCATION = 'Star_schemas/fact_trip',
    DATA_SOURCE = [data_bikesharedata_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        st.Trip_Id,
        st.rideable_type,
        st.Member_Id AS rider_id,
        st.Started_At,
        st.Ended_At,
        st.Start_Station_Id,
        st.End_Station_Id,
        DATEDIFF(HOUR, st.Started_At, st.Ended_At) AS Duration,
        DateDIFF(YEAR, sr.Birthday, st.Started_At) AS rider_age
    FROM
        dbo.staging_trip AS st
        JOIN dbo.staging_rider AS sr
        ON sr.Rider_Id = st.Member_Id
);

Go
SELECT
    TOP 10*
FROM 
    [dbo].[fact_trip];

-- Script to create fact_payment
IF OBJECT_ID('dbo.fact_payment') IS NOT NULL
BEGIN
    DROP EXTERNAL TABLE dbo.fact_payment;
END

CREATE EXTERNAL TABLE [dbo].[fact_payment] WITH (
    LOCATION = 'Star_schemas/fact_payment',
    DATA_SOURCE = [data_bikesharedata_dfs_core_windows_net],
    FILE_FORMAT = [SynapseDelimitedTextFormat]
) AS (
    SELECT
        PaymentID AS payment_id,
        PaymentDate AS date,
        Amount AS amount,
        AccountNumber AS rider_id
    FROM
        dbo.staging_payment
);

GO

SELECT TOP 10 * FROM [dbo].[fact_payment];


