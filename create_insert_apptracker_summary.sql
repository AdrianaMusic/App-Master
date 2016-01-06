drop table app_master_db.apptracker_summary




CREATE TABLE app_master_db.apptracker_summary
(
  at_identifier character varying(8000),
  app_name character varying(8000),
  app_id character varying(8000),
  description character varying(8000),
  app_owner character varying(8000),
  ops_owner character varying(8000),
  enterprise_architect character varying(8000),
  url character varying(8000),
  business character varying(8000),
  business_segment character varying(8000),
  number_of_users character varying(8000),
  region character varying(8000),
  data_center character varying(8000),
  web_server character varying(8000),
  web_server_os_type character varying(8000),
  web_server_os_version character varying(8000),
  app_server character varying(8000),
  app_server_os_type character varying(8000),
  app_server_os_version character varying(8000),
  database_server character varying(8000),
  database_os_type character varying(8000),
  database_os_version character varying(8000),
  database_type character varying(8000),
  database_version character varying(8000),
  external_facing character varying(8000),
  business_process character varying(8000),
  primary_architecture character varying(8000),
  decommissioning_year character varying(8000),
  target_decommissioning_quarter character varying(8000),
  decommissioning_status character varying(8000),
  actual_decommissioning_quarter character varying(8000),
  it_executive_owner character varying(8000),
  number_of_interfaces character varying(8000),
  unique_app_id character varying(8000),
  current_operational_status character varying(8000),
  is_critical_system character varying(8000),
  sub_business character varying(8000),
  sox_app_flag character varying(8000),
  app_criticality character varying(8000),
  availability_impact character varying(8000),
  system_integrity character varying(8000),
  asset_type character varying(8000),
  application_type character varying(8000),
  data_classification_level character varying(8000),
  app_availability_tier character varying(8000),
  sensitive_data_flag character varying(8000),
  us_export_license_flag character varying(8000),
  uk_export_license_flag character varying(8000),
  other_export_license_flag character varying(8000),
  current_year_net_new character varying(8000),
  cloud_migration_year character varying(8000),
  target_cloud_migration_qtr character varying(8000),
  cloud_migration_status character varying(8000),
  actual_cloud_migration_qtr character varying(8000),
  target_cloud_env character varying(8000),
  actual_cloud_env character varying(8000),
  software_vendor character varying(8000),
  software_version character varying(8000),
  application_availability_flag character varying(8000),
  business_critical_flag character varying(8000),
  authentication_source character varying(8000),
  business_operation character varying(8000),
  current_year_net_removed character varying(8000),
  cloud_risk_profile_flag character varying(8000),
  virtual character varying(8000),
  number_of_Servers character varying(8000),
  enabling_application character varying(8000),
  match_step character varying(8000) DEFAULT ''::character varying
)
WITH (APPENDONLY=true, 
  OIDS=FALSE
)
DISTRIBUTED BY (at_identifier);

ALTER TABLE app_master_db.apptracker_summary OWNER TO corp_it_updater;

GRANT ALL ON TABLE app_master_db.apptracker_summary TO corp_it_updater;

GRANT SELECT ON TABLE app_master_db.apptracker_summary TO corp_it_looker;



