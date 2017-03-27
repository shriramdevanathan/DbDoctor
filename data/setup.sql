---------------------------------------------
-- Export file for user CS5226             --
-- Created by group3 on 4/9/2012, 8:21:12 AM --
---------------------------------------------

spool setup.log

prompt
prompt Creating table DB_MON_BUFFER_CACHE
prompt ==================================
prompt
create table DB_MON_BUFFER_CACHE
(
  snap_id     NUMBER not null,
  snap_time   DATE not null,
  snap_val_1  VARCHAR2(300),
  snap_val_2  VARCHAR2(300),
  snap_val_3  VARCHAR2(300),
  snap_val_4  VARCHAR2(300),
  snap_val_5  VARCHAR2(300),
  snap_val_6  VARCHAR2(300),
  snap_val_7  VARCHAR2(300),
  snap_val_8  VARCHAR2(300),
  snap_val_9  VARCHAR2(300),
  snap_val_10 VARCHAR2(300),
  snap_val_11 VARCHAR2(300),
  snap_val_12 VARCHAR2(300),
  snap_val_13 VARCHAR2(300),
  snap_val_14 VARCHAR2(300),
  snap_val_15 VARCHAR2(300),
  snap_val_16 VARCHAR2(300),
  snap_val_17 VARCHAR2(300),
  snap_val_18 VARCHAR2(300),
  snap_val_19 VARCHAR2(300),
  snap_val_20 VARCHAR2(300)
)
;
alter table DB_MON_BUFFER_CACHE
  add primary key (SNAP_ID);
alter table DB_MON_BUFFER_CACHE
  add unique (SNAP_TIME);

prompt
prompt Creating table DB_MON_ERROR_CAPTURE
prompt ===================================
prompt
create table DB_MON_ERROR_CAPTURE
(
  error_text VARCHAR2(4000),
  location   VARCHAR2(300),
  etime      DATE
)
;

prompt
prompt Creating table DB_MON_HELP
prompt ==========================
prompt
create table DB_MON_HELP
(
  help_parent       VARCHAR2(50),
  help_child_detail CLOB,
  help_id           NUMBER
)
;

prompt
prompt Creating table DB_MON_IO_SNAP
prompt =============================
prompt
create table DB_MON_IO_SNAP
(
  snap_id     NUMBER not null,
  snap_time   DATE not null,
  snap_val_1  VARCHAR2(300),
  snap_val_2  VARCHAR2(300),
  snap_val_3  VARCHAR2(300),
  snap_val_4  VARCHAR2(300),
  snap_val_5  VARCHAR2(300),
  snap_val_6  VARCHAR2(300),
  snap_val_7  VARCHAR2(300),
  snap_val_8  VARCHAR2(300),
  snap_val_9  VARCHAR2(300),
  snap_val_10 VARCHAR2(300),
  snap_val_11 VARCHAR2(300),
  snap_val_12 VARCHAR2(300),
  snap_val_13 VARCHAR2(300),
  snap_val_14 VARCHAR2(300),
  snap_val_15 VARCHAR2(300),
  snap_val_16 VARCHAR2(300),
  snap_val_17 VARCHAR2(300),
  snap_val_18 VARCHAR2(300),
  snap_val_19 VARCHAR2(300),
  snap_val_20 VARCHAR2(300)
)
;
alter table DB_MON_IO_SNAP
  add primary key (SNAP_ID);
alter table DB_MON_IO_SNAP
  add unique (SNAP_TIME);

prompt
prompt Creating table DB_MON_PARAM_MSTR
prompt ================================
prompt
create table DB_MON_PARAM_MSTR
(
  dmpm_param_id     NUMBER not null,
  param_table_name  VARCHAR2(30),
  param_desc        VARCHAR2(300),
  param_name        VARCHAR2(50),
  dmpm_par_param_id NUMBER
)
;
comment on table DB_MON_PARAM_MSTR
  is 'This table contains the list of the monitor table names that will be created
dynamically by the procedure PROC_CREATE_TABLES_TO_BE. This is again dynamic, so the
DBA can insert any number of monitors, and he will see that in the next scheduler job run, the table
would have been created and will be reflected in the front end as well as an Odometer. He will have
to however configure other tables as well to get the parameters of the monitor up and running. The
numbering convention followed in DNS is as follows Main Parameter – 100, 200, 300, 400,. . .
and so on. ,where each number represents a monitor, such as Shared pool, buffer cache and so on.
Sub parameters – (101, 102, 103,. . . . . . ),(201,202,203,..),. . . . . . (n01,n02,. . . ) which correspond to
each monitor. This naming convention will be followed across all tables.';
alter table DB_MON_PARAM_MSTR
  add constraint IDX_DB_MON_PARAM primary key (DMPM_PARAM_ID);
alter table DB_MON_PARAM_MSTR
  add constraint FK_SELF foreign key (DMPM_PAR_PARAM_ID)
  references DB_MON_PARAM_MSTR (DMPM_PARAM_ID);

prompt
prompt Creating table DB_MON_PGA_SNAP
prompt ==============================
prompt
create table DB_MON_PGA_SNAP
(
  snap_id    NUMBER not null,
  snap_time  DATE not null,
  snap_val_1 VARCHAR2(300),
  snap_val_2 VARCHAR2(300),
  snap_val_3 VARCHAR2(300),
  snap_val_4 VARCHAR2(300),
  snap_val_5 VARCHAR2(300),
  snap_val_6 VARCHAR2(300),
  snap_val_7 VARCHAR2(300),
  snap_val_8 VARCHAR2(300)
)
;
create unique index UK_DMPS_TIME on DB_MON_PGA_SNAP (SNAP_TIME);
alter table DB_MON_PGA_SNAP
  add constraint PK_DMPS primary key (SNAP_ID, SNAP_TIME);

prompt
prompt Creating table DB_MON_PRAM_COL_MSTR
prompt ===================================
prompt
create table DB_MON_PRAM_COL_MSTR
(
  dmpm_param_id NUMBER not null,
  expression_1  VARCHAR2(300) not null,
  baseline_val  NUMBER not null
)
;
alter table DB_MON_PRAM_COL_MSTR
  add constraint PK_DMPM_PARAM_ID primary key (DMPM_PARAM_ID);
alter table DB_MON_PRAM_COL_MSTR
  add constraint FK_DMPM_PARAM_ID foreign key (DMPM_PARAM_ID)
  references DB_MON_PARAM_MSTR (DMPM_PARAM_ID);

prompt
prompt Creating table DB_MON_PRAM_INIT_REL
prompt ===================================
prompt
create table DB_MON_PRAM_INIT_REL
(
  dmpm_par_param_id    NUMBER not null,
  dmpm_param_id        NUMBER not null,
  dmpi_init_param_name VARCHAR2(50),
  dmpi_rel_desc        VARCHAR2(1000),
  dmpm_seq             NUMBER not null
)
;
alter table DB_MON_PRAM_INIT_REL
  add constraint PK_DMPIR primary key (DMPM_PAR_PARAM_ID, DMPM_PARAM_ID, DMPM_SEQ);
alter table DB_MON_PRAM_INIT_REL
  add constraint FK_DMPIR foreign key (DMPM_PARAM_ID)
  references DB_MON_PARAM_MSTR (DMPM_PARAM_ID);

prompt
prompt Creating table DB_MON_QUERY_MSTR
prompt ================================
prompt
create table DB_MON_QUERY_MSTR
(
  dmpm_param_id NUMBER not null,
  dmqm_seq      NUMBER not null,
  dmqm_query    CLOB,
  no_of_cols    NUMBER
)
;
alter table DB_MON_QUERY_MSTR
  add constraint IDX_DMQM primary key (DMPM_PARAM_ID, DMQM_SEQ);
alter table DB_MON_QUERY_MSTR
  add constraint FK_DMPM_ID_DMPM foreign key (DMPM_PARAM_ID)
  references DB_MON_PARAM_MSTR (DMPM_PARAM_ID);

prompt
prompt Creating table DB_MON_QUERY_SNAP_COL
prompt ====================================
prompt
create table DB_MON_QUERY_SNAP_COL
(
  dmpm_param_id NUMBER not null,
  dmqm_seq      NUMBER not null,
  query_col     VARCHAR2(30) not null,
  snap_col      VARCHAR2(30)
)
;
alter table DB_MON_QUERY_SNAP_COL
  add constraint IDX_DMQSC primary key (DMPM_PARAM_ID, DMQM_SEQ, QUERY_COL);
alter table DB_MON_QUERY_SNAP_COL
  add constraint FK_DMPM foreign key (DMPM_PARAM_ID)
  references DB_MON_PARAM_MSTR (DMPM_PARAM_ID);

prompt
prompt Creating table DB_MON_REDO_BUFF_SNAP
prompt ====================================
prompt
create table DB_MON_REDO_BUFF_SNAP
(
  snap_id     NUMBER not null,
  snap_time   DATE not null,
  snap_val_1  VARCHAR2(300),
  snap_val_2  VARCHAR2(300),
  snap_val_3  VARCHAR2(300),
  snap_val_4  VARCHAR2(300),
  snap_val_5  VARCHAR2(300),
  snap_val_6  VARCHAR2(300),
  snap_val_7  VARCHAR2(300),
  snap_val_8  VARCHAR2(300),
  snap_val_9  VARCHAR2(300),
  snap_val_10 VARCHAR2(300),
  snap_val_11 VARCHAR2(300),
  snap_val_12 VARCHAR2(300),
  snap_val_13 VARCHAR2(300),
  snap_val_14 VARCHAR2(300),
  snap_val_15 VARCHAR2(300),
  snap_val_16 VARCHAR2(300),
  snap_val_17 VARCHAR2(300),
  snap_val_18 VARCHAR2(300),
  snap_val_19 VARCHAR2(300),
  snap_val_20 VARCHAR2(300)
)
;
alter table DB_MON_REDO_BUFF_SNAP
  add primary key (SNAP_ID);
alter table DB_MON_REDO_BUFF_SNAP
  add unique (SNAP_TIME);

prompt
prompt Creating table DB_MON_ROLLBACK_SEGMENT
prompt ======================================
prompt
create table DB_MON_ROLLBACK_SEGMENT
(
  snap_id     NUMBER not null,
  snap_time   DATE not null,
  snap_val_1  VARCHAR2(300),
  snap_val_2  VARCHAR2(300),
  snap_val_3  VARCHAR2(300),
  snap_val_4  VARCHAR2(300),
  snap_val_5  VARCHAR2(300),
  snap_val_6  VARCHAR2(300),
  snap_val_7  VARCHAR2(300),
  snap_val_8  VARCHAR2(300),
  snap_val_9  VARCHAR2(300),
  snap_val_10 VARCHAR2(300),
  snap_val_11 VARCHAR2(300),
  snap_val_12 VARCHAR2(300),
  snap_val_13 VARCHAR2(300),
  snap_val_14 VARCHAR2(300),
  snap_val_15 VARCHAR2(300),
  snap_val_16 VARCHAR2(300),
  snap_val_17 VARCHAR2(300),
  snap_val_18 VARCHAR2(300),
  snap_val_19 VARCHAR2(300),
  snap_val_20 VARCHAR2(300)
)
;
alter table DB_MON_ROLLBACK_SEGMENT
  add primary key (SNAP_ID);
alter table DB_MON_ROLLBACK_SEGMENT
  add unique (SNAP_TIME);

