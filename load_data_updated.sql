
SET CLIENT_ENCODING='LATIN1';
SET CLIENT_ENCODING='UTF-8';
\copy apptracker_staging from 'C:\Users\502390612\Documents\AppDB\Data\at.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'

10477237429~Japan Payroll~1000206206~Kudomi	 Shuhei (302014379)~@CORP Japan Payroll IT Admin~Mike Stampalia~Corporate~GGO~High~1	001-10	000~ASPAC~Softbank IDC/Tokyo~Tokyo	 Japan~Yes~Yes~Windows~"Windows Server2008 R2 Enterprise Edition 64-bit SP1~Yes~Windows~"Windows Server2008 R2 Enterprise Edition 64-bit SP1~Yes~Windows~Oracle Database 11g~Oracle~"Windows Server2008 R2 Enterprise Edition 64-bit SP1~No~HR - Human Resources~Yes~~~~~~~N/A~~N/A~~Young	 Benjamin (213007785)~~~~UAI1003472~Business Application~~~~~~~																	
10510929762~Oracle Applications "LISA"~4448~100007234~100007234~~Healthcare~~~~~~~~~~~~~~~~~~~No~OTR - Order to Remittance~~~~~~GE Restricted~~2015~Q4~N/A~~György	Péter~Active~~~UAI1002354~~~~~~~~																	\copy edw.cmdb_ci_ext from 'C:\Users\502390612\Desktop\cmdb_ci1.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'				

\copy apptracker_staging from 'C:\Temp\AppLandscape_Feed.csv' NULL 'NULL' DELIMITER '~' CSV HEADER QUOTE '"'



\copy cmdb_staging from 'C:\Users\502390612\Documents\AppDB\Data\cmdb.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
41642
41926

\copy cmdb_contacts_staging from 'C:\Users\502390612\Documents\AppDB\Data\contact1.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
65531
65534

\copy cmdb_contacts_staging from 'C:\Users\502390612\Documents\AppDB\Data\contact2.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
22407
23663


\copy iris_staging from 'C:\Users\502390612\Documents\AppDB\Data\iris.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
9174

\copy iris_staging from 'C:\Users\502390612\Documents\AppDB\Data\iris.csv' NULL 'NULL' DELIMITER '|' CSV HEADER QUOTE '"'

\copy iris_staging from 'C:\Temp\CS_Application_Inventory_05172015.csv' NULL 'NULL' DELIMITER '|' CSV HEADER QUOTE '"'




\copy app_servers_staging from 'C:\Users\502390612\Documents\AppDB\Data\servers.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
36242


\copy cmdb_relation_data_staging from 'C:\Users\502390612\Documents\AppDB\Data\relation.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
65531

\copy cmdb_relation_data_staging from 'C:\Users\502390612\Documents\AppDB\Data\relation1.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
65535

\copy cmdb_relation_data_staging from 'C:\Users\502390612\Documents\AppDB\Data\relation2.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'
65535

\copy ip_details_staging from 'C:\Users\502390612\Documents\AppDB\Data\ip_detail.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'

\copy ip_details_staging from 'C:\Users\502390612\Documents\AppDB\Data\ip_detail1.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'

\copy ip_details_staging from 'C:\Users\502390612\Documents\AppDB\Data\ip_detail2.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'


--------------------------------------------------------------------------
Not used below

\copy t_dw_sr_tech_stack_staging from 'C:\Users\502390612\Documents\AppDB\Data\tech_stack_data.csv' NULL 'NULL' DELIMITER ',' CSV HEADER QUOTE '"'


SET CLIENT_ENCODING='LATIN1';

-	psql -d asset_int -h 3.48.34.17 -p 5432 -U asset_int_ai_de8980

