drop table app_master_db.iris_summary



CREATE TABLE app_master_db.iris_summary
(
  app_name character varying(8000),
  app_id character varying(8000),
  description character varying(8000),
  app_owner character varying(8000),
  url character varying(8000),
  business character varying(8000),
  business_segment character varying(8000),
  external_facing character varying(8000),
  current_operational_status character varying(8000),
  is_critical_system character varying(8000),
  ITRiskAppID character varying(8000),
  sub_business character varying(8000),
  hosting_status character varying(8000),
  tester character varying(8000),
  objective character varying(8000),
  sox_app_flag character varying(8000),
  app_criticality character varying(8000),
  availability_impact character varying(8000),
  system_integrity character varying(8000),
  appmapping_status character varying(8000),
  pii_employee_contractor character varying(8000),
  pii_consumer character varying(8000),
  pii_medical_records character varying(8000),
  pii_personal_bank_account character varying(8000),
  pii_credit_cards character varying(8000),
  pii_ssn_govtid character varying(8000),
  pii_special_data character varying(8000),
  ip_business_critical character varying(8000),
  ip_high_med_risk character varying(8000),
  govt_classified character varying(8000),
  govt_controlled_unclassified character varying(8000),
  other_party_organization character varying(8000),
  other_export_controlled character varying(8000),
  fcial_reporting_sox character varying(8000),
  fcial_reporting_nonsox character varying(8000),
  credit_card character varying(8000),
  product_quality character varying(8000),
  security character varying(8000),
  critical_trading character varying(8000),
  fisma character varying(8000),
  dfars_ucti character varying(8000),
  it_ops_critical character varying(8000),
  critical_date character varying(8000),
  sensitive_data_flag character varying(8000),
  software_vendor character varying(8000),
  software_version character varying(8000),
  hosting_vendor character varying(8000),
  cfi_tier_hosting character varying(8000),
  commercial_customer character varying(8000),
  trans_sensitive_data_fcial character varying(8000),
  trans_sensitive_data_reg character varying(8000),
  trans_system_integrity_other character varying(8000),
  software_configuration character varying(8000),
  customer_contractual character varying(8000),
  commercial_software character varying(8000),
  capital_defined character varying(8000),
  availability character varying(8000),
  critical_defined character varying(8000),
  external character varying(8000),
  match_step character varying(8000) DEFAULT ''::character varying
)
WITH (APPENDONLY=true, 
  OIDS=FALSE
)
DISTRIBUTED BY (app_id);

ALTER TABLE app_master_db.iris_summary OWNER TO corp_it_updater;

GRANT ALL ON TABLE app_master_db.iris_summary TO corp_it_updater;

GRANT SELECT ON TABLE app_master_db.iris_summary TO corp_it_looker;


