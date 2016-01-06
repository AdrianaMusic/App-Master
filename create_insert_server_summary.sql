
CREATE TABLE app_master_db.servers
(
  asset_id character varying(8000),
  server_asset_id character varying(50000),
  server_asset_name character varying(50000),
  match_level int 
)


CREATE TABLE app_master_db.servers_summary
(
  asset_id character varying(8000),
  server_count character varying(50000)
)

insert into app_master_db.servers_summary select asset_id,count(*) from app_master_db.servers group by asset_id 


insert into app_master_db.servers_summary select asset_id,count(*) from app_master_db.asset_servers_view group by asset_id 


Level 1 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,1
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.cmdb_relation_data level1,
       		app_master_db.app_servers servers        
 	where 	a.asset_id = level1.parent_asset_id
		and a.asset_id=at.app_id
   		and level1.related_asset_id = servers.asset_id and servers.asset_type='Server'



Level 2 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,2
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
       		app_master_db.app_servers servers        
 	where 	a.asset_id=at.app_id
		and a.asset_id not in (select asset_id from app_master_db.servers)
		and a.asset_id = level1.parent_asset_id 
    		and level1.related_asset_id = level2.parent_asset_id
   		and level2.related_asset_id = servers.asset_id and servers.asset_type='Server' 


Level 3 Insert
------------------------------------------------------------------------------------------------------
create temp table with 500 records

CREATE TABLE app_master_db.servers_temp_level3 
(
  asset_id character varying(8000),
  run_value character varying(10)
)
insert into app_master_db.servers_temp_level3
	select	distinct a.asset_id,'1'
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at    
 	where 	a.asset_id=at.app_id
   		and a.asset_id not in (select asset_id from app_master_db.servers) and
   		a.asset_id not in (select asset_id from app_master_db.servers_temp_level3)
	limit 500


insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,3
  	from 	app_master_db.servers_temp_level3 a,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
       		app_master_db.app_servers servers        
 	where 	a.asset_id = level1.parent_asset_id  and a.run_value='1'
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
   		and level3.related_asset_id = servers.asset_id and servers.asset_type='Server'


Level 4 Insert
------------------------------------------------------------------------------------------------------
create temp table with 500 records

CREATE TABLE app_master_db.servers_temp_level4 
(
  asset_id character varying(8000),
  run_value character varying(10)
)
insert into app_master_db.servers_temp_level4
	select	distinct a.asset_id,'1'
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at    
 	where 	a.asset_id=at.app_id
   		and a.asset_id not in (select asset_id from app_master_db.servers) and
   		a.asset_id not in (select asset_id from app_master_db.servers_temp_level4)
	limit 500


insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,4
  	from 	app_master_db.servers_temp_level4 a,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
       		app_master_db.app_servers servers        
 	where 	a.asset_id = level1.parent_asset_id  and a.run_value='1'
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
   		and level4.related_asset_id = servers.asset_id and servers.asset_type='Server'


Level 5 Insert
------------------------------------------------------------------------------------------------------
create temp table with 500 records

CREATE TABLE app_master_db.servers_temp_level5 
(
  asset_id character varying(8000),
  run_value character varying(10)
)
insert into app_master_db.servers_temp_level5
	select	distinct a.asset_id,'1'
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at    
 	where 	a.asset_id=at.app_id
   		and a.asset_id not in (select asset_id from app_master_db.servers) and
   		a.asset_id not in (select asset_id from app_master_db.servers_temp_level5)
	limit 500


insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,5
  	from 	app_master_db.servers_temp_level5 a,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
		app_master_db.cmdb_relation_data level5,
       		app_master_db.app_servers servers        
 	where 	a.asset_id = level1.parent_asset_id  and a.run_value='1'
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
    		and level4.related_asset_id = level5.parent_asset_id
   		and level5.related_asset_id = servers.asset_id and servers.asset_type='Server'




Level 6 Insert
------------------------------------------------------------------------------------------------------
create temp table with 500 records

CREATE TABLE app_master_db.servers_temp_level6 
(
  asset_id character varying(8000),
  run_value character varying(10)
)
insert into app_master_db.servers_temp_level6
	select	distinct a.asset_id,'1'
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at    
 	where 	a.asset_id=at.app_id
   		and a.asset_id not in (select asset_id from app_master_db.servers) and
   		a.asset_id not in (select asset_id from app_master_db.servers_temp_level6)
	limit 500


insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,6
  	from 	app_master_db.servers_temp_level6 a,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
		app_master_db.cmdb_relation_data level5,
		app_master_db.cmdb_relation_data level6,
       		app_master_db.app_servers servers        
 	where 	a.asset_id = level1.parent_asset_id  and a.run_value='1'
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
    		and level4.related_asset_id = level5.parent_asset_id
    		and level5.related_asset_id = level6.parent_asset_id
   		and level6.related_asset_id = servers.asset_id and servers.asset_type='Server'


Level 7 Insert
------------------------------------------------------------------------------------------------------
create temp table with 500 records

