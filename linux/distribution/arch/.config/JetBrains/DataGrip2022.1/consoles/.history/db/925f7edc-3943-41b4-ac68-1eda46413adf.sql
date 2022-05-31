select * from alarm_info_001031;
;-- -. . -..- - / . -. - .-. -.--
create table alarm_info_20012
(
    alarm_info_id varchar(100)              not null
        primary key,
    deviceid      varchar(26)               null,
    alarmdata     int(11) unsigned zerofill null,
    rectime       varchar(26)               null
)
    charset = utf8;
;-- -. . -..- - / . -. - .-. -.--
create index alarm_info_rectime_idx
    on alarm_info_20012 (rectime);
;-- -. . -..- - / . -. - .-. -.--
create table alarm_info_20013
(
    alarm_info_id varchar(100)              not null
        primary key,
    deviceid      varchar(26)               null,
    alarmdata     int(11) unsigned zerofill null,
    rectime       varchar(26)               null
)
    charset = utf8;
;-- -. . -..- - / . -. - .-. -.--
create index alarm_info_rectime_idx
    on alarm_info_20013 (rectime);
;-- -. . -..- - / . -. - .-. -.--
select send_tm,msg_type from im_user_message;
;-- -. . -..- - / . -. - .-. -.--
select send_tm,content from im_user_message;
;-- -. . -..- - / . -. - .-. -.--
select * from sys_role a left join sys_user_role b on a.id=b.role_id;
;-- -. . -..- - / . -. - .-. -.--
select * from sys_role a left join sys_user_role b on a.id=b.role_id where a.id=1;