Unmatched records insert
------------------------------------------------------------------------------------------------------
insert 	into app_master_db.apptracker_summary
select 	entry, 
	case when application_name_mandatory='N/A' then '' else application_name_mandatory end,
	case when application_descriptors_mandatory='N/A' then '' else application_descriptors_mandatory end,
	'', --description not present in at
	case when application_owner='N/A' then '' else application_owner end,
	case when operations_owner='N/A' then '' else operations_owner end,
	enterprise_architect_contact,
	case when url='N/A' then '' else url end,
	business_mandatory,
	case when Sub_Business='N/A' then '' else Sub_Business end,
	Number_of_users,
	case when user_region='N/A' then '' else user_region end,
	case when data_center='N/A' then '' else data_center end, --data_center from at
	'', --web_server from cmdb, will be null 
	'', --web_server_os_type from cmdb, will be null
	'', --web_server_os_version from cmdb, will be null
	'', --application_server from cmdb, will be null
	'', --app_server_os_type from cmdb, will be null
	'', --app_server_os_version from cmdb, will be null
	'', --database_server from cmdb, will be null
	'', --database_os_type from cmdb, will be null
	'', --database_os_version from cmdb, will be null
	database_type, --database_type from at
	database_version, --database_version from at
	case when internet_facing='N/A' then '' else internet_facing end,
	case when business_process='N/A' then '' else business_process end,
	application_structure,
	case when decommissioning_year='N/A' then '' else decommissioning_year end,
	case when target_decommissioning_quarter='N/A' then '' else target_decommissioning_quarter end,
	case when decommissioning_status='N/A' then '' else decommissioning_status end,
	case when actual_decommissioning_quarter='N/A' then '' else actual_decommissioning_quarter end,
	it_executive_owner,
	of_interfaces,
	unique_app_id,
	current_operational_status,
	'', --critical_system from IRIS, will be null
	'', --sub business from cmdb or iris, will be null
	'', --sox_app_flag iris defined, will be null
	application_criticality,
	'', --availability_impact from cmdb or iris, will be null
	'', --system_integrity  iris derived, will be null
	'', --asset_type cmdb, will be null
	application_type,
	data_risk_classification,
	application_availability_tier,
	'', --sensitive_data_flag iris derived, will be null
	'', --us_export_license_flag cmdb derived, will be null
	'', --uk_export_license_flag cmdb derived, will be null
	'', --other_export_license_flag cmdb derived, will be null
	current_year_net_new,
	migrate_to_cloud_year,
	target_cloud_migration_qtr,
	cloud_migration_status,
	actual_cloud_migration_qtr,
	target_cloud_environment,
	'', --actual_cloud_env not needed
	'', --software_vendor from cmdb, will be null
	'', --software_version from cmdb, will be null
	'', --application_availability_flag iris derived, will be null
	'', --business_critical_flag  from iris, will be null
	'', --authentication_source cmdb through ngo, will be null
	'', --business_operation from cmdb, will be null
	current_year_net_removed,
	case when data_risk_classification in ('GE Confidential w/ Sensitive PII','GE Confidential')
		then 'Medium'::character varying
	     when
		data_risk_classification in ('GE Restricted') 
		then 'High'::character varying
	     else ''::character varying end, --cloud risk profile flag derived. Null here.
	case when virtual='N/A' then '' else virtual end,
	'', --number_of_Servers derived. null here
	case when NULLIF(application_type,'') is null then '' when application_type in ('Content Mgmt.',
		'Database','Enabling Tools','IT Tools','ITIL','Messaging','MiddleWare','Middle Ware', 
		'Platform Reporting Tools','Platform Reporting Tool','Project Management',
		'Unified Communications','Video') then 'Yes' else 'No' end, --enabling_application 
	'Unmatched'
from 	app_master_db.apptracker
where 	application_descriptors_mandatory not in
	(
	select application_descriptors_mandatory from tmp_first_pass
	union
	select application_descriptors_mandatory from tmp_second_pass
	union
	select application_descriptors_mandatory from tmp_third_pass
	)
group by
	entry, application_name_mandatory,application_descriptors_mandatory,
	operations_owner,enterprise_architect_contact,url,business_mandatory,
	Sub_Business,Number_of_users,user_region,internet_facing,
	business_process,decommissioning_year,target_decommissioning_quarter,
	decommissioning_status,actual_decommissioning_quarter,it_executive_owner,of_interfaces,
	current_operational_status,application_criticality,application_owner,
	data_risk_classification,application_availability_tier,apptracker.application_type,
	current_year_net_new,migrate_to_cloud_year,target_cloud_migration_qtr,
	cloud_migration_status,actual_cloud_migration_qtr,target_cloud_environment,
	current_year_net_removed,apptracker.application_structure,apptracker.unique_app_id,
	apptracker.data_center,apptracker.database_type,apptracker.database_version,apptracker.virtual