prompt
prompt Creating table DB_MON_SHARED_POOL_SNAP
prompt ======================================
prompt
create table DB_MON_SHARED_POOL_SNAP
(
  snap_id     NUMBER not null,
  snap_time   DATE not null,
  snap_val_1  VARCHAR2(300),
  snap_val_2  VARCHAR2(300),
  snap_val_3  VARCHAR2(300),
  snap_val_4  VARCHAR2(300),
  snap_val_5  VARCHAR2(300),
  snap_val_6  VARCHAR2(300),
  snap_val_7  VARCHAR2(300),
  snap_val_8  VARCHAR2(300),
  snap_val_9  VARCHAR2(300),
  snap_val_10 VARCHAR2(300),
  snap_val_11 VARCHAR2(300),
  snap_val_12 VARCHAR2(300),
  snap_val_13 VARCHAR2(300),
  snap_val_14 VARCHAR2(300),
  snap_val_15 VARCHAR2(300),
  snap_val_16 VARCHAR2(300),
  snap_val_17 VARCHAR2(300),
  snap_val_18 VARCHAR2(300),
  snap_val_19 VARCHAR2(300),
  snap_val_20 VARCHAR2(300)
)
;
alter table DB_MON_SHARED_POOL_SNAP
  add primary key (SNAP_ID);
alter table DB_MON_SHARED_POOL_SNAP
  add unique (SNAP_TIME);

prompt
prompt Creating table DB_MON_THRESHOLD
prompt ===============================
prompt
create table DB_MON_THRESHOLD
(
  dmpm_par_param_id NUMBER not null,
  threshold_lvl1    NUMBER not null,
  threshold_lvl2    NUMBER not null,
  threshold_lvldesc VARCHAR2(400)
)
;
alter table DB_MON_THRESHOLD
  add constraint PK_DTHRESHOLD primary key (DMPM_PAR_PARAM_ID);
alter table DB_MON_THRESHOLD
  add constraint FK_THRESHOLD foreign key (DMPM_PAR_PARAM_ID)
  references DB_MON_PARAM_MSTR (DMPM_PARAM_ID);
alter table DB_MON_THRESHOLD
  add constraint CONS_TOT_THRESHOLD
  check ((THRESHOLD_LVL1+THRESHOLD_LVL2)>=50);

prompt
prompt Creating table DB_MON_WEIGHTAGE
prompt ===============================
prompt
create table DB_MON_WEIGHTAGE
(
  dmpm_param_id NUMBER not null,
  weight        NUMBER,
  type          VARCHAR2(2)
)
;
comment on table DB_MON_WEIGHTAGE
  is 'This table is used to store the wieghts of each sub parameter';
alter table DB_MON_WEIGHTAGE
  add primary key (DMPM_PARAM_ID);
alter table DB_MON_WEIGHTAGE
  add constraint FK_WEIGHT foreign key (DMPM_PARAM_ID)
  references DB_MON_PARAM_MSTR (DMPM_PARAM_ID);

prompt
prompt Creating table DB_MON_XY_STAT
prompt =============================
prompt
create table DB_MON_XY_STAT
(
  change_date DATE,
  x_val       NUMBER,
  y_val       NUMBER,
  active      VARCHAR2(2),
  z_val       NUMBER
)
;

prompt
prompt Creating table LOGIN_MASTER
prompt ===========================
prompt
create table LOGIN_MASTER
(
  username VARCHAR2(10) not null,
  pd       VARCHAR2(10) not null
)
;
alter table LOGIN_MASTER
  add constraint IDX_USERNAME primary key (USERNAME, PD);
alter table LOGIN_MASTER
  add constraint CONS_SAME
  check (USERNAME<>PD);

prompt
prompt Creating sequence SNAP_ID
prompt =========================
prompt
create sequence SNAP_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 446974
increment by 1
cache 20;

prompt
prompt Creating sequence SQ_DMQM_SEQ
prompt =============================
prompt
create sequence SQ_DMQM_SEQ
minvalue 1
maxvalue 999999999999999999999999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating package PKG_DB_MON
prompt ===========================
prompt
create or replace package PKG_DB_MON is
  --09/02/2012 09:40:00

  TYPE column_val IS VARRAY(50) OF VARCHAR2(200); --this means that at max we can have 50 columns which is the oracle standard
  TYPE T_CURSOR IS REF CURSOR;

Procedure PROC_GET_STAT_LEVEL_LED(PARAM_ID IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR);
  /* This procedure gives the overall wieghted value for each param id */


Procedure PROC_GET_STAT_OVERALL(PARAM_ID IN NUMBER,N_VALUES IN NUMBER,LEVEL IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR);
  /* This procedure gives the overall wieghted value for each param id */

Procedure PROC_GET_STAT_LEVEL(PARAM_ID IN NUMBER,N_VALUES IN NUMBER,LEVEL IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR);
  -- This procedure is used to get the values for the parameters for a horizontal graph

-- procedure to get the latest value of X and Y
Procedure PROC_GET_STAT_ALL(O_CURSOR OUT pkg_db_mon.T_CURSOR);
  --to be called for all param id's

Procedure PROC_GET_STAT(PARAM_ID IN NUMBER,
                          V_OUT_VAL OUT VARCHAR2);
                          --for each param id at different levels
Procedure PROC_GET_PARAM_NAME(V_PARAM_ID IN VARCHAR2,V_PARAM_NAME OUT VARCHAR2);
  -- procedure to get the parameter name

Procedure PROC_GET_XYZ(X OUT NUMBER,Y OUT NUMBER,Z OUT NUMBER);
  /*Get the value of XYZ*/
 
Procedure PROC_GET_THRESHOLD(PARAM_ID IN NUMBER,T1 OUT NUMBER,T2 OUT NUMBER);
  /*Get the value of Threshold*/
  
Procedure PROC_GET_THRESHOLD_ALL(O_CURSOR OUT pkg_db_mon.T_CURSOR);
  /*Get the value of Threshold for all paramters*/
  
Procedure PROC_GET_PARAM_DETAIL(PARAM_ID IN NUMBER,V_GRAPH NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR);
  /*Get the description of the parameters that can be changed*/
  
Procedure PROC_GET_DETAIL_REPORT(N_PARAM_ID IN NUMBER,start_time IN VARCHAR2, end_time IN VARCHAR2,O_CURSOR OUT pkg_db_mon.T_CURSOR);
  /*Get the report for a given date range*/
  
Procedure PROC_GET_CHILD(PARAM_ID IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR);
 /*Get Child*/

Procedure PROC_SET_THRESHOLD(PARAM_ID IN NUMBER,T1 IN NUMBER,T2 IN NUMBER,V_SUCCESS OUT VARCHAR2);
  /*Set the value of Threshold*/
Procedure PROC_SET_BASELINE(C_PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2) ;
/*Set the baseline values*/
Procedure PROC_SET_BASELINE_ALL(PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2);
  /*Set all the baseline values */

Procedure PROC_RESET_BASELINE(C_PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2);
   /*RESET EACH INDIVIDUAL BASELINE*/
   
Procedure PROC_RESET_BASELINE_ALL(PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2);
   /*RESET EACH INDIVIDUAL BASELINE*/
      
Procedure GET_AWR_TASK_REPORT(start_time IN VARCHAR2, end_time IN VARCHAR2, V_CLOB OUT CLOB );
 --from oracle tuning guide -- usage of addm
Procedure GET_HELP_LIST(O_CURSOR OUT pkg_db_mon.T_CURSOR );
/*List of available help functions*/

Procedure GET_HELP(ID IN NUMBER,V_NAME OUT VARCHAR2,V_CLOB OUT CLOB );
/*The Help knowledge matrix*/

Procedure GET_OUTSTANDING_ALERTS(O_CURSOR OUT pkg_db_mon.T_CURSOR);
 /* This procedure returns any outstanding alerts*/
 
Procedure PROC_WR_SCHED_INITIALIZE(X IN NUMBER, Y IN NUMBER,Z IN NUMBER);
  /* This procedure sets the value of x y and z .
   It also creates the schedules and programs for collecting the sanpshots */


Procedure PROC_READ_DMQM(PARAM_ID IN NUMBER, SUCCESS_FLAG OUT VARCHAR2);
  /*This procedure reads the query from the query table and executes it */

Procedure PROC_INSERT_SNAPSHOT(PARAM_ID       IN NUMBER,
                             column_val_dat in column_val,
                             di_date        in date,
                             SUCCESS_FLAG   OUT VARCHAR2);
  /*This procedure insert the read data from PROC_READ_DMQM into snapshot tables */
Procedure PROC_INSERT_DMQM(PARAM_ID     IN NUMBER,
                             QUERY_TEXT   IN CLOB,
                             SUCCESS_FLAG OUT VARCHAR2);
 /*This procedure is used to configure the query for each monitor*/
Procedure PROC_ERROR_CAPTURE(V_ERROR_TEXT IN VARCHAR2,
                               V_LOCATION   IN VARCHAR2);
 /* stores the errors run into */

Procedure PROC_CREATE_TABLES_TO_BE(V_TABLE_NAME IN VARCHAR2,V_FLAG OUT VARCHAR2);
  /*This procedure will create the table mentioned in the create list*/

Procedure PROC_RET_TABLES_TO_BE(O_CURSOR OUT pkg_db_mon.T_CURSOR);
  /*This procedure sends the list of tables to be created as part of the snap*/

Procedure PROC_EXEC_DEBUGGER(V_DEBUG_SQL IN OUT NOCOPY CLOB,O_CURSOR OUT pkg_db_mon.T_CURSOR,V_COUNT_TEXT OUT VARCHAR2);
  /*Procedure for debugger
  Input parameters: V_DEBUG_SQL VARCHAR2 - This is the sql that will get executed
  Output parameters: O_CURSOR Reference cursor - This is the cursor that will be returned*/

Procedure PROC_ANALYZE_SCHEMA(V_SCHEMA_NAME IN VARCHAR2,V_OUT OUT VARCHAR2);
  /*Analyze Schema*/
  
Procedure PROC_VALIDATE_LOGIN(UNAME IN VARCHAR2,PWD IN VARCHAR2,V_FLAG OUT VARCHAR2);
/*User authentication*/

Function FN_CEIL(NDATA IN NUMBER,NPREC IN NUMBER)RETURN NUMBER;
/*Rounding to a particular limit*/

Function FN_ABV_THRESHOLD(C_PARAM_ID IN NUMBER)RETURN NUMBER;
/*This function returns the child param id if its value is above threshold for param id*/


end PKG_DB_MON;
/

prompt
prompt Creating type SNAP_DISP
prompt =======================
prompt
CREATE OR REPLACE TYPE "SNAP_DISP"  as object
(
  -- Author  : group3
  -- Created : 2/10/2012 9:45:59 AM
  -- Purpose : snap display
param_id number,
snap_time date,
snap_value varchar2(300)
);
/

prompt
prompt Creating type SNAP_DISP_OBJ
prompt ===========================
prompt
create or replace type snap_disp_obj is table of snap_disp;
/

prompt
prompt Creating type SNAP_DISP_OV
prompt ==========================
prompt
create or replace type snap_disp_OV as object
(
  -- Author  : group3
  -- Created : 2/10/2012 9:45:59 AM
  -- Purpose : snap display
param_id number,
snap_time date,
snap_value varchar2(300),
rown number
)
/