Unmatched records insert
------------------------------------------------------------------------------------------------------
insert into app_master_db.iris_summary
select 	app_name,
	case when appsysrecordid is null then '' else appsysrecordid end,
	case when description='N/A' then '' else description end,
	case when app_owner is null then '' else app_owner end,
	dns_name,
	parent_business,
	case when business_segment is null then '' else business_segment end,
	case when internet_facing=1 then 'Yes'::character varying 
		when internet_facing=0 then 'No'::character varying else ''::character varying end,
	application_status,
	case when critical_system='1' then 'Yes'::character varying 
		when critical_system='0' then 'No'::character varying else ''::character varying end,
	itriskappid,
	sub_business,
	hosting_status,
	tester,
	case when objective='1' then 'Yes'::character varying 
		when objective='0' then 'No'::character varying else ''::character varying end,
	case when sox='1' then 'Yes'::character varying 
		when sox='0' then 'No'::character varying else ''::character varying end, --Sox app flag
	historical_criticality,
	availability_impact,
	case when system_integrity='1' then 'Yes'::character varying 
		when system_integrity='0' then 'No'::character varying else ''::character varying end,	
	case when appmapping_status='1' then 'Yes'::character varying 
		when appmapping_status='0' then 'No'::character varying else ''::character varying end,
	case when pii_employee_contractor='1' then 'Yes'::character varying 
		when pii_employee_contractor='0' then 'No'::character varying else ''::character varying end,
	case when pii_consumer='1' then 'Yes'::character varying 
		when pii_consumer='0' then 'No'::character varying else ''::character varying end,
	case when pii_medical_records='1' then 'Yes'::character varying 
		when pii_medical_records='0' then 'No'::character varying else ''::character varying end,
	case when pii_personal_bank_account='1' then 'Yes'::character varying 
		when pii_personal_bank_account='0' then 'No'::character varying else ''::character varying end,
	case when pii_credit_cards='1' then 'Yes'::character varying 
		when pii_credit_cards='0' then 'No'::character varying else ''::character varying end,
	case when pii_ssn_govtid='1' then 'Yes'::character varying 
		when pii_ssn_govtid='0' then 'No'::character varying else ''::character varying end,
	case when pii_special_data='1' then 'Yes'::character varying 
		when pii_special_data='0' then 'No'::character varying else ''::character varying end,
	case when ip_business_critical='1' then 'Yes'::character varying 
		when ip_business_critical='0' then 'No'::character varying else ''::character varying end,
	case when ip_high_med_risk='1' then 'Yes'::character varying 
		when ip_high_med_risk='0' then 'No'::character varying else ''::character varying end,
	case when govt_classified='1' then 'Yes'::character varying 
		when govt_classified='0' then 'No'::character varying else ''::character varying end,
	case when govt_controlled_unclassified='1' then 'Yes'::character varying 
		when govt_controlled_unclassified='0' then 'No'::character varying else ''::character varying end,
	case when other_party_organization='1' then 'Yes'::character varying 
		when other_party_organization='0' then 'No'::character varying else ''::character varying end,
	case when other_export_controlled='1' then 'Yes'::character varying 
		when other_export_controlled='0' then 'No'::character varying else ''::character varying end,
	case when fcial_reporting_sox='1' then 'Yes'::character varying 
		when fcial_reporting_sox='0' then 'No'::character varying else ''::character varying end,
	case when fcial_reporting_Nonsox='1' then 'Yes'::character varying 
		when fcial_reporting_Nonsox='0' then 'No'::character varying else ''::character varying end,
	case when credit_card='1' then 'Yes'::character varying 
		when credit_card='0' then 'No'::character varying else ''::character varying end,
	case when product_quality='1' then 'Yes'::character varying 
		when product_quality='0' then 'No'::character varying else ''::character varying end,
	case when security='1' then 'Yes'::character varying 
		when security='0' then 'No'::character varying else ''::character varying end,
	case when defined_critical_trading='1' then 'Yes'::character varying 
		when defined_critical_trading='0' then 'No'::character varying else ''::character varying end,
	fisma,
	dfars_ucti,
	case when it_ops_critical='1' then 'Yes'::character varying 
		when it_ops_critical='0' then 'No'::character varying else ''::character varying end,
	critical_date,
	case when sensitive_data='1' then 'Yes'::character varying 
		when sensitive_data='0' then 'No'::character varying else ''::character varying end,	
	software_vendor,
	case when software_version='N/A' or software_version='n/a' then '' else software_version end,
	hosting_vendor,
	case when cfi_tier_hosting='N/a' or cfi_tier_hosting='NA' then '' else cfi_tier_hosting end,
	case when commercial_customer='1' then 'Yes'::character varying 
		when commercial_customer='0' then 'No'::character varying else ''::character varying end,
	case when trans_sensitive_data_fcial='1' then 'Yes'::character varying 
		when trans_sensitive_data_fcial='0' then 'No'::character varying else ''::character varying end,
	case when trans_sensitive_data_reg='1' then 'Yes'::character varying 
		when trans_sensitive_data_reg='0' then 'No'::character varying else ''::character varying end,
	case when trans_system_integrity_other='1' then 'Yes'::character varying 
		when trans_system_integrity_other='0' then 'No'::character varying else ''::character varying end,
	case when software_configuration='1' then 'Yes'::character varying 
		when software_configuration='0' then 'No'::character varying else ''::character varying end,
	case when customer_contractual='1' then 'Yes'::character varying 
		when customer_contractual='0' then 'No'::character varying else ''::character varying end,
	case when commercial_software='1' then 'Yes'::character varying 
		when commercial_software='0' then 'No'::character varying else ''::character varying end,
	case when capital_defined='1' then 'Yes'::character varying 
		when capital_defined='0' then 'No'::character varying else ''::character varying end,
	case when availability='1' then 'Yes'::character varying 
		when availability='0' then 'No'::character varying else ''::character varying end,
	case when critical_defined='1' then 'Yes'::character varying 
		when critical_defined='0' then 'No'::character varying else ''::character varying end, --business_critical_flag  from iris
	case when external='1' then 'Yes'::character varying 
		when external='0' then 'No'::character varying else ''::character varying end,
	'Unmatched'
