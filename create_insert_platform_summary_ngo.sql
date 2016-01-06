
CREATE TABLE app_master_db.platforms
(
  asset_id character varying(8000),
  platform_asset_id character varying(50000),
  platform_asset_name character varying(50000),
  platform_ci_class character varying(50000),
  platform_parent_id character varying(50000),
  lv1_pf_asset_id character varying(50000),
  lv1_pf_asset_name character varying(50000),
  lv1_pf_ci_class character varying(50000),
  lv2_pf_asset_id character varying(50000),
  lv2_pf_asset_name character varying(50000),
  lv2_pf_ci_class character varying(50000),
  lv3_pf_asset_id character varying(50000),
  lv3_pf_asset_name character varying(50000),
  lv3_pf_ci_class character varying(50000),
  lv4_pf_asset_id character varying(50000),
  lv4_pf_asset_name character varying(50000),
  lv4_pf_ci_class character varying(50000),
  lv5_pf_asset_id character varying(50000),
  lv5_pf_asset_name character varying(50000),
  lv5_pf_ci_class character varying(50000),
  lv6_pf_asset_id character varying(50000),
  lv6_pf_asset_name character varying(50000),
  lv6_pf_ci_class character varying(50000),
  lv7_pf_asset_id character varying(50000),
  lv7_pf_asset_name character varying(50000),
  lv7_pf_ci_class character varying(50000),
  match_hierarchy character varying(50000),
  match_level int 
)


CREATE TABLE app_master_db.platforms_summary
(
  asset_id character varying(8000),
  platform_count character varying(50000)
)




Level 1 Insert
------------------------------------------------------------------------------------------------------


insert into app_master_db.platforms
	select	distinct a.asset_id,pf.asset_id,pf.asset_name,level1.child_ci_class,level1.parent_asset_id,
		level1.child_asset_id,level1.child_ci_name,level1.child_ci_class,
		'','','',
		'','','',
		'','','',
		'','','',
		'','','',
		'','','',
		level1.parent_ci_class||'->'||level1.child_ci_class,1
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.config_item_RELATIONSHIP level1,
       		app_master_db.platform_and_servers_details_view pf        
 	where 	a.asset_id=at.app_id and
		a.asset_id = level1.parent_asset_id and
   		level1.child_asset_id = pf.asset_id
		



Level 2 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.platforms
	select	distinct a.asset_id,pf.asset_id,pf.asset_name,level2.child_ci_class,level2.parent_asset_id,
		level1.child_asset_id,level1.child_ci_name,level1.child_ci_class,
		level2.child_asset_id,level2.child_ci_name,level2.child_ci_class,
		'','','',
		'','','',
		'','','',
		'','','',
		'','','',
		level1.parent_ci_class||'->'||level2.parent_ci_class||'->'||level2.child_ci_class,2
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.config_item_RELATIONSHIP level1,
       		app_master_db.config_item_RELATIONSHIP level2,
       		app_master_db.platform_and_servers_details_view pf    
 	where 	a.asset_id=at.app_id and
		a.asset_id = level1.parent_asset_id and
		level1.child_asset_id = level2.parent_asset_id and
   		level2.child_asset_id = pf.asset_id



Level 3 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.platforms
	select	distinct a.asset_id,pf.asset_id,pf.asset_name,level3.child_ci_class,level3.parent_asset_id,
		level1.child_asset_id,level1.child_ci_name,level1.child_ci_class,
		level2.child_asset_id,level2.child_ci_name,level2.child_ci_class,
		level3.child_asset_id,level3.child_ci_name,level3.child_ci_class,
		'','','',
		'','','',
		'','','',
		'','','',
		level1.parent_ci_class||'->'||level2.parent_ci_class||'->'||level3.parent_ci_class||'->'||level3.child_ci_class,3
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.config_item_RELATIONSHIP level1,
       		app_master_db.config_item_RELATIONSHIP level2,
       		app_master_db.config_item_RELATIONSHIP level3,
       		app_master_db.platform_and_servers_details_view pf        
 	where 	a.asset_id=at.app_id and
		a.asset_id = level1.parent_asset_id and
		level1.child_asset_id = level2.parent_asset_id and
		level2.child_asset_id = level3.parent_asset_id and
   		level3.child_asset_id = pf.asset_id
 
		
Level 4 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.platforms
	select	distinct a.asset_id,pf.asset_id,pf.asset_name,level4.child_ci_class,level4.parent_asset_id,
		level1.child_asset_id,level1.child_ci_name,level1.child_ci_class,
		level2.child_asset_id,level2.child_ci_name,level2.child_ci_class,
		level3.child_asset_id,level3.child_ci_name,level3.child_ci_class,
		level4.child_asset_id,level4.child_ci_name,level4.child_ci_class,
		'','','',
		'','','',
		'','','',
		level1.parent_ci_class||'->'||level2.parent_ci_class||'->'||level3.parent_ci_class||'->'||level4.parent_ci_class||'->'||level4.child_ci_class,4
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.config_item_RELATIONSHIP level1,
       		app_master_db.config_item_RELATIONSHIP level2,
       		app_master_db.config_item_RELATIONSHIP level3,
       		app_master_db.config_item_RELATIONSHIP level4,
       		app_master_db.platform_and_servers_details_view pf        
 	where 	a.asset_id=at.app_id and
		a.asset_id = level1.parent_asset_id and
		level1.child_asset_id = level2.parent_asset_id and
		level2.child_asset_id = level3.parent_asset_id and
		level3.child_asset_id = level4.parent_asset_id and
   		level4.child_asset_id = pf.asset_id




