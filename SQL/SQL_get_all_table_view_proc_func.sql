--Functions
select 
Object_Name(o.object_id) as table_name,
p.name as column_name,
p.parameter_id as column_id,
TYPE_NAME(user_type_id) as data_type,
p.max_length as data_length,
p.precision as data_precision,
p.scale as data_scale,
p.is_nullable as nullable
from sys.all_objects o  
inner join sys.all_parameters p on o.object_id=p.object_id
where o.type_desc like '%FUNCTION%'  ---and (o.name like 'xxx%' or o.name like 'xxx%' or o.name like 'xxx%') 
order by 1  ,3 
--FOR JSON PATH

--Procedures
select 
Object_Name(o.object_id) as table_name,
p.name as column_name,
p.parameter_id as column_id,
TYPE_NAME(user_type_id) as data_type,
p.max_length as data_length,
p.precision as data_precision,
p.scale as data_scale,
p.is_nullable as nullable
from sys.all_objects o  
inner join sys.all_parameters p on o.object_id=p.object_id
where o.type_desc like '%PROC%'  -- and (o.name like '%xxx%' or o.name like 'xxx%' or o.name like 'xxx%')
order by 1  ,3 
--FOR JSON PATH

--Tables with colums
Select
Object_Name(o.object_id) as table_name,
c.name as column_name,
c.column_id,
TYPE_NAME(user_type_id) as data_type,
c.max_length as data_length,
c.precision as data_precision,
c.scale as data_scale,
c.is_nullable as nullable
from sys.all_objects o
inner join sys.all_columns c on o.object_id = c.object_id
Where o.type_desc like 'USER_TABLE%' --  and schema_name(o.schema_id) in ('xxx') and o.name not like ('xxx%')
order by 1  ,3 
--FOR JSON PATH

--Views with colums
Select
Object_Name(o.object_id) as table_name,
c.name as column_name,
c.column_id,
TYPE_NAME(user_type_id) as data_type,
c.max_length as data_length,
c.precision as data_precision,
c.scale as data_scale,
c.is_nullable as nullable
from sys.all_objects o
inner join sys.all_columns c on o.object_id = c.object_id
Where o.type_desc like 'VIEW%' --and schema_name(o.schema_id) in ('xxx')  
order by 1  ,3 
--FOR JSON PATH
