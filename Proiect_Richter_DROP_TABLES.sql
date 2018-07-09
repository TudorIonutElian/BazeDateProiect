prompt Disabling triggers for JUDETE...
alter table JUDETE disable all triggers;

prompt Disabling triggers for LISTA_INSTITUTII...
alter table LISTA_INSTITUTII disable all triggers;

prompt Disabling triggers for LOCALITATI...
alter table LOCALITATI disable all triggers;

prompt Disabling triggers for MACROREGIUNI...
alter table MACROREGIUNI disable all triggers;

prompt Disabling triggers for REGIUNI...
alter table REGIUNI disable all triggers;

prompt Disabling triggers for TIP_INSTITUTII...
alter table TIP_INSTITUTII disable all triggers;

--SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ('JUDETE','LISTA_INSTITUTII','LOCALITATI','MACROREGIUNI','REGIUNI','TIP_INSTITUTII')
--AND CONSTRAINT_TYPE = 'R'
--;

prompt Disabling foreign key constraints for JUDETE...
alter table JUDETE disable constraint JUD_REG_FK;

prompt Disabling foreign key constraints for LISTA_INSTITUTII...
alter table LISTA_INSTITUTII disable constraint LIS_LOC_FK;
alter table LISTA_INSTITUTII disable constraint LIS_TIP_FK;

prompt Disabling foreign key constraints for LOCALITATI...
alter table LOCALITATI disable constraint LOC_JUD_FK;
alter table LOCALITATI disable constraint LOC_REG_FK;

prompt Disabling foreign key constraints for REGIUNI...
alter table REGIUNI disable constraint REG_MAC_FK;

COMMIT;

DROP TABLE LISTA_INSTITUTII;
DROP TABLE TIP_INSTITUTII;
DROP TABLE LOCALITATI;
DROP TABLE JUDETE;
DROP TABLE REGIUNI;
DROP TABLE MACROREGIUNI;