Matched records insert
----------------------------------------------------------------------------------------------------
insert	into app_master_db.apptracker_summary
select 	at.entry,
	case when cmdb.asset_name='N/A' then '' else cmdb.asset_name end,
	cmdb.asset_id,
	case when cmdb.short_description='N/A' then '' else cmdb.short_description end,
	array_to_string(array_agg(distinct cc_asset.contact_person),';') apps_owner,
	array_to_string(array_agg(distinct COALESCE(NULLIF(cc_ops.contact_dl,''),cc_ops.contact_person)),';') ops_owner,
	at.enterprise_architect_contact,
	case when COALESCE(url.u_urls,at.url)='N/A' then '' else COALESCE(url.u_urls,at.url) end,
	--app_master_db.getBusiness(cmdb.owning_business,cmdb.Owning_sub_business) business,
	case when at.business_mandatory='N/A' then '' else 
	at.business_mandatory end business,
	case when at.Sub_Business='N/A' then '' 
	else at.Sub_Business end business_segment,
	cmdb.total_user_count num_users,
	case when cmdb.region_used='N/A' then '' else cmdb.region_used end region,
	case when at.data_center='N/A' then '' else at.data_center end,
	'', --web_server cmdb ngo dependency
	'', --web_server_os_type  cmdb ngo dependency
	'', --web_server_os_version cmdb ngo dependency
	'', --application_server cmdb ngo dependency
	'', --app_server_os_type cmdb ngo dependency
	'', --app_server_os_version cmdb ngo dependency
	'', --database_server cmdb ngo dependency
	'', --database_os_type cmdb ngo dependency
	'', --database_os_version cmdb ngo dependency
	database_type, --database_type 
	database_version, --database_version
	case when cmdb.external_facing='N/A' then '' else cmdb.external_facing end external_facing,
	cmdb.application_business_process, --cmdb business_process ngo dependency,
	cmdb.primary_architecture,
	case when at.decommissioning_year='N/A' then '' else at.decommissioning_year end,
	case when at.target_decommissioning_quarter='N/A' then '' else at.target_decommissioning_quarter end,
	case when at.decommissioning_status='N/A' then '' else at.decommissioning_status end,
	case when at.actual_decommissioning_quarter='N/A' then '' else at.actual_decommissioning_quarter end,
	array_to_string(array_agg(distinct cc_exec.contact_person),';'),
	at.of_interfaces,
	at.unique_app_id,
	cmdb.status,
	y.critical_system, --from iris
	cmdb.business_p_l,
	case when sox_criticality = 'Yes' then 'Yes'::character varying 
		else 'No'::character varying end, --Sox app flag,iris defined
	cmdb.criticality criticality,
	cmdb.availability_impact,
	case 	when 	sox_criticality = 'Yes' or 
			financial='Yes' or 
			cmdb.product_quality='Yes' or 
			pci='Yes' or 
			compliance_security='Yes' or
			COALESCE(software_configuration)='1' or
			COALESCE(customer_contractual)='1'
		then 'Yes'::character varying 
		else 'No'::character varying end, --system_integrity flag iris derived
	cmdb.asset_type,
	cmdb.application_type, --application_type cmdb ngo dependency
	cmdb.data_classification_level,
	cmdb.high_availability_tier,
	case when pii_employeecontractor='Yes' or cmdb.pii_consumer='Yes' or pii_medical='Yes' 
		or pii_personal_bank_accounts='Yes' or pii_cards='Yes' or pii_ssn_or_government_ids='Yes'
		or cmdb.pii_special_data='Yes' or cmdb.ip_business_critical='Yes' or 
		ip_highmedium_risk='Yes' or cmdb.govt_classified='Yes' or 
		cmdb.govt_controlled_unclassified='Yes' or third_party_data='Yes'
		or COALESCE(NULLIF(export_control,'')) not in ('NO EC RESTRICTIONS')   
		or COALESCE(y.commercial_software)='1' 
		then 'Yes'::character varying 
	else 'No'::character varying end,--sensitive_data_flag iris derived
	app_master_db.get_export_lic_flag(cmdb.us_application_export_license_required,cmdb.us_data_export_license_required), --us_export_license_flag cmdb derived
	app_master_db.get_export_lic_flag(cmdb.uk_application_export_license_required,cmdb.uk_data_export_license_required), --uk_export_license_flag cmdb derived
	app_master_db.get_export_lic_flag(cmdb.other_application_export_license_required,cmdb.other_data_export_license_required), --other_export_license_flag cmdb derived
	current_year_net_new,
	migrate_to_cloud_year,
	target_cloud_migration_qtr,
	cloud_migration_status,
	actual_cloud_migration_qtr,
	target_cloud_environment,
	'', --actual_cloud_env not needed
	cmdb.manufacturer_vendor,
	cmdb.technology_stack,
	case when cmdb.availability_impact in ('High','Severe') then 'Yes'::character varying else 
		'No'::character varying end, --application_availability_flag iris derived
	case 	when 	COALESCE(y.critical_defined)='1' then 'Yes'::character varying
		when	COALESCE(y.critical_defined)='0' then 'No'::character varying
		when	bank_regulated_tier in ('Tier0', 'Tier1', 'Tier2', 'Tier3') or 
			COALESCE(y.defined_critical_trading)='1' or 
			cmdb.dfars_ucti='Yes' or 
			cmdb.fisma='Yes' or
			COALESCE(y.it_ops_critical)='1' or 
			COALESCE(y.trans_sensitive_data_fcial)='1' or 
			COALESCE(y.trans_sensitive_data_reg)='1' or 
			COALESCE(y.trans_system_integrity_other)='1' or 
			COALESCE(y.capital_defined)='1'
		then 'Yes'::character varying 
		else 'No'::character varying end, --business_critical_flag  from iris
	cmdb.authentication, --authentication_source cmdb through ngo
	cmdb.business_operation, --business_operation from cmdb
	current_year_net_removed,
	case when
		cmdb.data_classification_level in ('GE Restricted') or 
		pii_medical = 'Yes' or 
		pii_personal_bank_accounts = 'Yes' or 
		pii_cards = 'Yes' or 
		pii_ssn_or_government_ids = 'Yes' or
		cmdb.pii_special_data = 'Yes' or  
		cmdb.ip_business_critical = 'Yes' or 
		cmdb.govt_classified = 'Yes' or 
		cmdb.govt_controlled_unclassified = 'Yes' or 
		pci = 'Yes' or
		third_party_data = 'Yes' or
		COALESCE(NULLIF(export_control,'')) not in ('NO EC RESTRICTIONS')
	then 'High'::character varying
	when
		cmdb.data_classification_level in ('GE Confidential w/ Sensitive PII','GE Confidential') or
		pii_employeecontractor = 'Yes' or  
		cmdb.pii_consumer = 'Yes' or
		ip_highmedium_risk = 'Yes' or
 		sox_criticality = 'Yes' or 
		financial = 'Yes' or  
		cmdb.product_quality = 'Yes' or
 		compliance_security = 'Yes'
	then 'Medium'::character varying
	when
		(NULLIF(cmdb.data_classification_level,'') is null or 
		cmdb.data_classification_level in ('Public','GE Public','GE Internal')) and 
		(
		COALESCE(pii_employeecontractor,'') <> 'Yes' and 
		COALESCE(cmdb.pii_consumer,'') <> 'Yes' and
		COALESCE(ip_highmedium_risk,'') <> 'Yes' and
 		COALESCE(sox_criticality,'') <> 'Yes' and 
		COALESCE(financial,'') <> 'Yes' and 
		COALESCE(cmdb.product_quality,'') <> 'Yes' and
 		COALESCE(compliance_security,'') <> 'Yes' and
		COALESCE(pii_medical,'') <> 'Yes' and 
		COALESCE(pii_personal_bank_accounts,'') <> 'Yes' and 
		COALESCE(pii_cards,'') <> 'Yes' and 
		COALESCE(pii_ssn_or_government_ids,'') <> 'Yes' and
		COALESCE(cmdb.pii_special_data,'') <> 'Yes' and  
		COALESCE(cmdb.ip_business_critical,'') <> 'Yes' and 
		COALESCE(cmdb.govt_classified,'') <> 'Yes' and 
		COALESCE(cmdb.govt_controlled_unclassified,'') <> 'Yes' and 
		COALESCE(pci,'') <> 'Yes' and
		COALESCE(third_party_data,'') <> 'Yes'
		) and 
		(NULLIF(export_control,'') is null or export_control in ('NO EC RESTRICTIONS'))
	then 'Low'::character varying 
	else 
		''::character varying end,--cloud risk profile flag cmdb derived
	case when at.virtual='N/A' then '' else at.virtual end,
	server_count, --number_of_Servers derived
	case when NULLIF(cmdb.application_type,'') is null and NULLIF(asset_type,'') is null then ''  when 
		asset_type in ('Enabling Tools') or cmdb.application_type in ('Content Mgmt.',
		'Database','Enabling Tools','IT Tools','ITIL','Messaging','MiddleWare','Middle Ware', 
		'Platform Reporting Tools','Platform Reporting Tool','Project Management',
		'Unified Communications','Video') then 'Yes' else 'No' end, --enabling_application  
	'AT CMDB Match'
