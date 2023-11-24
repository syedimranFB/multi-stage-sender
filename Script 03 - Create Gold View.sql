
-----------------------------------------------------
-----------------------------------------------------
-----------------------------------------------------

-- devops ci-cd testing, test env - prod env adding this new line
IF EXISTS ( SELECT * FROM sys.views 
WHERE object_id = OBJECT_ID('gold.TEAM') )
DROP view gold.TEAM
GO 

create view gold.TEAM as 

SELECT TeamID, TeamName, CompanyName
from silver.TEAM t 
join silver.COMPANY c on t.CompanyID = c.CompanyID
