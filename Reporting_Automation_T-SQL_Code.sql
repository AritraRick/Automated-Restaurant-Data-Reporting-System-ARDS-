-- This is the stored procedure which will import data from the csv files into the table OCT_FUNNEL

create procedure DataImport
as
DECLARE @startFlag INT, @endFlag INT, @filePath VARCHAR(255), @cmd VARCHAR(1000), @fileCount VARCHAR(1000)

-- Enable xp_cmdshell if it's disabled
--EXEC sp_configure 'show advanced options', 1;
--RECONFIGURE;
--EXEC sp_configure 'xp_cmdshell', 1;
--RECONFIGURE;

SET @filePath = 'C:\Users\Olivia\Desktop\MyProject\' -- Path to the folder containing CSV files
SET @cmd = 'dir "' + @filePath + 'Spice Advisors _ Funnel metrics *.csv /b' -- Command to list CSV files in the folder

-- Execute command to get file list
CREATE TABLE #FileList (FileName VARCHAR(255))
INSERT INTO #FileList EXEC xp_cmdshell @cmd

-- Count the files
SELECT @fileCount = COUNT(*) FROM #FileList WHERE FileName IS NOT NULL AND FileName != ''

SET @startFlag = 1
SET @endFlag = CAST(@fileCount AS INT)

truncate table OCT_FUNNEL

WHILE (@startFlag <= @endFlag)
BEGIN
  SET @filePath = 'C:\Users\Olivia\Desktop\MyProject\Spice Advisors _ Funnel metrics ' + CAST(@startFlag AS VARCHAR(3)) + '.csv'

  EXEC('BULK INSERT OCT_FUNNEL FROM ''' + @filePath + ''' WITH (FORMAT = ''CSV'', FIRSTROW = 2, FIELDTERMINATOR = '','', ROWTERMINATOR = ''\n'')')

  SET @startFlag = @startFlag + 1
END

DROP TABLE #FileList
go



-- This view is created to see and compare the data in the OCT_FUNNEL table segmentwise

create view SegmentWiseData
as
  SELECT
    'breakfast' AS segment, res_id, res_name,
    bf_ov as ov, bf_m2o as m2o, bf_vis as vis
  FROM OCT_FUNNEL --where res_id = 20041385
  UNION ALL
  SELECT
    'lunch' AS segment, res_id, res_name,
    lunch_ov, lunch_m2o, 0
  FROM OCT_FUNNEL
  UNION ALL
  SELECT
    'snacks' AS segment, res_id, res_name,
    snacks_ov, snacks_m2o, snacks_vis
  FROM OCT_FUNNEL
  UNION ALL
  SELECT
    'dinner' AS segment, res_id, res_name,
    dinner_ov, dinner_m2o, dinner_vis
  FROM OCT_FUNNEL
  UNION ALL
  SELECT
    'ln' AS segment, res_id, res_name,
    ln_ov, ln_m2o, ln_vis
  FROM OCT_FUNNEL
  UNION ALL
  SELECT
    'la' AS segment, res_id, res_name,
    la_ov, la_m2o, 0
  FROM OCT_FUNNEL
  UNION ALL
  SELECT
    'mm' AS segment, res_id, res_name,
    mm_ov, mm_m2o, 0
  FROM OCT_FUNNEL
  UNION ALL
  SELECT
    'um' AS segment, res_id, res_name,
    um_ov, um_m2o, 0
  FROM OCT_FUNNEL