from 	app_master_db.iris_view y
where 	COALESCE(appsysrecordid,'xxx') not in
		(select asset_id from app_master_db.cmdb_view)
group by 
	app_name,appsysrecordid,description,app_owner,dns_name,
	parent_business,business_segment,internet_facing,application_status,critical_system,
	itriskappid,sub_business,hosting_status,tester,objective,sox,historical_criticality,availability,
	appmapping_status,pii_employee_contractor,pii_consumer,pii_medical_records,
	pii_personal_bank_account,pii_credit_cards,pii_ssn_govtid,pii_special_data,ip_business_critical,
	ip_high_med_risk,govt_classified,govt_controlled_unclassified,
	other_party_organization,other_export_controlled,fcial_reporting_sox,fcial_reporting_nonsox,
	credit_card,product_quality,security,defined_critical_trading,fisma,dfars_ucti,it_ops_critical,
	critical_date,sensitive_data,software_vendor,software_version,hosting_vendor,
	cfi_tier_hosting,commercial_customer,trans_sensitive_data_fcial,trans_sensitive_data_reg,
	trans_system_integrity_other,software_configuration,customer_contractual,commercial_software,
	capital_defined,availability,critical_defined,external,system_integrity,availability_impact


Matching records with CMDB
----------------------------------------------------------------------------------------------
insert 	into app_master_db.iris_summary
select 	cmdb.asset_name,
	case when cmdb.asset_id is null then '' else cmdb.asset_id end,
	case when cmdb.short_description='N/A' then '' else cmdb.short_description end,
	array_to_string(array_agg(distinct cc_asset.contact_person),';'),
	y.dns_name,
	parent_business business,
	case when y.business_segment is null then '' else y.business_segment end,--business_segment
	cmdb.external_facing external_facing,
	cmdb.status,
	case when cmdb.availability_impact in ('High','Severe') or pii_employeecontractor='Yes'
		or cmdb.pii_consumer='Yes' or pii_medical='Yes' 
		or pii_personal_bank_accounts='Yes' or pii_cards='Yes' or pii_ssn_or_government_ids='Yes'
		or cmdb.pii_special_data='Yes' or cmdb.ip_business_critical='Yes' or ip_highmedium_risk='Yes'
		or cmdb.govt_classified='Yes' or cmdb.govt_controlled_unclassified='Yes' or third_party_data='Yes'
		or COALESCE(NULLIF(export_control,'')) not in ('NO EC RESTRICTIONS')  
		or sox_criticality = 'Yes' or financial='Yes' or cmdb.product_quality='Yes' 
		or pci='Yes' or compliance_security='Yes' then 'Yes'::character varying 
		else 'No'::character varying end, --critical system flag, iris derived
	itriskappid,
	cmdb.business_p_l,
	cmdb.server_ownership,
	tester,
	case when objective='1' then 'Yes'::character varying 
		when objective='0' then 'No'::character varying else ''::character varying end,
	case when sox_criticality = 'Yes' then 'Yes'::character varying else 'No'::character varying end, --Sox app flag, iris defined
	cmdb.criticality,
	cmdb.availability_impact,
	case 	when 	sox_criticality = 'Yes' or 
			financial='Yes' or 
			cmdb.product_quality='Yes' or 
			pci='Yes' or 
			compliance_security='Yes' or
			software_configuration='1' or
			customer_contractual='1'
		then 'Yes'::character varying 
		else 'No'::character varying end, --system_integrity flag iris derived
	appmapping_status,
	cmdb.pii_employeecontractor,
	cmdb.Pii_consumer,
	cmdb.Pii_medical,
	cmdb.Pii_personal_bank_accounts,
	cmdb.Pii_cards,
	cmdb.pii_ssn_or_government_ids,
	cmdb.Pii_special_data,
	cmdb.ip_business_critical,
	cmdb.ip_highmedium_risk,
	cmdb.govt_classified,
	cmdb.govt_controlled_unclassified,
	cmdb.third_party_data,
	cmdb.export_control,
	cmdb.sox_criticality,
	cmdb.financial,
	cmdb.pci,
	cmdb.product_quality,
	cmdb.compliance_security,
	case when defined_critical_trading='1' then 'Yes'::character varying 
		when defined_critical_trading='0' then 'No'::character varying else ''::character varying end,
	cmdb.fisma,
	cmdb.dfars_ucti,
	case when it_ops_critical='1' then 'Yes'::character varying 
		when it_ops_critical='0' then 'No'::character varying else ''::character varying end,
	y.critical_date,
	case when pii_employeecontractor='Yes' or cmdb.pii_consumer='Yes' or pii_medical='Yes' 
		or pii_personal_bank_accounts='Yes' or pii_cards='Yes' or pii_ssn_or_government_ids='Yes'
		or cmdb.pii_special_data='Yes' or cmdb.ip_business_critical='Yes' or ip_highmedium_risk='Yes'
		or cmdb.govt_classified='Yes' or cmdb.govt_controlled_unclassified='Yes' or third_party_data='Yes'
		or COALESCE(NULLIF(export_control,'')) not in ('NO EC RESTRICTIONS')   
		or y.commercial_software='1'
		then 'Yes'::character varying else 'No'::character varying end,--sensitive_data_flag iris derived
	cmdb.manufacturer_vendor,
	case when cmdb.technology_stack='N/A' then '' else cmdb.technology_stack end,
	y.hosting_vendor,
	case when cmdb.bank_regulated_tier='N/A' then '' else cmdb.bank_regulated_tier end,
	case when commercial_customer='1' then 'Yes'::character varying 
		when commercial_customer='0' then 'No'::character varying else ''::character varying end,
	case when trans_sensitive_data_fcial='1' then 'Yes'::character varying 
		when trans_sensitive_data_fcial='0' then 'No'::character varying else ''::character varying end,
	case when trans_sensitive_data_reg='1' then 'Yes'::character varying 
		when trans_sensitive_data_reg='0' then 'No'::character varying else ''::character varying end,
	case when trans_system_integrity_other='1' then 'Yes'::character varying 
		when trans_system_integrity_other='0' then 'No'::character varying else ''::character varying end,
	case when software_configuration='1' then 'Yes'::character varying 
		when software_configuration='0' then 'No'::character varying else ''::character varying end,
	case when customer_contractual='1' then 'Yes'::character varying 
		when customer_contractual='0' then 'No'::character varying else ''::character varying end,
	case when commercial_software='1' then 'Yes'::character varying 
		when commercial_software='0' then 'No'::character varying else ''::character varying end,
	case when capital_defined='1' then 'Yes'::character varying 
		when capital_defined='0' then 'No'::character varying else ''::character varying end,
	case when cmdb.availability_impact in ('High','Severe') then 'Yes'::character varying else 
		'No'::character varying end, --application_availability_flag iris derived
	case when critical_defined='1' then 'Yes'::character varying 
		when critical_defined='0' then 'No'::character varying else ''::character varying end,
	case when external='1' then 'Yes'::character varying 
		when external='0' then 'No'::character varying else ''::character varying end,
	'IRIS CMDB Match'
