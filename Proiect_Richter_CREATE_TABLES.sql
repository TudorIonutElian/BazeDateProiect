prompt
prompt Creating table MACROREGIUNI
prompt ======================
prompt
create table MACROREGIUNI
(
  ID_MACROREGIUNE       NUMBER,
  DENUMIRE_MACROREGIUNE VARCHAR2(50)
)
;
alter table MACROREGIUNI
  add constraint ID_MACROREGIUNE_PK primary key (ID_MACROREGIUNE);
alter table MACROREGIUNI
  add constraint DEN_MACROREGIUNE_NN
  check ("DENUMIRE_MACROREGIUNE" IS NOT NULL);

prompt
prompt Creating table REGIUNI
prompt ======================
prompt
create table REGIUNI
(
  ID_REGIUNE       NUMBER,
  DENUMIRE_REGIUNE VARCHAR2(50),
  ID_MACROREGIUNE  NUMBER
)
;
alter table REGIUNI
  add constraint ID_REGIUNE_PK primary key (ID_REGIUNE);
  
alter table REGIUNI
  add constraint REG_MAC_FK foreign key (ID_MACROREGIUNE)
  references MACROREGIUNI (ID_MACROREGIUNE);
  
alter table REGIUNI
  add constraint DEN_REGIUNE_NN
  check ("DENUMIRE_REGIUNE" IS NOT NULL);

prompt
prompt Creating table JUDETE
prompt ===================
prompt
create table JUDETE
(
  ID_JUDET       CHAR(2),
  DENUMIRE_JUDET VARCHAR2(40),
  ID_REGIUNE     NUMBER,
  constraint JUDET_C_ID_PK primary key (ID_JUDET)
);

alter table JUDETE
    add ID_MACROREGIUNE NUMBER;

alter table JUDETE
  add constraint JUD_REG_FK foreign key (ID_REGIUNE)
  references REGIUNI (ID_REGIUNE);

alter table JUDETE
  add constraint JUD_MAC_FK foreign key (ID_MACROREGIUNE)
  references MACROREGIUNI (ID_MACROREGIUNE);
  
alter table JUDETE
  add constraint DEN_JUDET_NN
  check ("DENUMIRE_JUDET" IS NOT NULL);

prompt
prompt Creating table LOCALITATI
prompt ======================
prompt
create table LOCALITATI
(
  ID_LOCALITATE         NUMBER not null,
  DENUMIRE_LOCALITATE   VARCHAR2(100),
  RESEDINTA_JUDET       VARCHAR2(50),
  RESEDINTA_REGIUNE     VARCHAR2(50),
  ID_REGIUNE            NUMBER,
  ID_JUDET              CHAR(2)
)
;
alter table LOCALITATI
  add constraint LOC_ID_PK primary key (ID_LOCALITATE);
  
alter table LOCALITATI
  add constraint LOC_JUD_FK foreign key (ID_JUDET)
  references JUDETE (ID_JUDET);

alter table LOCALITATI
  add constraint LOC_REG_FK foreign key (ID_REGIUNE)
  references REGIUNI (ID_REGIUNE);
  
alter table LOCALITATI
  add constraint LOC_LOCALITATE_NN
  check ("DENUMIRE_LOCALITATE" IS NOT NULL);

create index LOC_LOCALITATE_IX on LOCALITATI (DENUMIRE_LOCALITATE);
create index LOC_JUDET_IX on LOCALITATI (ID_JUDET);
create index LOC_REGIUNE_IX on LOCALITATI (ID_REGIUNE);

prompt
prompt Creating table TIP_INSTITUTII
prompt ===========================
prompt
create table TIP_INSTITUTII
(
  ID_INSTITUTIE       NUMBER(4) not null,
  TIP_INSTITUTIE      VARCHAR2(100)
)
;
alter table TIP_INSTITUTII
  add constraint DEPT_ID_PK primary key (ID_INSTITUTIE);

prompt
prompt Creating table LISTA_INSTITUTII
prompt ======================
prompt
create table LISTA_INSTITUTII
(
  ID_NUME               NUMBER(4) not null,
  DENUMIRE_INSTITUTIE   VARCHAR2(200),
  ID_LOCALITATE         NUMBER(6),
  LINK_INSTITUTIE       VARCHAR2(200)
)
;
alter table LISTA_INSTITUTII
  add constraint NAME_ID_PK primary key (ID_NUME);
  
alter table LISTA_INSTITUTII
  add constraint LIS_LOC_FK foreign key (ID_LOCALITATE)
  references LOCALITATI (ID_LOCALITATE);

alter table LISTA_INSTITUTII
  add ID_INSTITUTIE NUMBER(4);

alter table LISTA_INSTITUTII
  add constraint LIS_TIP_FK foreign key (ID_INSTITUTIE)
  references TIP_INSTITUTII (ID_INSTITUTIE);