CREATE TABLE app_master_db.servers_temp_level7 
(
  asset_id character varying(8000),
  run_value character varying(10)
)
insert into app_master_db.servers_temp_level7
	select	distinct a.asset_id,'1'
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at    
 	where 	a.asset_id=at.app_id
   		and a.asset_id not in (select asset_id from app_master_db.servers) and
   		a.asset_id not in (select asset_id from app_master_db.servers_temp_level7)
	limit 500


insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,7
  	from 	app_master_db.servers_temp_level7 a,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
		app_master_db.cmdb_relation_data level5,
		app_master_db.cmdb_relation_data level6,
		app_master_db.cmdb_relation_data level7,
       		app_master_db.app_servers servers        
 	where 	a.asset_id = level1.parent_asset_id  and a.run_value='1'
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
    		and level4.related_asset_id = level5.parent_asset_id
    		and level5.related_asset_id = level6.parent_asset_id
    		and level6.related_asset_id = level7.parent_asset_id
   		and level7.related_asset_id = servers.asset_id and servers.asset_type='Server'


Exception Report
---------------------------------------------------------------------------------
select 	distinct s.asset_id,cmdb.asset_name,server_asset_name,relationship_type,dependency,
	operating_system,model_name
from  	app_master_db.cmdb_view cmdb,app_master_db.app_servers apps,
	app_master_db.servers s left join app_master_db.cmdb_relation_data r 
	on (s.asset_id=r.parent_asset_id)
where 	s.asset_id in 
	(select	asset_id from app_master_db.servers group by asset_id having 
		count(server_asset_id) > 1000)
	and s.asset_id=cmdb.asset_id and s.server_asset_id=apps.asset_id
order by s.asset_id,server_asset_name



Full Query by talend
----------------------------------------------------------------------------------------
truncate table app_master_db.servers;
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,1
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.cmdb_relation_data level1,
       		app_master_db.app_servers servers        
 	where 	a.asset_id = level1.parent_asset_id
		and a.asset_id=at.app_id
   		and level1.related_asset_id = servers.asset_id and servers.asset_type='Server';
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,2
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
       		app_master_db.app_servers servers        
 	where 	a.asset_id=at.app_id
		and a.asset_id not in (select asset_id from app_master_db.servers)
		and a.asset_id = level1.parent_asset_id 
    		and level1.related_asset_id = level2.parent_asset_id
   		and level2.related_asset_id = servers.asset_id and servers.asset_type='Server';   	
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,3
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
       		app_master_db.app_servers servers        
 	where 	a.asset_id=at.app_id
		and a.asset_id not in (select asset_id from app_master_db.servers)
		and a.asset_id = level1.parent_asset_id 
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
   		and level3.related_asset_id = servers.asset_id and servers.asset_type='Server' ;
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,4
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
       		app_master_db.app_servers servers        
 	where 	a.asset_id=at.app_id
		and a.asset_id not in (select asset_id from app_master_db.servers)
		and a.asset_id = level1.parent_asset_id 
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
   		and level4.related_asset_id = servers.asset_id and servers.asset_type='Server' ;
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,5
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
		app_master_db.cmdb_relation_data level5,
       		app_master_db.app_servers servers        
 	where 	a.asset_id=at.app_id
		and a.asset_id not in (select asset_id from app_master_db.servers)
		and a.asset_id = level1.parent_asset_id 
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
    		and level4.related_asset_id = level5.parent_asset_id
   		and level5.related_asset_id = servers.asset_id and servers.asset_type='Server';	
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,6
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
		app_master_db.cmdb_relation_data level5,
		app_master_db.cmdb_relation_data level6,
       		app_master_db.app_servers servers        
 	where 	a.asset_id=at.app_id
		and a.asset_id not in (select asset_id from app_master_db.servers)
		and a.asset_id = level1.parent_asset_id 
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
    		and level4.related_asset_id = level5.parent_asset_id
    		and level5.related_asset_id = level6.parent_asset_id
   		and level6.related_asset_id = servers.asset_id and servers.asset_type='Server';
insert into app_master_db.servers
	select	distinct a.asset_id,servers.asset_id,servers.asset_name,7
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
         	app_master_db.cmdb_relation_data level1,
		app_master_db.cmdb_relation_data level2,
		app_master_db.cmdb_relation_data level3,
		app_master_db.cmdb_relation_data level4,
		app_master_db.cmdb_relation_data level5,
		app_master_db.cmdb_relation_data level6,
		app_master_db.cmdb_relation_data level7,
       		app_master_db.app_servers servers        
 	where 	a.asset_id=at.app_id
		and a.asset_id not in (select asset_id from app_master_db.servers)
		and a.asset_id = level1.parent_asset_id 
    		and level1.related_asset_id = level2.parent_asset_id
    		and level2.related_asset_id = level3.parent_asset_id
    		and level3.related_asset_id = level4.parent_asset_id
    		and level4.related_asset_id = level5.parent_asset_id
    		and level5.related_asset_id = level6.parent_asset_id
    		and level6.related_asset_id = level7.parent_asset_id
   		and level7.related_asset_id = servers.asset_id and servers.asset_type='Server' ;   		