from 	app_master_db.iris_view y,app_master_db.cmdb_view cmdb
	left outer join app_master_db.cmdb_contacts_view cc_asset on 
	(cmdb.asset_id=cc_asset.asset_id and cc_asset.contact_type='Asset Owner') 
where 	y.appsysrecordid=cmdb.asset_id and
	y.appsysrecordid not in (select x.asset_id from
		(
		select asset_id from tmp_first_pass
		union 
		select asset_id from tmp_second_pass
		union 
		select asset_id from tmp_third_pass
		) x
	)
group by
	cmdb.asset_name,
	cmdb.asset_id,cmdb.short_description,
	y.App_Owner,y.dns_name,
	y.business_segment,
	--cmdb.Owning_sub_business,
	cmdb.external_facing,
	cmdb.status,
	itriskappid,cmdb.business_p_l,
	cmdb.server_ownership,tester,objective,sox,cmdb.criticality,
	cmdb.availability_impact,appmapping_status,
	cmdb.pii_employeecontractor,
	cmdb.Pii_consumer,cmdb.Pii_medical,
	cmdb.Pii_personal_bank_accounts,
	cmdb.Pii_cards,
	cmdb.pii_ssn_or_government_ids,
	cmdb.Pii_special_data,
	cmdb.ip_business_critical,
	cmdb.ip_highmedium_risk,
	cmdb.govt_classified,
	cmdb.govt_controlled_unclassified,
	cmdb.third_party_data,
	cmdb.export_control,
	cmdb.sox_criticality,
	cmdb.financial,
	cmdb.pci,cmdb.product_quality,
	cmdb.compliance_security,
	y.defined_critical_trading,cmdb.fisma,cmdb.dfars_ucti,
	y.it_ops_critical,y.critical_date,sensitive_data,
	y.software_vendor,y.software_version,y.hosting_vendor,cmdb.bank_regulated_tier,
	y.commercial_customer,y.trans_sensitive_data_fcial,y.trans_sensitive_data_reg,
	y.trans_system_integrity_other,y.software_configuration,y.customer_contractual,
	y.commercial_software,y.capital_defined,y.availability,y.critical_defined,
	y.external,y.parent_business,cmdb.manufacturer_vendor,cmdb.technology_stack