prompt
prompt Creating type SNAP_DISP_OBJ_OV
prompt ==============================
prompt
create or replace type snap_disp_obj_ov is table of snap_disp_ov
/

prompt
prompt Creating type WEIGHT_OBJ
prompt ========================
prompt
CREATE OR REPLACE TYPE "WEIGHT_OBJ"  as object
(
  -- Purpose : weight display
param_id number,
WEIGHT_value NUMBER
);
/

prompt
prompt Creating type WEIGHT_OBJ_TAB
prompt ============================
prompt
create or replace type weight_obj_tab is table of WEIGHT_OBJ
/

prompt
prompt Creating package body PKG_DB_MON
prompt ================================
prompt
create or replace package body PKG_DB_MON is
/*Declare Common variables in the package*/
  V_LOCATION  VARCHAR2(300);
  V_PROC_NAME VARCHAR2(200);
  V_ERRM      VARCHAR2(300);
  V_SEL_CLAUSE VARCHAR2(4000);
  V_COL_CLAUSE VARCHAR2(500);
  V_TABLE_NAME VARCHAR2(40);
  V_BASELINE     VARCHAR2(300);

procedure PROC_GET_STAT_LEVEL_LED(PARAM_ID IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR) is
/*Select the Child parameter id*/
  cursor c_sub is
  SELECT c.DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR c,db_mon_weightage e
      WHERE DMPM_PAR_PARAM_ID=PARAM_ID
      and c.DMPM_PARAM_ID=e.dmpm_param_id
      and e.type='L'
     ORDER BY DMPM_PARAM_ID;


    V_CURSOR     snap_disp_obj;
   
    --IN_TIME_DATE DATE;
    snap_disp_typ  snap_disp_obj;
    snap_disp_typ1 snap_disp_obj;
    i              number;
    i_count        number := 0;
    t_count        number := 0;
    X              NUMBER;
    Y              NUMBER;
    Z              NUMBER;
    N_VALUES       NUMBER :=1;
  BEGIN
    V_PROC_NAME    := 'PROC_GET_STAT_LEVEL';
    V_LOCATION     := 'CODE BEGINS';
    snap_disp_typ1 := snap_disp_obj();
    V_CURSOR       := snap_disp_obj(); --initialize cursor

  -- get the latest values for x,y,z
  PROC_GET_XYZ(X,Y,Z);

  dbms_output.put_line(X||','||Y||','||Z);

     FOR c2_rec in  c_sub LOOP -- for each sub parameter id
                  BEGIN

                    SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = PARAM_ID;

                    SELECT EXPRESSION_1
                      INTO V_COL_CLAUSE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID = c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                  BEGIN

/*Dynamic select for selecting the snap values*/
             V_SEL_CLAUSE := 'select snap_disp('|| c2_rec.dmpm_param_id ||',SNAP_TIME,SNAP_VALUE) from (select ROWNUM AS NO_OF_RECORDS,SNAP_TIME,SNAP_VALUE from(select ' || c2_rec.DMPM_PARAM_ID ||
                                    ',SNAP_TIME,' || V_COL_CLAUSE|| ' as snap_value  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time <= (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || ')) order by snap_time desc)
                                    WHERE NO_OF_RECORDS <=' || N_VALUES;

         DBMS_OUTPUT.PUT_LINE(V_SEL_CLAUSE);
                    execute immediate V_SEL_CLAUSE bulk collect
                      into snap_disp_typ; -- USING IN_TIME_DATE ;
                    --  DBMS_OUTPUT.PUT_LINE(V_SEL_CLAUSE);
                  EXCEPTION
                    WHEN OTHERS THEN
                      V_ERRM := SQLERRM;
                      dbms_output.put_line(V_ERRM);
                      V_SEL_CLAUSE := 'SELECT snap_disp(' || PARAM_ID ||
                                      ',sysdate,''NOT AVAILABLE'')  FROM DUAL';
                      execute immediate V_SEL_CLAUSE bulk collect
                        into snap_disp_typ;
                  END;
                  --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ.count);
                  FOR indx IN 1 .. snap_disp_typ.COUNT LOOP

                    snap_disp_typ1.extend();
                    snap_disp_typ1(indx + t_count) := snap_disp_typ(indx);
                    dbms_output.put_line('New Array:' || snap_disp_typ1(indx)
                                         .snap_value);
                    i_count := i_count + 1;
                  END LOOP;
                  t_count := i_count;
           END LOOP;
    --ending the main cursor for loop
    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ1.count);

    i := snap_disp_typ1.FIRST; -- get subscript of first element

    WHILE i IS NOT NULL LOOP
      dbms_output.put_line('New array later:' || snap_disp_typ1(i)
                           .snap_value);
      V_CURSOR.extend();
      V_CURSOR(i) := snap_disp_typ1(i);
      i := snap_disp_typ1.NEXT(i); -- get subscript of next element
    END LOOP;

    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || V_CURSOR.count);

    OPEN O_CURSOR FOR
     SELECT c.param_id,c.snap_value
      FROM TABLE(V_CURSOR) c;

  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_GET_STAT_LEVEL_LED;

procedure PROC_GET_STAT_OVERALL(PARAM_ID IN NUMBER,N_VALUES IN NUMBER,LEVEL IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR) is
/*Select the Child parameter id*/
      cursor c_sub is
  SELECT c.DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR c,db_mon_weightage e
      WHERE DMPM_PAR_PARAM_ID=PARAM_ID
      and c.DMPM_PARAM_ID=e.dmpm_param_id
      and e.type='G'
     ORDER BY DMPM_PARAM_ID;

    V_CURSOR     snap_disp_obj_ov;
    V_SEL_CLAUSE VARCHAR2(4000);
    V_COL_CLAUSE VARCHAR2(200);
    V_TABLE_NAME VARCHAR2(40);
    --IN_TIME_DATE DATE;
    snap_disp_typ  snap_disp_obj_ov;
    snap_disp_typ1 snap_disp_obj_ov;
    i              number;
    i_count        number := 0;
    t_count        number := 0;
    X              NUMBER;
    Y              NUMBER;
    Z              NUMBER;
    V_GROUP_BY     VARCHAR2(300);
    V_COL_GROUP    VARCHAR2(300);
    IM             NUMBER;
    IH             NUMBER;    
   
  BEGIN
    V_PROC_NAME    := 'PROC_GET_STAT_OVERALL';
    V_LOCATION     := 'CODE BEGINS';
    snap_disp_typ1 := snap_disp_obj_ov();
    V_CURSOR       := snap_disp_obj_ov(); --initialize cursor

  -- get the latest values for x,y,z
  PROC_GET_XYZ(X,Y,Z);

  --dbms_output.put_line(X||','||Y||','||Z);
     FOR c2_rec in  c_sub LOOP -- for each sub parameter id
                  BEGIN

                    SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = PARAM_ID;

                    SELECT EXPRESSION_1,to_char(BASELINE_VAL)
                      INTO V_COL_CLAUSE,V_BASELINE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID = c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                  BEGIN

       IF LEVEL=2 THEN --hours/minutes/seconds
                   IF ROUND(Y / 3600) > 1 THEN
                     IH := Y/3600;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';

                   ELSIF ROUND(Y / 60) > 1 THEN --minutes
                   IM := Y/60;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';

                   ELSE --seconds
                  V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||Y||')*'||Y||')/24/60/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||Y||')*'||Y||')/24/60/60';

                  END IF;
        ELSIF LEVEL=1 THEN
                   IF ROUND(X / 3600) > 1 THEN
                     IH := X/3600;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';

                   ELSIF ROUND(X / 60) > 1 THEN --minutes
                   IM := X/60;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';

                   ELSE --seconds
                  V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||X||')*'||X||')/24/60/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||X||')*'||X||')/24/60/60';

                  END IF;
         END IF;/*Dynamic select for getting the snap values according to the clause specified*/
        V_SEL_CLAUSE := 'select snap_disp_ov('|| c2_rec.dmpm_param_id ||',SNAP_TIME,VALUE,NO_OF_RECORDS)  from (select ROWNUM AS NO_OF_RECORDS,SNAP_TIME,VALUE
                                 from(select '||V_COL_GROUP ||' snap_time,avg(' || V_COL_CLAUSE|| ')/'|| V_BASELINE ||'*100 as value  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time <= (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || '  )
                                    '||V_GROUP_BY||'
                                    order by snap_time desc))
                                    WHERE NO_OF_RECORDS <=' || N_VALUES ;
         DBMS_OUTPUT.PUT_LINE(V_SEL_CLAUSE);
                    execute immediate V_SEL_CLAUSE bulk collect
                      into snap_disp_typ; -- USING IN_TIME_DATE ;

                  EXCEPTION
                    WHEN OTHERS THEN
                      V_ERRM := SQLERRM;
                      dbms_output.put_line(V_ERRM);
                      V_SEL_CLAUSE := 'SELECT snap_disp(' || PARAM_ID ||
                                      ',sysdate,''NOT AVAILABLE'')  FROM DUAL';
                      execute immediate V_SEL_CLAUSE bulk collect
                        into snap_disp_typ;
                  END;

                  DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ.count);

                  FOR indx IN 1 .. snap_disp_typ.COUNT LOOP

                    snap_disp_typ1.extend();
                    snap_disp_typ1(indx + t_count) := snap_disp_typ(indx);
                  /*dbms_output.put_line('VALUE FOR :' ||snap_disp_typ1(indx).param_id||':'|| snap_disp_typ1(indx)
                                         .snap_value);*/
                    i_count := i_count + 1;
                  END LOOP;
                  t_count := i_count;
           END LOOP;
    --ending the main cursor for loop
    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ1.count);

    i := snap_disp_typ1.FIRST; -- get subscript of first element

    WHILE i IS NOT NULL LOOP
      /*dbms_output.put_line('New array later:' || snap_disp_typ1(i)
                           .snap_value);*/
      V_CURSOR.extend();
      V_CURSOR(i) := snap_disp_typ1(i);
      i := snap_disp_typ1.NEXT(i); -- get subscript of next element
    END LOOP;

    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || V_CURSOR.count);

    OPEN O_CURSOR FOR
    SELECT case when VALUE>100 THEN 100 ELSE round(VALUE,2) END   as VALUE FROM(
     SELECT d.dmpm_par_param_id,sum(c.snap_value*e.weight) VALUE,rown
      FROM TABLE(V_CURSOR) c,db_mon_weightage e,db_mon_param_mstr d
      where c.param_id=d.dmpm_param_id
      and c.param_id=e.dmpm_param_id
      and e.type='G'
      group by c.rown,d.dmpm_par_param_id
      order by c.rown) ;

  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_GET_STAT_OVERALL;

