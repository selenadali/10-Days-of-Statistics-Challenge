Select 'Select ' +  SUBSTRING(
(
    SELECT ',' + CASE WHEN DATA_TYPE = 'varchar' THEN  ' Cast(' + Convert(varchar, COLUMN_NAME ) + ' as n' 
    + Convert(varchar, DATA_TYPE) + '(' + Convert(varchar, CHARACTER_MAXIMUM_LENGTH) + ')) ' + Convert(varchar, COLUMN_NAME) + ' '
                        ELSE Convert(varchar, COLUMN_NAME) +' ' END AS 'data()'
        FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TABLE_NAME' FOR XML PATH('')
), 2 , 9999)  + ' From SCH_NAME.TABLE_NAME'


--Returns Select .... From SCH_NAME.TABLE_NAME => for all varchar columns we have Cast(COL_NAME as nvarchar(data_length)) as COL_NAME !