from 	app_master_db.apptracker at,app_master_db.cmdb_view cmdb,
	(
		select a.application_descriptors_mandatory,a.asset_id from tmp_first_pass a
		union 
		select b.application_descriptors_mandatory,b.asset_id from tmp_second_pass b 
		union 
		select c.application_descriptors_mandatory,c.asset_id from tmp_third_pass c
	) x
	left outer join app_master_db.iris_view y on (x.asset_id=y.appsysrecordid)
	left outer join app_master_db.cmdb_contacts_view cc_asset on 
	(x.asset_id=cc_asset.asset_id and cc_asset.contact_type='Asset Owner') 
	left outer join app_master_db.cmdb_contacts_view cc_ops on 
	(x.asset_id=cc_ops.asset_id and cc_ops.contact_type='Operational Contact')
	left outer join app_master_db.cmdb_contacts_view cc_exec on 
	(x.asset_id=cc_exec.asset_id and cc_exec.contact_type='IT Executive Owner')
	left outer join app_master_db.servers_summary servers on 
	(x.asset_id=servers.asset_id)
	left outer join edw.cmdb_ci_ext url on (x.asset_id=url.u_asset_id)
where  
	x.application_descriptors_mandatory=at.application_descriptors_mandatory and
	x.asset_id=cmdb.asset_id