Level 5 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.platforms
	select	distinct a.asset_id,pf.asset_id,pf.asset_name,level5.child_ci_class,level5.parent_asset_id,
		level1.child_asset_id,level1.child_ci_name,level1.child_ci_class,
		level2.child_asset_id,level2.child_ci_name,level2.child_ci_class,
		level3.child_asset_id,level3.child_ci_name,level3.child_ci_class,
		level4.child_asset_id,level4.child_ci_name,level4.child_ci_class,
		level5.child_asset_id,level5.child_ci_name,level5.child_ci_class,
		'','','',
		'','','',
		level1.parent_ci_class||'->'||level2.parent_ci_class||'->'||level3.parent_ci_class||'->'||level4.parent_ci_class||'->'||level5.parent_ci_class||'->'||level5.child_ci_class,5
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.config_item_RELATIONSHIP level1,
       		app_master_db.config_item_RELATIONSHIP level2,
       		app_master_db.config_item_RELATIONSHIP level3,
       		app_master_db.config_item_RELATIONSHIP level4,
       		app_master_db.config_item_RELATIONSHIP level5,
       		app_master_db.platform_and_servers_details_view pf        
 	where 	a.asset_id=at.app_id and
		a.asset_id = level1.parent_asset_id and
		level1.child_asset_id = level2.parent_asset_id and
		level2.child_asset_id = level3.parent_asset_id and
		level3.child_asset_id = level4.parent_asset_id and
		level4.child_asset_id = level5.parent_asset_id and
   		level5.child_asset_id = pf.asset_id 




Level 6 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.platforms
	select	distinct a.asset_id,pf.asset_id,pf.asset_name,level6.child_ci_class,level6.parent_asset_id,
		level1.child_asset_id,level1.child_ci_name,level1.child_ci_class,
		level2.child_asset_id,level2.child_ci_name,level2.child_ci_class,
		level3.child_asset_id,level3.child_ci_name,level3.child_ci_class,
		level4.child_asset_id,level4.child_ci_name,level4.child_ci_class,
		level5.child_asset_id,level5.child_ci_name,level5.child_ci_class,
		level6.child_asset_id,level6.child_ci_name,level6.child_ci_class,
		'','','',
		level1.parent_ci_class||'->'||level2.parent_ci_class||'->'||level3.parent_ci_class||'->'||level4.parent_ci_class||'->'||level5.parent_ci_class||'->'||level6.parent_ci_class||'->'||level6.child_ci_class,6
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.config_item_RELATIONSHIP level1,
       		app_master_db.config_item_RELATIONSHIP level2,
       		app_master_db.config_item_RELATIONSHIP level3,
       		app_master_db.config_item_RELATIONSHIP level4,
       		app_master_db.config_item_RELATIONSHIP level5,
       		app_master_db.config_item_RELATIONSHIP level6,
       		app_master_db.platform_and_servers_details_view pf        
 	where 	a.asset_id=at.app_id and
		a.asset_id = level1.parent_asset_id and
		level1.child_asset_id = level2.parent_asset_id and
		level2.child_asset_id = level3.parent_asset_id and
		level3.child_asset_id = level4.parent_asset_id and
		level4.child_asset_id = level5.parent_asset_id and
		level5.child_asset_id = level6.parent_asset_id and
   		level6.child_asset_id = pf.asset_id 


Level 7 Insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.platforms
	select	distinct a.asset_id,pf.asset_id,pf.asset_name,level7.child_ci_class,level7.parent_asset_id,
		level1.child_asset_id,level1.child_ci_name,level1.child_ci_class,
		level2.child_asset_id,level2.child_ci_name,level2.child_ci_class,
		level3.child_asset_id,level3.child_ci_name,level3.child_ci_class,
		level4.child_asset_id,level4.child_ci_name,level4.child_ci_class,
		level5.child_asset_id,level5.child_ci_name,level5.child_ci_class,
		level6.child_asset_id,level6.child_ci_name,level6.child_ci_class,
		level7.child_asset_id,level7.child_ci_name,level7.child_ci_class,
		level1.parent_ci_class||'->'||level2.parent_ci_class||'->'||level3.parent_ci_class||'->'||level4.parent_ci_class||'->'||level5.parent_ci_class||'->'||level6.parent_ci_class||'->'||level7.parent_ci_class||'->'||level7.child_ci_class,7
  	from 	app_master_db.cmdb_view a,app_master_db.apptracker_summary_view at,
       		app_master_db.config_item_RELATIONSHIP level1,
       		app_master_db.config_item_RELATIONSHIP level2,
       		app_master_db.config_item_RELATIONSHIP level3,
       		app_master_db.config_item_RELATIONSHIP level4,
       		app_master_db.config_item_RELATIONSHIP level5,
       		app_master_db.config_item_RELATIONSHIP level6,
       		app_master_db.config_item_RELATIONSHIP level7,
       		app_master_db.platform_and_servers_details_view pf        
 	where 	a.asset_id=at.app_id and
		a.asset_id = level1.parent_asset_id and
		level1.child_asset_id = level2.parent_asset_id and
		level2.child_asset_id = level3.parent_asset_id and
		level3.child_asset_id = level4.parent_asset_id and
		level4.child_asset_id = level5.parent_asset_id and
		level5.child_asset_id = level6.parent_asset_id and
		level6.child_asset_id = level7.parent_asset_id and
   		level7.child_asset_id = pf.asset_id 