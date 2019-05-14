--Current users permissions on DATABASE
SELECT * FROM fn_my_permissions (NULL, 'DATABASE');  

--All users/user roles permissions on db
SELECT DISTINCT pr.principal_id, pr.name, pr.type_desc, 
    pr.authentication_type_desc, pe.state_desc, pe.permission_name
FROM sys.database_principals AS pr
JOIN sys.database_permissions AS pe
    ON pe.grantee_principal_id = pr.principal_id;
    
-- DB user role - user name , type etc.. join
SELECT DP1.name AS DatabaseRoleName,   
    isnull (DP2.name, 'No members') AS DatabaseUserName   
	, DP2.*
FROM sys.database_role_members AS DRM  
RIGHT OUTER JOIN sys.database_principals AS DP1  
    ON DRM.role_principal_id = DP1.principal_id  
LEFT OUTER JOIN sys.database_principals AS DP2  
    ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
ORDER BY DP1.name;  

-- DB user_name - permission
SELECT
   ISNULL(OBJECT_NAME(major_id),'') [Objects], USER_NAME(grantee_principal_id) as [UserName], permission_name as [PermissionName]
FROM
    sys.database_permissions p
WHERE grantee_principal_id>0
ORDER BY
    OBJECT_NAME(major_id), USER_NAME(grantee_principal_id), permission_name 


-- https://docs.microsoft.com/en-us/sql/relational-databases/system-functions/sys-fn-my-permissions-transact-sql?view=sql-server-2017