Matched records insert - all match
----------------------------------------------------------------------------------------------------
insert 	into app_master_db.iris_summary
select 	cmdb.asset_name,
	case when cmdb.asset_id is null then '' else cmdb.asset_id end,
	case when cmdb.short_description='N/A' then '' else cmdb.short_description end,
	array_to_string(array_agg(distinct cc_asset.contact_person),';'),
	y.dns_name,
	parent_business business,
	case when y.business_segment is null then '' else y.business_segment end,
	cmdb.external_facing external_facing,
	cmdb.status,
	case when cmdb.availability_impact in ('High','Severe') or pii_employeecontractor='Yes'
		or cmdb.pii_consumer='Yes' or pii_medical='Yes' 
		or pii_personal_bank_accounts='Yes' or pii_cards='Yes' or pii_ssn_or_government_ids='Yes'
		or cmdb.pii_special_data='Yes' or cmdb.ip_business_critical='Yes' or ip_highmedium_risk='Yes'
		or cmdb.govt_classified='Yes' or cmdb.govt_controlled_unclassified='Yes' or third_party_data='Yes'
		or COALESCE(NULLIF(export_control,'')) not in ('NO EC RESTRICTIONS')  
		or sox_criticality = 'Yes' or financial='Yes' or cmdb.product_quality='Yes' 
		or pci='Yes' or compliance_security='Yes' then 'Yes'::character varying 
		else 'No'::character varying end, --critical system flag, iris derived
	itriskappid,
	cmdb.business_p_l,
	cmdb.server_ownership,
	tester,
	case when objective='1' then 'Yes'::character varying 
		when objective='0' then 'No'::character varying else ''::character varying end,
	case when sox_criticality = 'Yes' then 'Yes'::character varying else 'No'::character varying end, --Sox app flag, iris defined
	cmdb.criticality,
	cmdb.availability_impact,
	case 	when 	sox_criticality = 'Yes' or 
			financial='Yes' or 
			cmdb.product_quality='Yes' or 
			pci='Yes' or 
			compliance_security='Yes' or
			software_configuration='1' or
			customer_contractual='1'
		then 'Yes'::character varying 
		else 'No'::character varying end, --system_integrity flag iris derived
	y.appmapping_status,
	cmdb.pii_employeecontractor,
	cmdb.Pii_consumer,
	cmdb.Pii_medical,
	cmdb.Pii_personal_bank_accounts,
	cmdb.Pii_cards,
	cmdb.pii_ssn_or_government_ids,
	cmdb.Pii_special_data,
	cmdb.ip_business_critical,
	cmdb.ip_highmedium_risk,
	cmdb.govt_classified,
	cmdb.govt_controlled_unclassified,
	cmdb.third_party_data,
	cmdb.export_control,
	cmdb.sox_criticality,
	cmdb.financial,
	cmdb.pci,
	cmdb.product_quality,
	cmdb.compliance_security,
	case when defined_critical_trading='1' then 'Yes'::character varying 
		when defined_critical_trading='0' then 'No'::character varying else ''::character varying end,
	cmdb.fisma,
	cmdb.dfars_ucti,
	case when it_ops_critical='1' then 'Yes'::character varying 
		when it_ops_critical='0' then 'No'::character varying else ''::character varying end,
	y.critical_date,
	case when pii_employeecontractor='Yes' or cmdb.pii_consumer='Yes' or pii_medical='Yes' 
		or pii_personal_bank_accounts='Yes' or pii_cards='Yes' or pii_ssn_or_government_ids='Yes'
		or cmdb.pii_special_data='Yes' or cmdb.ip_business_critical='Yes' or ip_highmedium_risk='Yes'
		or cmdb.govt_classified='Yes' or cmdb.govt_controlled_unclassified='Yes' or third_party_data='Yes'
		or COALESCE(NULLIF(export_control,'')) not in ('NO EC RESTRICTIONS')  
		or y.commercial_software='1'
		then 'Yes'::character varying else 'No'::character varying end,--sensitive_data_flag iris derived
	cmdb.manufacturer_vendor,
	case when cmdb.technology_stack='N/A' then '' else cmdb.technology_stack end,
	y.hosting_vendor,
	case when cmdb.bank_regulated_tier='N/A' then '' else cmdb.bank_regulated_tier end,
	case when commercial_customer='1' then 'Yes'::character varying 
		when commercial_customer='0' then 'No'::character varying else ''::character varying end,
	case when trans_sensitive_data_fcial='1' then 'Yes'::character varying 
		when trans_sensitive_data_fcial='0' then 'No'::character varying else ''::character varying end,
	case when trans_sensitive_data_reg='1' then 'Yes'::character varying 
		when trans_sensitive_data_reg='0' then 'No'::character varying else ''::character varying end,
	case when trans_system_integrity_other='1' then 'Yes'::character varying 
		when trans_system_integrity_other='0' then 'No'::character varying else ''::character varying end,
	case when software_configuration='1' then 'Yes'::character varying 
		when software_configuration='0' then 'No'::character varying else ''::character varying end,
	case when customer_contractual='1' then 'Yes'::character varying 
		when customer_contractual='0' then 'No'::character varying else ''::character varying end,
	case when commercial_software='1' then 'Yes'::character varying 
		when commercial_software='0' then 'No'::character varying else ''::character varying end,
	case when capital_defined='1' then 'Yes'::character varying 
		when capital_defined='0' then 'No'::character varying else ''::character varying end,
	case when cmdb.availability_impact in ('High','Severe') then 'Yes'::character varying else 
		'No'::character varying end, --application_availability_flag iris derived
	case when critical_defined='1' then 'Yes'::character varying 
		when critical_defined='0' then 'No'::character varying else ''::character varying end,
	case when external='1' then 'Yes'::character varying 
		when external='0' then 'No'::character varying else ''::character varying end,
	'IRIS CMDB Match'