group by
	at.entry,cmdb.asset_name,
	cmdb.asset_id,
	cmdb.short_description,at.operations_owner,at.enterprise_architect_contact,
	at.url,at.application_structure,
	--cmdb.owning_business,
	--cmdb.Owning_sub_business,
	cmdb.total_user_count,
	cmdb.region_used,cmdb.external_facing,
	cmdb.business_operation,
	at.decommissioning_year,at.target_decommissioning_quarter,at.decommissioning_status,
	at.actual_decommissioning_quarter,
	at.of_interfaces,at.unique_code_required_by_some_businesses,
	cmdb.status,
	cmdb.business_p_l,
	cmdb.criticality,
	cmdb.availability_impact,cmdb.asset_type,at.application_owner,y.App_Owner,
	at.data_risk_classification,at.application_availability_tier,
	cmdb.data_classification_level,
	cmdb.high_availability_tier,cmdb.manufacturer_vendor,y.software_vendor,
	cmdb.technology_stack,
	y.software_version,cmdb.sox_criticality,cmdb.financial,cmdb.product_quality,
	cmdb.pci,cmdb.compliance_security,cmdb.us_application_export_license_required,
	cmdb.us_data_export_license_required,cmdb.uk_application_export_license_required,
	cmdb.uk_data_export_license_required,cmdb.other_application_export_license_required,
	cmdb.other_data_export_license_required,cmdb.pii_employeecontractor,cmdb.pii_consumer,
	cmdb.pii_medical,cmdb.pii_personal_bank_accounts,cmdb.pii_cards,
	cmdb.pii_ssn_or_government_ids,
	cmdb.pii_special_data,cmdb.ip_business_critical,cmdb.ip_highmedium_risk,
	cmdb.govt_classified,
	cmdb.govt_controlled_unclassified,cmdb.third_party_data,cmdb.export_control,
	bank_regulated_tier,
	cmdb.dfars_ucti,cmdb.fisma,current_year_net_new,migrate_to_cloud_year,
	target_cloud_migration_qtr,
	cloud_migration_status,actual_cloud_migration_qtr,target_cloud_environment,
	current_year_net_removed,at.unique_app_id,y.software_configuration,
	y.customer_contractual,y.commercial_software,y.defined_critical_trading,
	y.it_ops_critical,y.trans_sensitive_data_fcial,y.trans_sensitive_data_reg,
	y.trans_system_integrity_other,y.capital_defined,y.critical_system,
	cmdb.application_business_process,cmdb.primary_architecture,
	cmdb.application_type,cmdb.authentication,at.data_center,at.database_type,
	at.database_version,at.virtual,servers.server_count,y.critical_defined,url.u_urls,
	at.business_mandatory,at.sub_business