procedure PROC_GET_STAT_LEVEL(PARAM_ID IN NUMBER,N_VALUES IN NUMBER,LEVEL IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR) is

      cursor c_sub is
  SELECT c.DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR c,db_mon_weightage e
      WHERE DMPM_PAR_PARAM_ID=PARAM_ID
      and c.DMPM_PARAM_ID=e.dmpm_param_id
      and e.type='G'
     ORDER BY DMPM_PARAM_ID;


    V_CURSOR     snap_disp_obj;

    --IN_TIME_DATE DATE;
    snap_disp_typ  snap_disp_obj;
    snap_disp_typ1 snap_disp_obj;
    i              number;
    i_count        number := 0;
    t_count        number := 0;
    X              NUMBER;
    Y              NUMBER;
    Z              NUMBER;
    V_GROUP_BY     VARCHAR2(300);
    V_COL_GROUP    VARCHAR2(300);
    IH             NUMBER;
    IM             NUMBER;

  BEGIN
    V_PROC_NAME    := 'PROC_GET_STAT_LEVEL';
    V_LOCATION     := 'CODE BEGINS';
    snap_disp_typ1 := snap_disp_obj();
    V_CURSOR       := snap_disp_obj(); --initialize cursor

  -- get the latest values for x,y,z
  PROC_GET_XYZ(X,Y,Z);

  dbms_output.put_line(X||','||Y||','||Z);

     FOR c2_rec in  c_sub LOOP -- for each sub parameter id
                  BEGIN

                    SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = PARAM_ID;

                    SELECT EXPRESSION_1,to_char(BASELINE_VAL)
                      INTO V_COL_CLAUSE,V_BASELINE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID = c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                  BEGIN

       IF LEVEL=2 THEN --hours/minutes/seconds
                   IF ROUND(Y / 3600) > 1 THEN
                     IH := Y/3600;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';

                   ELSIF ROUND(Y / 60) > 1 THEN --minutes
                   IM := Y/60;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';

                   ELSE --seconds
                  V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||Y||')*'||Y||')/24/60/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||Y||')*'||Y||')/24/60/60';

                  END IF;
        ELSIF LEVEL=1 THEN
                   IF ROUND(X / 3600) > 1 THEN
                     IH := X/3600;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''hh'')/'||IH||')*'||IH||')/24';

                   ELSIF ROUND(X / 60) > 1 THEN --minutes
                   IM := X/60;
                     V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/'||IM||')*'||IM||')/24/60';

                   ELSE --seconds
                  V_GROUP_BY:='GROUP BY TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||X||')*'||X||')/24/60/60';
                     V_COL_GROUP:= 'TRUNC(snap_time,''hh24'') + (trunc(to_char(snap_time,''mi'')/1)*1)/24/60+ (trunc(to_char(snap_time,''ss'')/'||X||')*'||X||')/24/60/60';

                  END IF;
         END IF;
        V_SEL_CLAUSE := 'select snap_disp('|| c2_rec.dmpm_param_id ||',SNAP_TIME,VALUE)  from (select ROWNUM AS NO_OF_RECORDS,SNAP_TIME,VALUE
                                 from(select '||V_COL_GROUP ||' snap_time,avg(' || V_COL_CLAUSE || ')/'|| V_BASELINE ||'*100 as value  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time <= (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || '  )
                                    '||V_GROUP_BY||'
                                    order by snap_time desc))
                                    WHERE NO_OF_RECORDS <=' || N_VALUES ;
         --DBMS_OUTPUT.PUT_LINE(V_SEL_CLAUSE);
                    execute immediate V_SEL_CLAUSE bulk collect
                      into snap_disp_typ; -- USING IN_TIME_DATE ;

                    --  DBMS_OUTPUT.PUT_LINE(V_SEL_CLAUSE);

                  EXCEPTION
                    WHEN OTHERS THEN
                      V_ERRM := SQLERRM;
                      dbms_output.put_line(V_ERRM);
                      V_SEL_CLAUSE := 'SELECT snap_disp(' || PARAM_ID ||
                                      ',sysdate,''NOT AVAILABLE'')  FROM DUAL';
                      execute immediate V_SEL_CLAUSE bulk collect
                        into snap_disp_typ;
                  END;

                  --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ.count);

                  FOR indx IN 1 .. snap_disp_typ.COUNT LOOP

                    snap_disp_typ1.extend();
                    snap_disp_typ1(indx + t_count) := snap_disp_typ(indx);
                    /*dbms_output.put_line('New Array:' || snap_disp_typ1(indx)
                                         .snap_value);*/
                    i_count := i_count + 1;
                  END LOOP;
                  t_count := i_count;
           END LOOP;
    --ending the main cursor for loop
    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ1.count);

    i := snap_disp_typ1.FIRST; -- get subscript of first element

    WHILE i IS NOT NULL LOOP
      /*dbms_output.put_line('New array later:' || snap_disp_typ1(i)
                           .snap_value);*/
      V_CURSOR.extend();
      V_CURSOR(i) := snap_disp_typ1(i);
      i := snap_disp_typ1.NEXT(i); -- get subscript of next element
    END LOOP;

    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || V_CURSOR.count);

    OPEN O_CURSOR FOR
     SELECT c.param_id,case when (c.snap_value*e.weight)>100 THEN 100 ELSE round((c.snap_value*e.weight),2) END AS VALUE
      FROM TABLE(V_CURSOR) c,db_mon_weightage e
      where c.param_id=e.dmpm_param_id
      and e.type='G';

  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_GET_STAT_LEVEL;

  procedure PROC_GET_STAT_ALL(O_CURSOR OUT pkg_db_mon.T_CURSOR) is

    cursor c_main is
      SELECT DMPM_PARAM_ID AS PARAM_ID FROM DB_MON_PARAM_MSTR;

      cursor c_sub(PARAM_ID number) is
  SELECT DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR
     WHERE DMPM_PAR_PARAM_ID=PARAM_ID
     ORDER BY DMPM_PARAM_ID;

    V_CURSOR     snap_disp_obj;

    --IN_TIME_DATE DATE;
    snap_disp_typ  snap_disp_obj;
    snap_disp_typ1 snap_disp_obj;

    i              number;
    i_count        number := 0;
    t_count        number := 0;
  
  BEGIN
    V_PROC_NAME    := 'PROC_GET_STAT:TYPE ALL';
    V_LOCATION     := 'CODE BEGINS';
    snap_disp_typ1 := snap_disp_obj();
    V_CURSOR       := snap_disp_obj(); --initialize cursor

    FOR c1_rec IN c_main LOOP -- for each main parameter id
     FOR c2_rec in  c_sub(c1_rec.param_id) LOOP -- for each sub parameter id
                  BEGIN

                    SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = c1_rec.PARAM_ID;

                    SELECT EXPRESSION_1,to_char(BASELINE_VAL)
                      INTO V_COL_CLAUSE,V_BASELINE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID = c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                  BEGIN
                  --get the values currently
                    V_SEL_CLAUSE := 'select snap_disp(' || c2_rec.DMPM_PARAM_ID ||
                                    ',SNAP_TIME,' || V_COL_CLAUSE || '/'|| V_BASELINE ||'*100)  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time = (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || '  )';

                  --dbms_output.put_line(V_SEL_CLAUSE);

                    execute immediate V_SEL_CLAUSE bulk collect
                      into snap_disp_typ; -- USING IN_TIME_DATE ;

                  EXCEPTION
                    WHEN OTHERS THEN
                      V_SEL_CLAUSE := 'SELECT snap_disp(' || c1_rec.PARAM_ID ||
                                      ',sysdate,''NOT AVAILABLE'')  FROM DUAL';
                      execute immediate V_SEL_CLAUSE bulk collect
                        into snap_disp_typ;
                  END;

                  DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ.count);
                  FOR indx IN 1 .. snap_disp_typ.COUNT LOOP

                    snap_disp_typ1.extend();
                    snap_disp_typ1(indx + t_count) := snap_disp_typ(indx);

                    i_count := i_count + 1;
                  END LOOP;
                  t_count := i_count;
           END LOOP;


    END LOOP;
    --ending the main cursor for loop
    --DBMS_OUTPUT.put_line('Dynamic EXECUTE count: ' || snap_disp_typ1.count);

  i:=snap_disp_typ1.first;
          WHILE i IS NOT NULL LOOP
         /*dbms_output.put_line('VALUE FOR :' ||snap_disp_typ1(i).param_id||':'|| snap_disp_typ1(i)
                                         .snap_value);*/
            V_CURSOR.extend();
            V_CURSOR(i) := snap_disp_typ1(i);
            i := snap_disp_typ1.NEXT(i); -- get subscript of next element
          END LOOP;

    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || V_CURSOR.count);

    OPEN O_CURSOR FOR
      SELECT d.dmpm_par_param_id,case when sum(c.snap_value*e.weight)>100 THEN 100 ELSE round(sum(c.snap_value*e.weight),2) END  
      FROM TABLE(V_CURSOR) c,db_mon_param_mstr d,db_mon_weightage e
      where c.param_id=d.dmpm_param_id
      and d.dmpm_param_id=e.dmpm_param_id
      and e.type='G'
      group by d.dmpm_par_param_id;

  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
  end PROC_GET_STAT_ALL;

  --procedure to read the statistics
  --values that will be passed are the level and the param id
procedure PROC_GET_STAT(PARAM_ID IN NUMBER
                          ,V_OUT_VAL OUT VARCHAR2) is

      cursor c_sub(PARAM_ID number) is
  SELECT DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR
     WHERE DMPM_PAR_PARAM_ID=PARAM_ID
     ORDER BY DMPM_PARAM_ID;

  O_CURSOR pkg_db_mon.T_CURSOR;
    V_CURSOR     snap_disp_obj;

    --IN_TIME_DATE DATE;
    snap_disp_typ  snap_disp_obj;
    snap_disp_typ1 snap_disp_obj;

    i              number;
    i_count        number := 0;
    t_count        number := 0;
    V_OUT_PARAM   VARCHAR2(20);

  begin
    V_PROC_NAME    := 'PROC_GET_STAT:TYPE ALL';
    V_LOCATION     := 'CODE BEGINS';
    snap_disp_typ1 := snap_disp_obj();
    V_CURSOR       := snap_disp_obj(); --initialize cursor

     FOR c2_rec in  c_sub(PARAM_ID) LOOP -- for each sub parameter id
                  BEGIN

                    SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID =PARAM_ID;

                    SELECT EXPRESSION_1,BASELINE_VAL
                      INTO V_COL_CLAUSE,V_BASELINE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID = c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                  BEGIN
                  --get the values currently
                    V_SEL_CLAUSE := 'select snap_disp(' || c2_rec.DMPM_PARAM_ID ||
                                    ',SNAP_TIME,' || V_COL_CLAUSE || '/'|| V_BASELINE ||'*100 ) from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time = (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || '  )';

                  dbms_output.put_line(V_SEL_CLAUSE);

                    execute immediate V_SEL_CLAUSE bulk collect
                      into snap_disp_typ; -- USING IN_TIME_DATE ;

                  EXCEPTION
                    WHEN OTHERS THEN
                      V_SEL_CLAUSE := 'SELECT snap_disp(' || PARAM_ID ||
                                      ',sysdate,''NOT AVAILABLE'')  FROM DUAL';
                      execute immediate V_SEL_CLAUSE bulk collect
                        into snap_disp_typ;
                  END;

                --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ.count);
             --   DBMS_OUTPUT.put_line('weight EXECUTE: ' || wieght_disp.count);
                  FOR indx IN 1 .. snap_disp_typ.COUNT LOOP

                    snap_disp_typ1.extend();
                    snap_disp_typ1(indx + t_count) := snap_disp_typ(indx);

                    i_count := i_count + 1;
                  END LOOP;
                  t_count := i_count;
           END LOOP;

    --DBMS_OUTPUT.put_line('Dynamic EXECUTE count: ' || snap_disp_typ1.count);

  i:=snap_disp_typ1.first;
          WHILE i IS NOT NULL LOOP
            /*dbms_output.put_line('New array later:' || snap_disp_typ1(i)
                                 .snap_value);*/
            V_CURSOR.extend();
            V_CURSOR(i) := snap_disp_typ1(i);
            i := snap_disp_typ1.NEXT(i); -- get subscript of next element
          END LOOP;

    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || V_CURSOR.count);

    OPEN O_CURSOR FOR
      SELECT d.dmpm_par_param_id,case when sum(c.snap_value*e.weight)>100 THEN 100 ELSE round(sum(c.snap_value*e.weight),2) END as  wt
      FROM TABLE(V_CURSOR) c,db_mon_param_mstr d,db_mon_weightage e
      where c.param_id=d.dmpm_param_id
      and d.dmpm_param_id=e.dmpm_param_id
      and e.type='G'
      group by d.dmpm_par_param_id;

      LOOP
        fetch O_CURSOR into V_OUT_PARAM,V_OUT_VAL;
        exit when O_CURSOR%notfound;

      END LOOP;
      close O_CURSOR;

  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
  end PROC_GET_STAT;
  
  procedure PROC_GET_PARAM_NAME(V_PARAM_ID IN VARCHAR2,V_PARAM_NAME OUT VARCHAR2) is

   BEGIN
    V_PROC_NAME    := 'PROC_GET_PARAM_NAME';
    V_LOCATION     := 'CODE BEGINS';