from 	app_master_db.iris_view y,app_master_db.cmdb_view cmdb,app_master_db.at_view at,
	(
	select a.application_descriptors_mandatory,a.asset_id from tmp_first_pass a
	union 
	select b.application_descriptors_mandatory,b.asset_id from tmp_second_pass b 
	union 
	select c.application_descriptors_mandatory,c.asset_id from tmp_third_pass c 
	) x
	left outer join app_master_db.cmdb_contacts_view cc_asset on 
	(x.asset_id=cc_asset.asset_id and cc_asset.contact_type='Asset Owner') 
where  
	y.appsysrecordid=cmdb.asset_id and cmdb.asset_id=x.asset_id and 
	x.application_descriptors_mandatory=at.application_descriptors_mandatory

group by
	cmdb.asset_name,
	cmdb.asset_id,
	cmdb.short_description,
	y.App_Owner,y.dns_name,
	y.business_segment,
	--cmdb.Owning_sub_business,
	cmdb.status,itriskappid,
	cmdb.business_p_l,
	cmdb.server_ownership,tester,objective,sox,
	cmdb.criticality,
	cmdb.availability_impact,y.appmapping_status,
	cmdb.pii_employeecontractor,
	cmdb.Pii_consumer,cmdb.Pii_medical,
	cmdb.Pii_personal_bank_accounts,
	cmdb.Pii_cards,
	cmdb.pii_ssn_or_government_ids,
	cmdb.Pii_special_data,
	cmdb.ip_business_critical,
	cmdb.ip_highmedium_risk,
	cmdb.govt_classified,
	cmdb.govt_controlled_unclassified,
	cmdb.third_party_data,
	cmdb.export_control,
	cmdb.sox_criticality,
	cmdb.financial,
	cmdb.pci,cmdb.product_quality,
	cmdb.compliance_security,
	y.defined_critical_trading,cmdb.fisma,cmdb.dfars_ucti,
	y.it_ops_critical,y.critical_date,y.sensitive_data,
	y.software_vendor,y.software_version,y.hosting_vendor,
	cmdb.bank_regulated_tier,
	y.commercial_customer,y.trans_sensitive_data_fcial,y.trans_sensitive_data_reg,
	y.trans_system_integrity_other,y.software_configuration,y.customer_contractual,
	y.commercial_software,y.capital_defined,y.availability,y.critical_defined,y.external,
	cmdb.external_facing,y.parent_business,
	cmdb.manufacturer_vendor,cmdb.technology_stack