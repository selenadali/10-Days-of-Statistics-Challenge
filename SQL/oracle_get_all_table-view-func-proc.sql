--view
select  
       col.table_name, 
       col.column_name, 
       col.column_id,
       col.data_type, 
       col.data_length, 
       col.data_precision, 
       col.data_scale, 
       col.nullable
from sys.all_tab_columns col
inner join sys.all_views v on col.owner = v.owner 
                              and col.table_name = v.view_name
                              --where col.owner = 'xxx'
order by col.table_name, col.column_id; 

--table
select  
       col.table_name, 
       col.column_name, 
       col.column_id,
       col.data_type, 
       col.data_length, 
       col.data_precision, 
       col.data_scale, 
       col.nullable
from sys.all_tab_columns col
inner join sys.all_tables v on col.owner = v.owner 
                              and col.table_name = v.table_name 
                              --where col.owner = 'xxx'
order by col.table_name, col.column_id; 

--proc
select 
p.object_name as table_name,
a.argument_name as column_name,
a.position as column_id,
a.data_type,
a.data_length,
a.data_precision,
a.data_scale,
a.defaulted as nullable
from sys.all_procedures p inner join sys.all_arguments a 
on  p.object_id = a.object_id
where a.in_out = 'IN' --and (p.object_name like '%xxx%' or p.object_name like 'xxx%' or p.object_name like 'xxx%' ) 
order by p.object_name,a.position

--func
select 
p.object_name as table_name,
a.argument_name as column_name,
a.position as column_id,
a.data_type,
a.data_length,
a.data_precision,
a.data_scale,
a.defaulted as nullable
from ALL_OBJECTS p inner join sys.all_arguments a 
on  p.object_id = a.object_id
where p.object_type = 'FUNCTION' --and (p.object_name like '%xxx%' or  p.object_name like 'xxx%' or p.object_name like 'xxx%')
and a.ARGUMENT_NAME is not null
order by p.object_name,a.position