select PARAM_NAME
INTO  V_PARAM_NAME
from db_mon_param_mstr
WHERE DMPM_PARAM_ID=V_PARAM_ID;

   EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_GET_PARAM_NAME;
   
procedure PROC_GET_XYZ(X OUT NUMBER,Y OUT NUMBER,Z OUT NUMBER) is
   BEGIN
    V_PROC_NAME    := 'PROC_GET_XYZ';
    V_LOCATION     := 'CODE BEGINS';

        SELECT X_VAL,Y_VAL,Z_VAL
        INTO X,Y,Z
        FROM db_mon_xy_stat
        WHERE active='Y';

     EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_GET_XYZ;

Procedure PROC_GET_THRESHOLD(PARAM_ID IN NUMBER,T1 OUT NUMBER,T2 OUT NUMBER) is 
      BEGIN
      /*Initialization*/
        T1:=0;
        T2:=0;
         V_PROC_NAME    := 'PROC_GET_THRESHOLD';
         V_LOCATION     := 'CODE BEGINS';

        
    SELECT THRESHOLD_LVL1,THRESHOLD_LVL2
    INTO T1,T2
     FROM DB_MON_THRESHOLD WHERE DMPM_PAR_PARAM_ID= PARAM_ID;
        
    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_GET_THRESHOLD;
   
Procedure PROC_GET_THRESHOLD_ALL(O_CURSOR OUT pkg_db_mon.T_CURSOR) is
         BEGIN
         V_PROC_NAME    := 'PROC_GET_THRESHOLD_ALL';
         V_LOCATION     := 'CODE BEGINS';           
       
    OPEN O_CURSOR FOR 
    SELECT DMPM_PAR_PARAM_ID,THRESHOLD_LVL1,THRESHOLD_LVL2
     FROM DB_MON_THRESHOLD;
        
    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
      END PROC_GET_THRESHOLD_ALL;
      
      
Procedure PROC_GET_PARAM_DETAIL(PARAM_ID IN NUMBER,V_GRAPH NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR)
  is
         BEGIN
         V_PROC_NAME    := 'PROC_GET_PARAM_DETAIL';
         V_LOCATION     := 'CODE BEGINS';           
       
   
  IF V_GRAPH=2 THEN
   OPEN O_CURSOR FOR 
        SELECT 'INIT_ORA',DMPI_INIT_PARAM_NAME,DMPI_REL_DESC
        FROM DB_MON_PRAM_INIT_REL WHERE DMPM_PAR_PARAM_ID = PARAM_ID  AND  PKG_DB_MON.FN_ABV_THRESHOLD(DMPM_PARAM_ID)=DMPM_PARAM_ID
        union
        SELECT case when DMPM_PAR_PARAM_ID is null then 'PARENT' else 'CHILD' end,  PARAM_NAME,PARAM_DESC 
        FROM db_mon_param_mstr 
        WHERE DMPM_PARAM_ID = PARAM_ID OR DMPM_PAR_PARAM_ID=PARAM_ID
        union
        SELECT 'INIT_ORA',DMPI_INIT_PARAM_NAME,'This parameter is performing optimally!'
        FROM DB_MON_PRAM_INIT_REL WHERE DMPM_PAR_PARAM_ID = PARAM_ID  AND  PKG_DB_MON.FN_ABV_THRESHOLD(DMPM_PARAM_ID)=1;
        
        
             
  ELSIF V_GRAPH=1 THEN
  OPEN O_CURSOR FOR 
    SELECT DMPM_PARAM_ID,PARAM_NAME,PARAM_DESC 
    FROM db_mon_param_mstr 
    WHERE  DMPM_PAR_PARAM_ID is null;
     
  END IF;

        
    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
      END PROC_GET_PARAM_DETAIL;
      
Procedure PROC_GET_DETAIL_REPORT(N_PARAM_ID IN NUMBER,start_time IN VARCHAR2, end_time IN VARCHAR2,O_CURSOR OUT pkg_db_mon.T_CURSOR) is
 
  cursor c_main is
   SELECT DMPM_PARAM_ID AS PARAM_ID FROM DB_MON_PARAM_MSTR WHERE DMPM_PAR_PARAM_ID IS NULL AND DMPM_PARAM_ID=N_PARAM_ID;

      cursor c_sub(PARAM_ID number) is
  SELECT DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR
     WHERE DMPM_PAR_PARAM_ID=PARAM_ID
     ORDER BY DMPM_PARAM_ID;
     
    V_CURSOR     snap_disp_obj;
    V_SEL_CLAUSE VARCHAR2(500);
    V_COL_CLAUSE VARCHAR2(200);
    V_TABLE_NAME VARCHAR2(40);

    snap_disp_typ  snap_disp_obj;
    snap_disp_typ1 snap_disp_obj;

    i              number;
    i_count        number := 0;
    t_count        number := 0;
    V_COUNT        number;
    V_GROUP        number :=0;

  BEGIN
         V_PROC_NAME    := 'PROC_GET_DETAIL_REPORT';
         V_LOCATION     := 'CODE BEGINS';      
      
    snap_disp_typ1 := snap_disp_obj();
    V_CURSOR       := snap_disp_obj(); --initialize cursor

 /*Block Inserted to find maximum count*/
