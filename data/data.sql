prompt PL/SQL Developer import file
prompt Created on Monday, April 09, 2012 by dias
set feedback off
set define off
prompt Disabling foreign key constraints for DB_MON_PARAM_MSTR...
alter table DB_MON_PARAM_MSTR disable constraint FK_SELF;
prompt Disabling foreign key constraints for DB_MON_PRAM_COL_MSTR...
alter table DB_MON_PRAM_COL_MSTR disable constraint FK_DMPM_PARAM_ID;
prompt Disabling foreign key constraints for DB_MON_PRAM_INIT_REL...
alter table DB_MON_PRAM_INIT_REL disable constraint FK_DMPIR;
prompt Disabling foreign key constraints for DB_MON_QUERY_SNAP_COL...
alter table DB_MON_QUERY_SNAP_COL disable constraint FK_DMPM;
prompt Disabling foreign key constraints for DB_MON_THRESHOLD...
alter table DB_MON_THRESHOLD disable constraint FK_THRESHOLD;
prompt Disabling foreign key constraints for DB_MON_WEIGHTAGE...
alter table DB_MON_WEIGHTAGE disable constraint FK_WEIGHT;
prompt Loading DB_MON_PARAM_MSTR...
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (203, null, 'This is the SQL Area used', 'SQL AREA USAGE', 200);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (403, null, 'Undo Size Monitor', 'UNDO_MONITOR', 400);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (102, null, 'The performance of PGA by measuring cache hit percentage', 'CACHE HIT PERCENTAGE', 100);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (200, 'DB_MON_SHARED_POOL_SNAP', 'This table gives us the snapshot of the shared pools performance', 'SHARED_POOL', null);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (202, null, 'This parameter is a subset of shared pool and gives us the ratio of total cpu used for parsing', 'SHARED_POOL_CPU', 200);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (100, 'DB_MON_PGA_SNAP', 'This table gives us the snapshot of PGA performance', 'MEMORY_FOR_SORT', null);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (101, null, 'This parameter is a subset of the Memory for sort performance and gives an idea about current usage', 'PGA USAGE (%)', 100);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (201, null, 'This parameter is a subset of shared pool and gives us an idea of shared pool memory used', 'SHARED_POOL_USAGE', 200);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (300, 'DB_MON_BUFFER_CACHE', null, 'BUFFER_CACHE', null);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (301, null, null, 'BUFFER_CACHE', 300);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (400, 'DB_MON_ROLLBACK_SEGMENT', null, 'ROLLBACK_SEGMENT', null);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (401, null, 'This gives the Ratio of Header Waits to Number of Bytes written to rollback segment', 'ROLLBACK_WAIT_MONITOR', 400);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (500, 'DB_MON_REDO_BUFF_SNAP', null, 'REDO_LOG_BUFFER', null);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (501, null, 'The Redo Allocation ratio', 'REDO ALLOCATION', 500);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (204, null, 'This is the Hard Parse Ratio', 'HARD PARSE RATIO', 200);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (502, null, 'The Redo Copy ratio', 'REDO COPY', 500);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (503, null, 'Redo Log Space Requests', 'REDO LOG SPACE', 500);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (600, 'DB_MON_IO_SNAP', 'The Table gives us snap values for IO', 'IO_CONTENTION', null);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (601, null, 'This is for checking IO contention', 'IO_HIT_RATE', 600);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (103, null, 'This shows non optimal executions', 'NON-OPTIMAL EXECUTIONS', 100);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (302, null, 'This is the led parameter used to store average wait time', 'Avg Wait Time', 300);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (303, null, 'This is the led parameter that can be used to store the total buffer busy waits', 'Buffer Busy Wait', 300);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (304, null, 'This is the led parameter that can be used to store the number of session', 'No Of Sessions', 300);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (305, null, 'This is the led that gives the info on number of long running queries', 'No Of Long Running', 300);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (402, null, 'This is the led that displays the hit ratio of the rollback segments', 'HIT RATIO ROLLBACK', 400);
insert into DB_MON_PARAM_MSTR (dmpm_param_id, param_table_name, param_desc, param_name, dmpm_par_param_id)
values (205, null, 'Library Cache Hit Ratio', 'LIBRARY HIT RATIO', 200);
commit;
prompt 26 records loaded
prompt Loading DB_MON_HELP...
SET DEFINE OFF;
Insert into DB_MON_HELP
   (HELP_PARENT, HELP_CHILD_DETAIL, HELP_ID)
 Values
   ('ADD MONITOR', '<div>
To create a new Monitor
<ol>
<li>Define the monitor in the parameter table[db_mon_param_mstr].</li>
<li>Define the queries related to the monitor in the query table[db_mon_query_mstr].</li>
<li>Define the expression condition in the column condition definition table[db_mon_pram_col_mstr].</li>
<li>Define the projection of each parameter in the snap column table[db_mon_query_snap_col].</li>
<li>Define the weightage in the weightage definition table[db_mon_weightage].</li>
<li>Define the threshold in the threshold definition table[db_mon_threshold].</li>
<li>Define recommendations in the advice table[db_mon_pram_init_rel].</li>
<li>Create the table using the configuration tab.</li>
<li>Re-enter values in the scheduler configuration tab and click SUBMIT.</li>
</ol>
</div>', 1);
Insert into DB_MON_HELP
   (HELP_PARENT, HELP_CHILD_DETAIL, HELP_ID)
 Values
   ('CHANGE THRESHOLD', '<div>
To Change Threshold
<ol>
<li>Goto the Threshold configuration tab</li>
<li>Change the Threshold 1 and 2 Values</li>
<ol>
</div>', 2);
COMMIT;
prompt Loading DB_MON_QUERY_MSTR...
SET DEFINE OFF;
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (102, 1, 'SELECT (1-(VALUE/100)) "VALUE" FROM V$PGASTAT where name = ''cache hit percentage''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (201, 1, 'select bytes from v$sgastat where name=''free memory'' and pool=''shared pool''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (201, 2, 'select sum(bytes) from v$sgastat where pool=''shared pool''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (101, 1, 'select trunc(avg(value))"curbytes (average)" 
from
(select s.sid,
                                 s2.serial#,
                                 n.name,
                                 s.value,
                                 decode(s2.username,null,s2.program,s2.username) "USERNAME",
                                 s2.logon_time
                          from   v$statname n,
                                 v$sesstat s,
                                 v$session s2
                          where  n.statistic# = s.statistic# and
                                 (s.sid = s2.sid) and
                                 name like ''session%memory'' and
                                 name not like ''session%memory max%''
                                 )
  where name like ''session pga memory%''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (202, 1, 'select round((a.value/b.value),4) CPU_RATIO from v$sysstat a, v$sysstat b where a.name = ''parse time cpu'' and b.name = ''CPU used by this session''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (101, 2, 'select value-(value*.2) "worstbytes (total)" from v$parameter where name = ''pga_aggregate_target''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (301, 1, 'SELECT ROUND((1-(1-(phy.value / (cur.value + con.value))))*100,2) "Cache Hit Ratio"
FROM v$sysstat cur, v$sysstat con, v$sysstat phy
WHERE cur.name = ''db block gets''
AND con.name = ''consistent gets''
AND phy.name = ''physical reads''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (302, 1, 'select  AVERAGE_WAIT/100 
           from
           v$system_event
           where
              event =''buffer busy waits''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (401, 1, 'select  sum(count) from v$WAITSTAT where class in(''undo header'',''undo block'')', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (402, 1, 'select   
  round((sum(waits) / sum(gets)) * 100,10)  
From    v$rollstat', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (501, 1, 'SELECT ((immediate_misses+misses)/(immediate_gets+gets))  FROM v$latch l1, v$latchname l2
 WHERE l2.NAME = ''redo allocation'' AND l1.latch# = l2.latch#', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (502, 1, 'SELECT ((immediate_misses+misses)/(immediate_gets+gets))  FROM v$latch l1, v$latchname l2 WHERE l2.NAME = ''redo copy'' AND l1.latch# = l2.latch#', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (204, 1, 'select ((sum(s.value)/100000)/.7) "HARD PARSE COUNT" from v$sesstat s, v$sesstat t where s.sid=t.sid and s.statistic#=(select statistic#  from v$statname where name=''parse count (hard)'') and t.statistic#=(select statistic# from v$statname where name=''execute count'') and s.value>0', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (503, 1, 'select round((req.value/wrt.value)*100,2)
from v$sysstat req, v$sysstat wrt
where req.name= ''redo log space requests'' 
and wrt.name= ''redo writes''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (601, 1, 'SELECT (1-AVG(ROUND((buffer_gets - disk_reads)
                     / buffer_gets, 2))) hit_ratio
         FROM   v$sqlarea
         WHERE  executions  > 0
         AND    buffer_gets > 0
         AND    (buffer_gets - disk_reads) / buffer_gets < 0.80', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (103, 1, 'select sum(onepass_executions)+sum(multipasses_executions) "NONOPTIMAL_EXECUTIONS" from v$sql_workarea_histogram where onepass_executions > 0 ', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (303, 1, ' select sum(value) "BUFFER BUSY ALL" from  v$segment_statistics where statistic_name=''buffer busy waits''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (304, 1, 'select count(1) from v$session where status=''ACTIVE''', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (305, 1, 'select count(1) from V$SESSION_LONGOPs', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (203, 1, 'select 
 sum(a.sharable_mem)/1024/1024 "total MB used"
 from 
   v$sqlarea a
where 
   a.sharable_mem > 0', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (205, 1, 'select (100- ((sum(pinhits)/sum(pins))*100))/10 from v$librarycache', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (401, 2, 'select sum(value) "Data Requests" from v$SYSSTAT
         where name in (''db block gets'', ''consistent gets'')', 1);
Insert into DB_MON_QUERY_MSTR
   (DMPM_PARAM_ID, DMQM_SEQ, DMQM_QUERY, NO_OF_COLS)
 Values
   (403, 1, 'SELECT ((TO_NUMBER(e.value) * TO_NUMBER(f.value) *g.undo_block_per_sec) / (1024*1024))/(d.undo_size/(1024*1024)) "ratio_needed_actual_undo_size"
FROM (SELECT SUM(a.bytes) undo_size FROM v$datafile a, v$tablespace b,
dba_tablespaces c WHERE c.contents = ''UNDO'' AND c.status = ''ONLINE''
AND b.name = c.tablespace_name AND a.ts# = b.ts#) d, v$parameter e, v$parameter f,
 (SELECT MAX(undoblks/((end_time-begin_time)*3600*24))undo_block_per_sec
  FROM v$undostat) g WHERE e.name = ''undo_retention'' AND f.name = ''db_block_size''', 1);
COMMIT;
prompt Loading DB_MON_PRAM_COL_MSTR...
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (403, 'round(snap_val_4,6)', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (102, 'snap_val_3', .7);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (201, 'round((1-(snap_val_1/snap_val_2)),2)', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (202, 'round(snap_val_3,2)', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (301, 'snap_val_1', 21.84);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (204, 'snap_val_5', .023157142857142857142857142857142857143);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (501, 'round(snap_val_1,10)', .035);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (101, 'round(snap_val_1/snap_val_2,2)*100', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (502, 'round(snap_val_2,2)', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (503, 'round(snap_val_3,2)', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (601, 'snap_val_1', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (103, 'snap_val_4', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (302, 'snap_val_2', .4353);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (303, 'snap_val_3', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (304, 'snap_val_4', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (305, 'snap_val_5', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (401, 'round(snap_val_1/snap_val_2,4)*100', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (402, 'snap_val_3', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (203, 'round(snap_val_4*1024*1024/snap_val_2,2)', 1);
insert into DB_MON_PRAM_COL_MSTR (dmpm_param_id, expression_1, baseline_val)
values (205, 'round(snap_val_6,2)', 1);
commit;
prompt 20 records loaded
prompt Loading DB_MON_PRAM_INIT_REL...
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (100, 101, 'pga_aggregate_target', 'Please remember that when you change this parameter you are increasing the memory allocated to the SQL work area. So some operations may run fully in memory.', 1);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (100, 101, 'sort_area_size', 'size of in-memory sort work area - change this to improve performance of large sorts', 2);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (200, 201, 'shared_pool_size', 'Increase the size of the SGA by setting the parameter  "sga_target" to a higher value', 1);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (200, 204, 'Hard Parses', 'Consider changing the value of CURSOR_SHARING to SIMILAR. Recheck sql''s with hard parses from V$SQL.', 1);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (200, 205, 'shared_pool_size', 'Consider increasing the init.ora paramter shared_pool_size', 1);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (600, 601, 'Sql''s with high IO', 'There are SQL''s causing I/O contention please check the running SQL''s', 1);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (400, 401, 'undo_retention', 'Increase the undo_retention paramter, also check whether applications are commiting periodically', 1);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (500, 503, 'log_buffer', 'Consider increasing this parameter', 1);
insert into DB_MON_PRAM_INIT_REL (dmpm_par_param_id, dmpm_param_id, dmpi_init_param_name, dmpi_rel_desc, dmpm_seq)
values (300, 302, 'DB_BLOCK_BUFFERS', 'consider increasing this parameter, additionally check if any of the current running sqls are causing buffer busy waits', 1);
commit;
prompt 9 records loaded
prompt Loading DB_MON_QUERY_SNAP_COL...
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (201, 1, 'bytes', 'SNAP_ID_1');
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (201, 2, 'sum(bytes)', 'SNAP_ID_2');
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (202, 1, 'CPU_RATIO', 'SNAP_ID_3');
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (101, 1, 'curbytes (total)', 'SNAP_ID_1');
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (101, 1, 'curbytes (average)', 'SNAP_ID_2');
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (101, 1, 'sessions_cur', 'SNAP_ID_3');
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (101, 2, 'worstbytes (total)', 'SNAP_ID_4');
insert into DB_MON_QUERY_SNAP_COL (dmpm_param_id, dmqm_seq, query_col, snap_col)
values (101, 2, 'worstbytes (average)', 'SNAP_ID_5');
commit;
prompt 8 records loaded
prompt Loading DB_MON_THRESHOLD...
insert into DB_MON_THRESHOLD (dmpm_par_param_id, threshold_lvl1, threshold_lvl2, threshold_lvldesc)
values (100, 50, 90, null);
insert into DB_MON_THRESHOLD (dmpm_par_param_id, threshold_lvl1, threshold_lvl2, threshold_lvldesc)
values (600, 45, 80, null);
insert into DB_MON_THRESHOLD (dmpm_par_param_id, threshold_lvl1, threshold_lvl2, threshold_lvldesc)
values (200, 55, 80, 'The threshold is baselined at 65 here, considering we ran a hard parsed query 10000 times on a system with SGA size 293601280 bytes. RAM of 4gb.');
insert into DB_MON_THRESHOLD (dmpm_par_param_id, threshold_lvl1, threshold_lvl2, threshold_lvldesc)
values (300, 50, 80, null);
insert into DB_MON_THRESHOLD (dmpm_par_param_id, threshold_lvl1, threshold_lvl2, threshold_lvldesc)
values (400, 40, 80, null);
insert into DB_MON_THRESHOLD (dmpm_par_param_id, threshold_lvl1, threshold_lvl2, threshold_lvldesc)
values (500, 40, 80, null);
commit;
prompt 6 records loaded
prompt Loading DB_MON_WEIGHTAGE...
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (403, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (102, 1, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (201, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (202, .2, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (101, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (204, .1, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (501, 1, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (502, 0, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (503, 0, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (601, 1, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (103, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (301, .9, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (302, .1, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (303, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (304, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (305, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (401, .1, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (402, .9, 'G');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (203, 1, 'L');
insert into DB_MON_WEIGHTAGE (dmpm_param_id, weight, type)
values (205, .7, 'G');
commit;
prompt 20 records loaded
prompt Loading DB_MON_XY_STAT...
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-04-2012 00:59:12', 'dd-mm-yyyy hh24:mi:ss'), 3600, 10, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('07-04-2012 23:22:42', 'dd-mm-yyyy hh24:mi:ss'), 120, 50, 'N', 45);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('07-04-2012 23:27:04', 'dd-mm-yyyy hh24:mi:ss'), 120, 60, 'N', 20);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('08-04-2012 21:27:07', 'dd-mm-yyyy hh24:mi:ss'), 60, 60, 'N', 20);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('09-04-2012 00:10:59', 'dd-mm-yyyy hh24:mi:ss'), 120, 60, 'N', 5);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:20:12', 'dd-mm-yyyy hh24:mi:ss'), 10, 600, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:22:46', 'dd-mm-yyyy hh24:mi:ss'), 10, 60, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:23:42', 'dd-mm-yyyy hh24:mi:ss'), 10, 30, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:25:02', 'dd-mm-yyyy hh24:mi:ss'), 10, 30, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('03-03-2012 15:13:39', 'dd-mm-yyyy hh24:mi:ss'), 3600, 1800, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('03-03-2012 15:13:42', 'dd-mm-yyyy hh24:mi:ss'), 10, 3000, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('03-03-2012 15:34:32', 'dd-mm-yyyy hh24:mi:ss'), 3600, 30, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:27:38', 'dd-mm-yyyy hh24:mi:ss'), 10, 30, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:31:02', 'dd-mm-yyyy hh24:mi:ss'), 10, 300, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:31:49', 'dd-mm-yyyy hh24:mi:ss'), 10, 900, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:32:02', 'dd-mm-yyyy hh24:mi:ss'), 10, 999, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:36:58', 'dd-mm-yyyy hh24:mi:ss'), 10, 999, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:39:44', 'dd-mm-yyyy hh24:mi:ss'), 10, 999, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:39:53', 'dd-mm-yyyy hh24:mi:ss'), 10, 900, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:40:06', 'dd-mm-yyyy hh24:mi:ss'), 10, 100, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:40:15', 'dd-mm-yyyy hh24:mi:ss'), 10, 20, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:43:48', 'dd-mm-yyyy hh24:mi:ss'), 10, 20, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:43:58', 'dd-mm-yyyy hh24:mi:ss'), 10, 20000, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('18-02-2012 18:44:25', 'dd-mm-yyyy hh24:mi:ss'), 10, 3000, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 12:35:20', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:26:29', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:34:09', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:35:52', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:36:39', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:38:37', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:38:46', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:41:02', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:41:41', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:43:06', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:43:59', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 16:48:39', 'dd-mm-yyyy hh24:mi:ss'), 3600, 60, 'N', 15);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('03-03-2012 15:12:34', 'dd-mm-yyyy hh24:mi:ss'), 111, 111, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('03-03-2012 15:12:55', 'dd-mm-yyyy hh24:mi:ss'), 111, 111, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 10:47:19', 'dd-mm-yyyy hh24:mi:ss'), 3600, 10, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 14:51:28', 'dd-mm-yyyy hh24:mi:ss'), 9999999, 9999, 'N', 999);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('05-03-2012 14:51:42', 'dd-mm-yyyy hh24:mi:ss'), 9999999999999999999, 99999999999999999, 'N', 99999999999999);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('03-03-2012 16:07:34', 'dd-mm-yyyy hh24:mi:ss'), 3600, 10, 'N', null);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('06-03-2012 22:33:06', 'dd-mm-yyyy hh24:mi:ss'), 3600, 10, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('07-04-2012 23:21:40', 'dd-mm-yyyy hh24:mi:ss'), 60, 50, 'N', 45);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('09-04-2012 03:52:50', 'dd-mm-yyyy hh24:mi:ss'), 120, 10, 'N', 5);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('07-04-2012 00:18:22', 'dd-mm-yyyy hh24:mi:ss'), 60, 15, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('07-04-2012 00:20:21', 'dd-mm-yyyy hh24:mi:ss'), 60, 15, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('09-04-2012 08:13:39', 'dd-mm-yyyy hh24:mi:ss'), 120, 60, 'Y', 5);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('17-03-2012 09:39:37', 'dd-mm-yyyy hh24:mi:ss'), 3600, 30, 'N', 60);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('17-03-2012 14:48:16', 'dd-mm-yyyy hh24:mi:ss'), 60, 10, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('06-04-2012 23:34:43', 'dd-mm-yyyy hh24:mi:ss'), 60, 15, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('07-04-2012 00:24:13', 'dd-mm-yyyy hh24:mi:ss'), 60, 15, 'N', 10);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('08-04-2012 00:07:39', 'dd-mm-yyyy hh24:mi:ss'), 120, 60, 'N', 20);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('08-04-2012 18:16:52', 'dd-mm-yyyy hh24:mi:ss'), 120, 60, 'N', 20);
insert into DB_MON_XY_STAT (change_date, x_val, y_val, active, z_val)
values (to_date('08-04-2012 21:28:15', 'dd-mm-yyyy hh24:mi:ss'), 120, 60, 'N', 20);
commit;
prompt 55 records loaded
prompt Loading LOGIN_MASTER...
insert into LOGIN_MASTER (username, pd)
values ('robin', 'tuneme');
commit;
prompt 1 records loaded
prompt Enabling foreign key constraints for DB_MON_PARAM_MSTR...
alter table DB_MON_PARAM_MSTR enable constraint FK_SELF;
prompt Enabling foreign key constraints for DB_MON_PRAM_COL_MSTR...
alter table DB_MON_PRAM_COL_MSTR enable constraint FK_DMPM_PARAM_ID;
prompt Enabling foreign key constraints for DB_MON_PRAM_INIT_REL...
alter table DB_MON_PRAM_INIT_REL enable constraint FK_DMPIR;
prompt Enabling foreign key constraints for DB_MON_QUERY_SNAP_COL...
alter table DB_MON_QUERY_SNAP_COL enable constraint FK_DMPM;
prompt Enabling foreign key constraints for DB_MON_THRESHOLD...
alter table DB_MON_THRESHOLD enable constraint FK_THRESHOLD;
prompt Enabling foreign key constraints for DB_MON_WEIGHTAGE...
alter table DB_MON_WEIGHTAGE enable constraint FK_WEIGHT;
set feedback on
set define on
prompt Done.
