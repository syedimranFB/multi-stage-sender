-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------


IF EXISTS ( SELECT * FROM sys.views 
WHERE object_id = OBJECT_ID('silver.COMPANY') )
DROP view silver.COMPANY
GO 

create view silver.COMPANY as 

SELECT 
CAST (CompanyID as int) as 'CompanyID'
,CompanyName
,CountryCode as 'CountryCode3Letter'
FROM bronze.COMPANY
where CompanyID <> 'xxxx'

GO



-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------


IF EXISTS ( SELECT * FROM sys.views 
WHERE object_id = OBJECT_ID('silver.TEAM') )
DROP view silver.TEAM
GO 

create view silver.TEAM as 

SELECT
Cast (CompanyID as int) as 'CompanyID'
,cast (TeamID as int) as 'TeamID'
,TeamName
from bronze.TEAM

GO