FOR c1_rec IN c_main LOOP -- for each main parameter id
  
                    SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = c1_rec.PARAM_ID;
                     
                 V_SEL_CLAUSE := 'select count(1)  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time between   TO_DATE( '''||start_time||''' ,''DD-MM-YYYY HH24:MI:SS'') and  TO_DATE('''||end_time||''',''DD-MM-YYYY HH24:MI:SS'')' ;

                    execute immediate V_SEL_CLAUSE INTO V_COUNT;
                    --dbms_output.put_line(V_COUNT);
                    IF V_COUNT>V_GROUP THEN
                      V_GROUP:=V_COUNT;
                      END IF;
  
END LOOP;

V_GROUP:=CEIL(V_GROUP/100);  --  FIXING THE NUMBER OF INTERVALS
                     
                     /*Block ends*/


    FOR c1_rec IN c_main LOOP -- for each main parameter id
     FOR c2_rec in  c_sub(c1_rec.param_id) LOOP -- for each sub parameter id
                  BEGIN

                    SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = c1_rec.PARAM_ID;
                     
                    SELECT EXPRESSION_1,BASELINE_VAL
                      INTO V_COL_CLAUSE,V_BASELINE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID = c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                  BEGIN
                  --get the values currently
                    V_SEL_CLAUSE := 'select snap_disp(' || c2_rec.DMPM_PARAM_ID ||
                                    ',SNAP_TIME,' || V_COL_CLAUSE || '/'|| V_BASELINE ||'*100)  from ' ||
                                    V_TABLE_NAME ||
                                    ' where ' || V_COL_CLAUSE || ' is not null  and snap_time between   TO_DATE( '''||start_time||''' ,''DD-MM-YYYY HH24:MI:SS'') and  TO_DATE('''||end_time||''',''DD-MM-YYYY HH24:MI:SS'')' ;

                  --dbms_output.put_line(V_SEL_CLAUSE);

                    execute immediate V_SEL_CLAUSE bulk collect
                      into snap_disp_typ; -- USING IN_TIME_DATE ;

                  EXCEPTION
                    WHEN OTHERS THEN
                      V_SEL_CLAUSE := 'SELECT snap_disp(' || c1_rec.PARAM_ID ||
                                      ',sysdate,''NOT AVAILABLE'')  FROM DUAL';
                      execute immediate V_SEL_CLAUSE bulk collect
                        into snap_disp_typ;
                  END;

                  --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || snap_disp_typ.count);
                  FOR indx IN 1 .. snap_disp_typ.COUNT LOOP

                    snap_disp_typ1.extend();
                    snap_disp_typ1(indx + t_count) := snap_disp_typ(indx);

                    i_count := i_count + 1;
                  END LOOP;
                  t_count := i_count;
           END LOOP;


    END LOOP;
    --ending the main cursor for loop
    --DBMS_OUTPUT.put_line('Dynamic EXECUTE count: ' || snap_disp_typ1.count);
  i:=snap_disp_typ1.first;
          WHILE i IS NOT NULL LOOP
        /* dbms_output.put_line('VALUE FOR :' ||snap_disp_typ1(i).param_id||':'|| snap_disp_typ1(i)
                                         .snap_value);*/
            V_CURSOR.extend();
            V_CURSOR(i) := snap_disp_typ1(i);
            i := snap_disp_typ1.NEXT(i); -- get subscript of next element
          END LOOP;

    --DBMS_OUTPUT.put_line('Dynamic EXECUTE: ' || V_CURSOR.count);
   
    OPEN O_CURSOR FOR
             SELECT TO_CHAR(SNAP_TIME,'DD/MM/YYYY HH:MI:SS AM') "SNAP_TIME",ROUND(VALUE,3),SNAP_TIME "SNAP_TIME2" FROM (
             SELECT PARAM_ID,GR_P,(((MAX(SNAP_TIME)-MIN(SNAP_TIME))/2)+MIN(SNAP_TIME)) SNAP_TIME,AVG(nvl(VALUE,0)) as VALUE FROM (
       SELECT d.dmpm_par_param_id as PARAM_ID,PKG_DB_MON.FN_CEIL(rownum,V_GROUP) as GR_P,snap_time, c.snap_value*e.weight as VALUE
      FROM TABLE(V_CURSOR) c,db_mon_param_mstr d,db_mon_weightage e
      where c.param_id=d.dmpm_param_id
      and d.dmpm_param_id=e.dmpm_param_id
      and e.type='G'
      order by snap_time)
       group by PARAM_ID,GR_P)order by SNAP_TIME2 asc;
        
    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
      END PROC_GET_DETAIL_REPORT;

Procedure PROC_GET_CHILD(PARAM_ID IN NUMBER,O_CURSOR OUT pkg_db_mon.T_CURSOR) is      
     BEGIN
     OPEN O_CURSOR FOR 
  SELECT c.DMPM_PARAM_ID,c.param_name,d.baseline_val
     FROM DB_MON_PARAM_MSTR c,db_mon_weightage e,db_mon_pram_col_mstr d
      WHERE DMPM_PAR_PARAM_ID=PARAM_ID
      and c.DMPM_PARAM_ID=e.dmpm_param_id
      and d.dmpm_param_id=e.dmpm_param_id
      and e.type='G'
     ORDER BY DMPM_PARAM_ID;
     
        EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
END PROC_GET_CHILD;
   
Procedure PROC_SET_THRESHOLD(PARAM_ID IN NUMBER,T1 IN NUMBER,T2 IN NUMBER,V_SUCCESS OUT VARCHAR2)is 
     
V_COUNT NUMBER;
 BEGIN
         V_PROC_NAME    := 'PROC_SET_THRESHOLD';
         V_LOCATION     := 'CODE BEGINS';      
   /*Check if DATA is already available*/  
     SELECT COUNT(1)
     INTO V_COUNT 
     FROM DB_MON_THRESHOLD 
     WHERE DMPM_PAR_PARAM_ID = PARAM_ID;
   
   IF V_COUNT =1 THEN
   /*Run the update*/           
    UPDATE DB_MON_THRESHOLD
    SET THRESHOLD_LVL1=T1,THRESHOLD_LVL2=T2
    WHERE DMPM_PAR_PARAM_ID = PARAM_ID;
   ELSIF V_COUNT >1 THEN
   V_SUCCESS:='FAIL TO MANY VALUES'; 
   ELSE 
     INSERT INTO DB_MON_THRESHOLD(dmpm_par_param_id,threshold_lvl1,threshold_lvl2) VALUES(PARAM_ID,T1,T2);
    END IF;
    
     COMMIT;
     V_SUCCESS:='TRUE';
        EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_SUCCESS:='FAIL';
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_SET_THRESHOLD;


   
Procedure PROC_SET_BASELINE(C_PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2) is 
     
     
V_CURRENT NUMBER;
 BEGIN
         V_PROC_NAME    := 'PROC_SET_BASELINE';
         V_LOCATION     := 'CODE BEGINS';  
            
            BEGIN

                     SELECT b.PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR a,DB_MON_PARAM_MSTR b
                      WHERE a.DMPM_PAR_PARAM_ID=b.DMPM_PARAM_ID(+)
                      AND a.DMPM_PARAM_ID=C_PARAM_ID;

                    SELECT EXPRESSION_1
                      INTO V_COL_CLAUSE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID = C_PARAM_ID;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                
                  --get the values currently
                    V_SEL_CLAUSE := 'select ' || V_COL_CLAUSE || '  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time = (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || '  )';

                  dbms_output.put_line(V_SEL_CLAUSE);

                    execute immediate V_SEL_CLAUSE
                      into V_CURRENT;
                      
                      
       update db_mon_pram_col_mstr set baseline_val=V_CURRENT where DMPM_PARAM_ID= C_PARAM_ID;
                    
                 
    
     COMMIT;
     V_SUCCESS:=TO_CHAR(V_CURRENT);
     EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_SUCCESS:='FAIL';
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
 END PROC_SET_BASELINE;
 
 Procedure PROC_SET_BASELINE_ALL(PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2) is 
        cursor c_sub is
  SELECT c.DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR c,db_mon_weightage e
      WHERE DMPM_PAR_PARAM_ID=PARAM_ID
      and c.DMPM_PARAM_ID=e.dmpm_param_id
      and e.type='G'
     ORDER BY DMPM_PARAM_ID;   
     
V_CURRENT NUMBER;
 BEGIN
         V_PROC_NAME    := 'PROC_SET_BASELINE';
         V_LOCATION     := 'CODE BEGINS';  
            
           
             
 FOR c2_rec in  c_sub LOOP
                  BEGIN              
                  SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = PARAM_ID;

                    SELECT EXPRESSION_1
                      INTO V_COL_CLAUSE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID =  c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                
                  --get the values currently
                    V_SEL_CLAUSE := 'select ' || V_COL_CLAUSE || '  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time = (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || '  )';

                  dbms_output.put_line(V_SEL_CLAUSE);

                    execute immediate V_SEL_CLAUSE
                      into V_CURRENT;
                      
                      
       update db_mon_pram_col_mstr set baseline_val=V_CURRENT where DMPM_PARAM_ID=c2_rec.dmpm_param_id;
                    
         END LOOP;          
    
     COMMIT;
     V_SUCCESS:=TO_CHAR(V_CURRENT);
     EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_SUCCESS:='FAIL';
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
      
 END PROC_SET_BASELINE_ALL;
 
Procedure PROC_RESET_BASELINE(C_PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2) is 
 BEGIN
         V_PROC_NAME    := 'PROC_SET_BASELINE';
         V_LOCATION     := 'CODE BEGINS';  
        
                      
                      
       update db_mon_pram_col_mstr set baseline_val=1 where DMPM_PARAM_ID= C_PARAM_ID;

     COMMIT;
     V_SUCCESS:='RESET';
     EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_SUCCESS:='FAIL';
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
 END PROC_RESET_BASELINE;

 Procedure PROC_RESET_BASELINE_ALL(PARAM_ID IN NUMBER,V_SUCCESS OUT VARCHAR2) is   
    cursor c_sub is
  SELECT c.DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR c,db_mon_weightage e
      WHERE DMPM_PAR_PARAM_ID=PARAM_ID
      and c.DMPM_PARAM_ID=e.dmpm_param_id
      and e.type='G'
     ORDER BY DMPM_PARAM_ID;   
     
V_CURRENT NUMBER;
 BEGIN
         V_PROC_NAME    := 'PROC_SET_BASELINE';
         V_LOCATION     := 'CODE BEGINS';  
            
           
             
 FOR c2_rec in  c_sub LOOP
                  BEGIN              
                  SELECT PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR
                     WHERE DMPM_PARAM_ID = PARAM_ID;

                    SELECT EXPRESSION_1
                      INTO V_COL_CLAUSE
                      FROM DB_MON_PRAM_COL_MSTR
                     WHERE DMPM_PARAM_ID =  c2_rec.dmpm_param_id;

                  EXCEPTION
                    WHEN NO_DATA_FOUND THEN
                      NULL;
                  END;

                  --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
                
                  --get the values currently
                    V_SEL_CLAUSE := 'select ' || V_COL_CLAUSE || '  from ' ||
                                    V_TABLE_NAME ||
                                    ' where snap_time = (select max(snap_time) from  ' ||
                                    V_TABLE_NAME || '  )';

                  dbms_output.put_line(V_SEL_CLAUSE);

                    execute immediate V_SEL_CLAUSE
                      into V_CURRENT;
                      
                      
       update db_mon_pram_col_mstr set baseline_val=1 where DMPM_PARAM_ID=c2_rec.dmpm_param_id;
                    
         END LOOP; 
     COMMIT;
     V_SUCCESS:='RESET';
     EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_SUCCESS:='FAIL';
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
 END PROC_RESET_BASELINE_ALL;
   
   
Procedure GET_AWR_TASK_REPORT(start_time IN VARCHAR2, end_time IN VARCHAR2, V_CLOB OUT CLOB )
  IS
  begin_snap NUMBER;
  end_snap NUMBER;
  tid NUMBER; -- Task ID
  tname VARCHAR2(30); -- Task Name
  tdesc VARCHAR2(256); -- Task Description
  --17-03-2012 11:00:00 


        BEGIN
             V_PROC_NAME    := 'GET_AWR_TASK_REPORT';
            V_LOCATION     := 'CODE BEGINS';
        -- Find the snapshot IDs corresponding to the given input parameters.
        SELECT max(snap_id)INTO begin_snap
        FROM DBA_HIST_SNAPSHOT
        WHERE trunc(end_interval_time, 'MI') <= TO_DATE(start_time,'DD-MM-YYYY HH24:MI:SS');
        SELECT min(snap_id) INTO end_snap
        FROM DBA_HIST_SNAPSHOT
        WHERE end_interval_time >= TO_DATE(end_time,'DD-MM-YYYY HH24:MI:SS');
        --
        -- set Task Name (tname) to NULL and let create_task return a
        -- unique name for the task.
        tname := '';
        tdesc := 'run_addm( ' || begin_snap || ', ' || end_snap || ' )';
        --
        -- Create a task, set task parameters and execute it
        DBMS_ADVISOR.CREATE_TASK( 'ADDM', tid, tname, tdesc );
        DBMS_ADVISOR.SET_TASK_PARAMETER( tname, 'START_SNAPSHOT', begin_snap );
        DBMS_ADVISOR.SET_TASK_PARAMETER( tname, 'END_SNAPSHOT' , end_snap );
        DBMS_ADVISOR.EXECUTE_TASK( tname );
        DBMS_OUTPUT.PUT_LINE(tname);


        SELECT DBMS_ADVISOR.get_task_report(tname,'text','ALL') AS report INTO V_CLOB FROM   dual;
  EXCEPTION
       WHEN OTHERS THEN
        --Capture the error and return failed
        ROLLBACK;
        V_ERRM := SQLERRM;
        V_CLOB:='EXCEPTION OCCURED! PLEASE RECHECK THE TIME GIVEN :: ERROR IS:: <br>'||SUBSTR(SQLERRM,12,70);
        
        PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
        COMMIT;

END GET_AWR_TASK_REPORT;

Procedure GET_HELP_LIST(O_CURSOR OUT pkg_db_mon.T_CURSOR )
  IS
  
        BEGIN
            V_PROC_NAME    := 'GET_HELP_LIST';
            V_LOCATION     := 'CODE BEGINS';
        -- Retrieve the help and display.
        OPEN O_CURSOR FOR 
       SELECT HELP_ID, HELP_PARENT FROM   DB_MON_HELP;
  EXCEPTION
       WHEN OTHERS THEN
        --Capture the error and return failed
        ROLLBACK;
        V_ERRM := SQLERRM;
        PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
        COMMIT;

END GET_HELP_LIST;

Procedure GET_HELP(ID IN NUMBER,V_NAME OUT VARCHAR2,V_CLOB OUT CLOB )
  IS
  
        BEGIN
            V_PROC_NAME    := 'GET_HELP';
            V_LOCATION     := 'CODE BEGINS';
        -- Retrieve the help and display.
       SELECT HELP_PARENT, HELP_CHILD_DETAIL INTO V_NAME,V_CLOB FROM   DB_MON_HELP WHERE HELP_ID=ID;
  EXCEPTION
       WHEN OTHERS THEN
        --Capture the error and return failed
        ROLLBACK;
        V_ERRM := SQLERRM;
        V_CLOB:='EXCEPTION OCCURED!';
        
        PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
        COMMIT;

END GET_HELP;

PROCEDURE GET_OUTSTANDING_ALERTS(O_CURSOR OUT pkg_db_mon.T_CURSOR)
  IS
  V_COUNT NUMBER;
BEGIN
  
         V_PROC_NAME    := 'GET_OUTSTANDING_ALERTS';
         V_LOCATION     := 'CODE BEGINS'; 

SELECT count(1)
INTO V_COUNT
from
DBA_OUTSTANDING_ALERTS;

IF V_COUNT > 0
  THEN
  OPEN O_CURSOR FOR
  select SEQUENCE_ID,REASON,SUGGESTED_ACTION,MESSAGE_TYPE,CREATION_TIME from DBA_OUTSTANDING_ALERTS;
  
ELSE
  OPEN O_CURSOR FOR
  select 0 as SEQUENCE_ID,'NO ALERTS' as REASON,'SUGGESTED_ACTION' as SUGGESTED_ACTION,'MESSAGE_TYPE' as MESSAGE_TYPE,SYSDATE as CREATION_TIME from DUAL;
END IF;

/* BEGIN
    DBMS_SERVER_ALERT.SET_THRESHOLD(
        metrics_id => DBMS_SERVER_ALERT.OPEN_CURSORS_CURRENT,
        warning_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        warning_value => '10',
        critical_operator => DBMS_SERVER_ALERT.OPERATOR_GE,
        critical_value => '20',
        observation_period => 1,
        consecutive_occurrences => 3,
        instance_name => 'CS5226',
        object_type => DBMS_SERVER_ALERT.OBJECT_TYPE_SYSTEM,
        object_name => NULL
     );
END;*/

  END GET_OUTSTANDING_ALERTS;

  --wrapper procedure to set the scheduler at X and Y intervals
procedure PROC_WR_SCHED_INITIALIZE(X IN NUMBER, Y IN NUMBER,Z IN NUMBER) IS
    V_PROGRAM_NAME VARCHAR2(200);
    V_PROGRAM_ID   NUMBER;
    SCHEDULER_EXIST EXCEPTION;
    PROGRAM_EXISTS EXCEPTION;
    JOB_EXISTS EXCEPTION;

    TIME_INTERVAL NUMBER;

    V_CAL_SYNTAX VARCHAR2(300);

    PRAGMA EXCEPTION_INIT(SCHEDULER_EXIST, -27477);
    PRAGMA EXCEPTION_INIT(JOB_EXISTS, -27477);
    PRAGMA EXCEPTION_INIT(PROGRAM_EXISTS, -27477);

    cursor c1 is
      SELECT DMPM_PARAM_ID, PARAM_NAME FROM DB_MON_PARAM_MSTR WHERE PARAM_TABLE_NAME IS NOT NULL;
  BEGIN
    V_PROC_NAME := 'PROC_WR_SCHED_INITIALIZE';
    V_LOCATION  := 'Proc Begins';
    --update previous Y value to N
    update db_mon_xy_stat set active = 'N' where active = 'Y';
    -- insert the new X and Y values
    insert into db_mon_xy_stat
      (change_date, x_val, y_val, active,z_val)
    values
      (sysdate, X, Y, 'Y',Z);

    -- checking whether data has to be in minutes or seconds Y is always in seconds
    IF ROUND(Z / 60) >= 1 THEN
      TIME_INTERVAL := round(Z / 60); --convert into minutes
      V_CAL_SYNTAX  := 'freq=minutely; interval=' || TIME_INTERVAL || ';';
    ELSE
      TIME_INTERVAL := Z;
      V_CAL_SYNTAX  := 'freq=secondly; interval=' || TIME_INTERVAL || ';';
    END IF;
    --CREATE A SCHEDULE AS PER Y MINUTES
    BEGIN
      DBMS_SCHEDULER.create_schedule(schedule_name   => 'MONITOR_SCHEDULE',
                                     start_date      => SYSTIMESTAMP,
                                     repeat_interval => V_CAL_SYNTAX,
                                     end_date        => NULL,
                                     comments        => 'Repeats secondly every Z second, for ever.');
    EXCEPTION
      WHEN SCHEDULER_EXIST THEN
        --BEGIN - for awr change
        --DBMS_WORKLOAD_REPOSITORY.MODIFY_SNAPSHOT_SETTINGS(
        --retention => 43200,
        --interval  => 10);
        --END;
        -- change the schedule to reflect the new schedule
        DBMS_SCHEDULER.SET_ATTRIBUTE(name      => 'MONITOR_SCHEDULE',
                                     attribute => 'repeat_interval',
                                     value     => V_CAL_SYNTAX);

    END;
    -- OPEN THE CURSOR AND CREATE THE JOBS

    OPEN c1;
    LOOP
      FETCH c1
        INTO V_PROGRAM_ID, V_PROGRAM_NAME;
         EXIT WHEN c1%NOTFOUND;
      BEGIN
        dbms_output.put_line(V_PROGRAM_NAME);
        DBMS_SCHEDULER.create_program(program_name        => V_PROGRAM_NAME,
                                      program_type        => 'STORED_PROCEDURE',
                                      program_action      => 'PKG_DB_MON.PROC_READ_DMQM',
                                      number_of_arguments => 2,
                                      enabled             => FALSE,
                                      comments            => 'Program to gather CS5226''s statistics using a stored procedure.');

        DBMS_SCHEDULER.define_program_argument(program_name      => V_PROGRAM_NAME,
                                               argument_name     => 'param_id',
                                               argument_position => 1,
                                               argument_type     => 'NUMBER',
                                               default_value     => V_PROGRAM_ID);

        DBMS_SCHEDULER.define_program_argument(program_name      => V_PROGRAM_NAME,
                                               argument_name     => 'SUCCESS_FLAG',
                                               argument_position => 2,
                                               argument_type     => 'VARCHAR2',
                                               default_value     => V_PROGRAM_ID);

        DBMS_SCHEDULER.enable(name => V_PROGRAM_NAME);

      EXCEPTION
        WHEN PROGRAM_EXISTS THEN
          -- in case we are reinitializing
          NULL;

      END;

      BEGIN
        /*Dropping the job and then creating again as sometimes the job gets errored out*/
      
      BEGIN
      DBMS_SCHEDULER.drop_job(job_name      => V_PROGRAM_NAME || '_JOB',force => TRUE);
      EXCEPTION
        WHEN OTHERS THEN
          NULL;
      END;
  
      DBMS_SCHEDULER.create_job(job_name      => V_PROGRAM_NAME || '_JOB',
                                  program_name  => V_PROGRAM_NAME,
                                  schedule_name => 'MONITOR_SCHEDULE',
                                  enabled       => TRUE,
                                  comments      => 'Job for a given parameter program and schedule.');
      EXCEPTION
        WHEN JOB_EXISTS THEN
          NULL;
      END;


    END LOOP;
    CLOSE c1;

    COMMIT;

  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
  END PROC_WR_SCHED_INITIALIZE;



  -- Procedure to select the data into variables using the concept of dynamic sql
  /* Realized at 2pm on  feb 6th that we have to add columns also as dynamic string*/
procedure PROC_READ_DMQM(PARAM_ID IN NUMBER, SUCCESS_FLAG OUT VARCHAR2) IS
    v_sql        varchar2(4000);
    v_no_of_cols NUMBER;

    column_val_dat    column_val;
    cursor_handle     INT;
    v_rows            INT;
    V_Q_COUNT         NUMBER;
    V_POSITION        NUMBER := 1;
    v_no_of_cols_prev NUMBER := 0;
    k                 NUMBER;
    di_date           DATE;
    v_sql2            varchar2(200);

  cursor c1 is
  SELECT DMPM_PARAM_ID
     FROM DB_MON_PARAM_MSTR
     WHERE DMPM_PAR_PARAM_ID=PARAM_ID
     ORDER BY DMPM_PARAM_ID;

  BEGIN

    v_sql2 := 'alter session set nls_date_format=''DD/MM/YYYY HH24:MI:SS''';

    execute immediate v_sql2;

    di_date := sysdate;

    dbms_output.put_line(di_date);
    V_PROC_NAME := 'PROC_READ_DMQM';
    V_LOCATION  := V_PROC_NAME || 'BEGINS';

    --initialize the array
    column_val_dat := column_val();


  FOR M in c1 loop

  /* for each id in the parent id run cursor */

    SELECT COUNT(1)
      INTO V_Q_COUNT
      FROM DB_MON_QUERY_MSTR
     WHERE DMPM_PARAM_ID =M.DMPM_PARAM_ID;


    FOR J in 1 .. V_Q_COUNT LOOP

      --get the first query execute and store data in array
      SELECT DMQM_QUERY, NO_OF_COLS
        INTO v_sql, v_no_of_cols
        FROM DB_MON_QUERY_MSTR
       WHERE DMPM_PARAM_ID = M.DMPM_PARAM_ID
         AND DMQM_SEQ = J;
    dbms_output.put_line(v_sql);
      -- extension of array
      column_val_dat.extend(v_no_of_cols);

      V_LOCATION := V_PROC_NAME || 'CURSOR OPEN';

      cursor_handle := DBMS_SQL.OPEN_CURSOR; -- open cursor
      DBMS_SQL.PARSE(cursor_handle, v_sql, DBMS_SQL.NATIVE);

      --intialize the column scripts
      k := 1;
      for i in V_POSITION .. v_no_of_cols + v_no_of_cols_prev loop

        -- Describe defines for each column as for us the number of columns is not defined.
        DBMS_SQL.DEFINE_COLUMN(cursor_handle, k, column_val_dat(i), 200);
        k := k + 1;
      end loop;

      V_LOCATION := V_PROC_NAME || 'CURSOR EXECUTE';
      v_rows     := DBMS_SQL.EXECUTE(cursor_handle);

      LOOP
        -- Fetch a row
        IF DBMS_SQL.FETCH_ROWS(cursor_handle) > 0 THEN
          -- Fetch columns from the row
          k := 1;
          for i in V_POSITION .. v_no_of_cols + v_no_of_cols_prev loop
            DBMS_SQL.COLUMN_VALUE(cursor_handle, k, column_val_dat(i));
            dbms_output.put_line(i||'inloopvalue'||column_val_dat(i));
            k := k + 1;
          end loop;
        ELSE
          EXIT;
        END IF;

      END LOOP;
      V_POSITION        := V_POSITION + v_no_of_cols; -- increment the counter
      v_no_of_cols_prev := v_no_of_cols;
      V_LOCATION        := V_PROC_NAME || 'LOOP END';
      DBMS_SQL.CLOSE_CURSOR(cursor_handle);

    END LOOP;
   -- V_POSITION := 1;
   v_no_of_cols_prev := V_POSITION-1;
   END LOOP;-- end the cursor for loop

    V_LOCATION := V_PROC_NAME || 'OUTER LOOP END';

   FOR i in column_val_dat.first .. column_val_dat.last LOOP

      --V_SQL_VAL := V_SQL_VAL || column_val_dat(i) || ',';
      dbms_output.put_line(i||'b4value'||column_val_dat(i));
    END LOOP;

    PROC_INSERT_SNAPSHOT(PARAM_ID, column_val_dat, di_date, SUCCESS_FLAG);
    SUCCESS_FLAG := 'TRUE';
  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(V_ERRM, V_LOCATION);
      COMMIT;
      SUCCESS_FLAG := 'FALSE';
  end PROC_READ_DMQM;

   --procedure to insert data into the snapshot tables given the param id and array
procedure PROC_INSERT_SNAPSHOT(PARAM_ID       IN NUMBER,
                             column_val_dat in column_val,
                             di_date        in date,
                             SUCCESS_FLAG   OUT VARCHAR2) IS
    V_COUNT      NUMBER;
    V_SQL        VARCHAR2(800);
    V_SQL_VAL    VARCHAR2(500);
    V_TABLE_NAME VARCHAR2(50);
    V_COL_COUNT  NUMBER;
  BEGIN
    V_PROC_NAME := 'PROC_INSERT_DMQM';
    V_LOCATION  := 'CODE BEGINS';

    SELECT PARAM_TABLE_NAME
      INTO V_TABLE_NAME
      FROM DB_MON_PARAM_MSTR
     WHERE DMPM_PARAM_ID = PARAM_ID;

    SELECT COUNT(1)
      INTO V_COL_COUNT
      FROM ALL_TAB_COLS
     WHERE TABLE_NAME = V_TABLE_NAME;

    V_COUNT :=  column_val_dat.last;
    V_SQL   := 'INSERT INTO ' || V_TABLE_NAME ||
               ' VALUES(SNAP_ID.nextval,''' ||
               to_date(to_char(di_date, 'DD/MM/YYYY HH24:MI:SS'),
                       'DD/MM/YYYY HH24:MI:SS') || ''',';
    FOR i in column_val_dat.first .. column_val_dat.last LOOP

      V_SQL_VAL := V_SQL_VAL || column_val_dat(i) || ',';
      dbms_output.put_line(i||'value'||column_val_dat(i));
    END LOOP;

    --need to add nulls at end for this compute no of cols - no of cols used add that many nulls
    for i in 1 .. V_COL_COUNT - (V_COUNT + 2) LOOP
      --  here 2 is added for snap id and snap time

      V_SQL_VAL := V_SQL_VAL || 'null' || ',';

    end loop;

    V_SQL_VAL := rtrim(V_SQL_VAL, ',');
    V_SQL     := V_SQL || V_SQL_VAL || ')';

    dbms_output.put_line('The count of array is:' || V_COUNT);
    dbms_output.put_line(V_SQL);

    execute immediate V_SQL;
    commit;

    SUCCESS_FLAG := 'TRUE';
  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      SUCCESS_FLAG := 'FALSE';
      COMMIT;
  END PROC_INSERT_SNAPSHOT;

  -- Procedure to insert data into the query table
  procedure PROC_INSERT_DMQM(PARAM_ID     IN NUMBER,
                             QUERY_TEXT   IN CLOB,
                             SUCCESS_FLAG OUT VARCHAR2) IS

  BEGIN

    V_LOCATION := 'CODE BEGINS';

    INSERT INTO DB_MON_QUERY_MSTR
      (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY)
    VALUES
      (PARAM_ID, SQ_DMQM_SEQ.NEXTVAL, QUERY_TEXT);
    COMMIT;
    SUCCESS_FLAG := 'TRUE';
  EXCEPTION
    WHEN OTHERS THEN
      --Capture the error and return failed
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      SUCCESS_FLAG := 'FALSE';
  END;

  --procedure to capture the error in a package
  procedure PROC_ERROR_CAPTURE(V_ERROR_TEXT IN VARCHAR2,
                               V_LOCATION   IN VARCHAR2) IS
  BEGIN

    INSERT INTO DB_MON_ERROR_CAPTURE
      (ERROR_TEXT, LOCATION, ETIME)
    VALUES
      (V_ERROR_TEXT, V_LOCATION, sysdate);

    dbms_output.put_line(V_ERROR_TEXT);

  END;
 procedure PROC_CREATE_TABLES_TO_BE(V_TABLE_NAME IN VARCHAR2,V_FLAG OUT VARCHAR2) is
  V_SQL VARCHAR2(4000);
   BEGIN
    V_PROC_NAME    := 'PROC_CREATE_TABLES_TO_BE';
    V_LOCATION     := 'CODE BEGINS';

   V_SQL :='create table '||V_TABLE_NAME
||'(
  snap_id    NUMBER not null primary key,
  snap_time  DATE not null unique,
  snap_val_1 VARCHAR2(300),
  snap_val_2 VARCHAR2(300),
  snap_val_3 VARCHAR2(300),
  snap_val_4 VARCHAR2(300),
  snap_val_5 VARCHAR2(300),
  snap_val_6 VARCHAR2(300),
  snap_val_7 VARCHAR2(300),
  snap_val_8 VARCHAR2(300),
  snap_val_9 VARCHAR2(300),
  snap_val_10 VARCHAR2(300),
  snap_val_11 VARCHAR2(300),
  snap_val_12 VARCHAR2(300),
  snap_val_13 VARCHAR2(300),
  snap_val_14 VARCHAR2(300),
  snap_val_15 VARCHAR2(300),
  snap_val_16 VARCHAR2(300),
  snap_val_17 VARCHAR2(300),
  snap_val_18 VARCHAR2(300),
  snap_val_19 VARCHAR2(300),
  snap_val_20 VARCHAR2(300)

)';

    execute immediate V_SQL;
V_FLAG:= 'SUCCESS';

    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      V_FLAG := 'FAILED TO CREATE PLEASE CHECK!';
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_CREATE_TABLES_TO_BE;


procedure PROC_RET_TABLES_TO_BE(O_CURSOR OUT pkg_db_mon.T_CURSOR) is
   BEGIN
    V_PROC_NAME    := 'PROC_RET_TABLES_TO_BE';
    V_LOCATION     := 'CODE BEGINS';

OPEN O_CURSOR FOR
select DISTINCT a.PARAM_TABLE_NAME
from DB_MON_PARAM_MSTR a
WHERE not exists (select b.table_name from user_tables b where a.param_table_name=b.table_name )
AND a.PARAM_TABLE_NAME is not null;



    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;

      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_RET_TABLES_TO_BE;

procedure PROC_EXEC_DEBUGGER(V_DEBUG_SQL IN OUT NOCOPY CLOB,O_CURSOR OUT pkg_db_mon.T_CURSOR,V_COUNT_TEXT OUT VARCHAR2) is

   V_SQL       VARCHAR2(4000);
   V_TYPE      VARCHAR2(300);
  --V_COUNT_TEXT varchar2(200);
   BEGIN
    V_PROC_NAME    := 'PROC_EXEC_DEBUGGER';
    V_LOCATION     := 'CODE BEGINS';

V_SQL:=dbms_lob.substr(V_DEBUG_SQL,4000,1);
select case when instr(upper(V_SQL),'INSERT')>=1 then 'INSERT'
            when instr(upper(V_SQL),'UPDATE')>=1 then 'UPDATE'
              else 'SELECT' end case
                INTO V_TYPE from dual;

IF V_TYPE IN('INSERT','UPDATE')
   THEN
     execute immediate V_SQL;
     V_COUNT_TEXT:=TO_CHAR(SQL%ROWCOUNT)||' row(s) affected';
     commit;

     --V_COUNT_TEXT:=TO_CHAR(SQL%ROWCOUNT)||' no of rows affected';
     OPEN O_CURSOR FOR SELECT 'INSERT/UPDATE' "OPERATION" FROM DUAL;

     ELSE
       OPEN O_CURSOR FOR V_SQL;
V_COUNT_TEXT:=NULL;
     END IF;


--dbms_output.put_line(V_SQL);
--dbms_output.put_line(V_COUNT_TEXT);

   EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      V_COUNT_TEXT := V_ERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_EXEC_DEBUGGER;

Procedure PROC_ANALYZE_SCHEMA(V_SCHEMA_NAME IN VARCHAR2,V_OUT OUT VARCHAR2) IS
  BEGIN
    DBMS_UTILITY.analyze_schema(upper(V_SCHEMA_NAME),'COMPUTE');
    V_OUT:='ANALYZED';
    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
    V_OUT:='ANALYZE FAILED';
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
   END PROC_ANALYZE_SCHEMA;

Procedure PROC_VALIDATE_LOGIN(UNAME IN VARCHAR2,PWD IN VARCHAR2,V_FLAG OUT VARCHAR2) is
        
          BEGIN
         V_PROC_NAME    := 'PROC_VALIDATE_LOGIN';
         V_LOCATION     := 'CODE BEGINS';           
       
    SELECT CASE WHEN count(1)=1 THEN 'OK' ELSE 'FAILED' END  
    INTO V_FLAG
    FROM LOGIN_MASTER
    WHERE USERNAME=replace(UNAME,'||') AND PD=replace(PWD,'||');
    
    EXCEPTION
     WHEN OTHERS THEN
      --Capture the error and return failed
      ROLLBACK;
      V_ERRM := SQLERRM;
      PROC_ERROR_CAPTURE(SQLERRM, V_LOCATION);
      COMMIT;
      END PROC_VALIDATE_LOGIN;
      
      
Function FN_CEIL(NDATA IN NUMBER,NPREC IN NUMBER)RETURN NUMBER is
  BEGIN
    
    RETURN CEIL(NDATA/NPREC)*NPREC;
 
    END FN_CEIL;
    
Function FN_ABV_THRESHOLD(C_PARAM_ID IN NUMBER)RETURN NUMBER is
  R_PARAM_ID NUMBER;
  V_TYPE VARCHAR2(20);
BEGIN
                          
                      BEGIN

         
                      SELECT b.PARAM_TABLE_NAME
                      INTO V_TABLE_NAME
                      FROM DB_MON_PARAM_MSTR a,DB_MON_PARAM_MSTR b
                      WHERE a.DMPM_PAR_PARAM_ID=b.DMPM_PARAM_ID(+)
                      AND a.DMPM_PARAM_ID=C_PARAM_ID;

                      SELECT EXPRESSION_1,BASELINE_VAL
                      INTO V_COL_CLAUSE,V_BASELINE
                      FROM DB_MON_PRAM_COL_MSTR
                      WHERE DMPM_PARAM_ID = C_PARAM_ID;
                      
                      select TYPE INTO V_TYPE from db_mon_weightage
                      WHERE DMPM_PARAM_ID = C_PARAM_ID;

                      EXCEPTION
                      WHEN NO_DATA_FOUND THEN
                      NULL;
                      END;

                      --IN_TIME_DATE:=to_date(IN_TIME,'DD/MM/YYYY HH24:MI:SS');
               
                      --get the values currently
                      IF V_TYPE = 'L' THEN 
                      V_SEL_CLAUSE := 'select nvl(' || C_PARAM_ID || ',1)  from ' ||
                      V_TABLE_NAME ||
                      ' A,DB_MON_PARAM_MSTR B,DB_MON_THRESHOLD C where snap_time = (select max(snap_time) from  ' ||
                      V_TABLE_NAME || '  )
                      and (' || V_COL_CLAUSE || ')> C.threshold_lvl1 
                      and B.dmpm_par_param_id=C.dmpm_par_param_id
                      and B.dmpm_param_id= ' || C_PARAM_ID || '';
                      ELSE
                         V_SEL_CLAUSE := 'select nvl(' || C_PARAM_ID || ',1)  from ' ||
                      V_TABLE_NAME ||
                      ' A,DB_MON_PARAM_MSTR B,DB_MON_THRESHOLD C where snap_time = (select max(snap_time) from  ' ||
                      V_TABLE_NAME || '  )
                      and ((' || V_COL_CLAUSE || ')/'|| V_BASELINE ||')*100> C.threshold_lvl1 
                      and B.dmpm_par_param_id=C.dmpm_par_param_id
                      and B.dmpm_param_id= ' || C_PARAM_ID || '';
                      END IF;

                      dbms_output.put_line(V_SEL_CLAUSE);

                      execute immediate V_SEL_CLAUSE
                      into R_PARAM_ID;
RETURN R_PARAM_ID;
 EXCEPTION
                      WHEN NO_DATA_FOUND THEN
                       RETURN 1;
    END FN_ABV_THRESHOLD;
   

END PKG_DB_MON;
/

spool off
