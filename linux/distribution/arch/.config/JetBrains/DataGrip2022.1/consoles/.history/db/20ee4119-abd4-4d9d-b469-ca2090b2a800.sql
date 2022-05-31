select * from `group`;
;-- -. . -..- - / . -. - .-. -.--
rename table `group` to group1;
;-- -. . -..- - / . -. - .-. -.--
rename table `group1` to dept;
;-- -. . -..- - / . -. - .-. -.--
rename table `user` to emp;
;-- -. . -..- - / . -. - .-. -.--
insert into dept (dname, loc)
values (1,1);
;-- -. . -..- - / . -. - .-. -.--
delete from dept;
;-- -. . -..- - / . -. - .-. -.--
insert into dept (dname, loc)
values ('ACCOUNTING','ACCOUNTING');
;-- -. . -..- - / . -. - .-. -.--
insert into dept (dname, loc)
values ('SALES','SALES');
;-- -. . -..- - / . -. - .-. -.--
insert into dept (dname, loc)
values ('RESEARCH','RESEARCH');
;-- -. . -..- - / . -. - .-. -.--
SELECT * FROM DEPT;
;-- -. . -..- - / . -. - .-. -.--
insert into emp (deptno, emname, sal, job, mgr, hiredate)
values (2,'小李',300,'员工',false,now()),
       (2,'小王',300,'员工',false,now()),
       (2,'小林',300,'员工',false,now()),
       (2,'小结',300,'员工',false,now()),
       (2,'小屁',300,'员工',false,now()),
       (2,'大王',500,'经理',true,now());
;-- -. . -..- - / . -. - .-. -.--
select * from emp,dept;
;-- -. . -..- - / . -. - .-. -.--
select * from dept;
;-- -. . -..- - / . -. - .-. -.--
insert into emp (deptno, emname, sal, job, mgr, hiredate)
values (3,'s小李',300,'员工',false,now()),
       (3,'s小王',300,'员工',false,now()),
       (3,'s小林',300,'员工',false,now()),
       (3,'s小结',300,'员工',false,now()),
       (3,'s小屁',300,'员工',false,now()),
       (3,'s大王',500,'经理',true,now());
;-- -. . -..- - / . -. - .-. -.--
insert into emp (deptno, emname, sal, job, mgr, hiredate)
values (4,'r小李',300,'员工',false,now()),
       (4,'r小王',300,'员工',false,now()),
       (4,'r小林',300,'员工',false,now()),
       (4,'r小结',300,'员工',false,now()),
       (4,'r小屁',300,'员工',false,now()),
       (4,'r大王',500,'经理',true,now());
;-- -. . -..- - / . -. - .-. -.--
select * from emp;
;-- -. . -..- - / . -. - .-. -.--
select * from emp left join dept on emp.deptno=dept.deptno;
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp left join dept on emp.deptno=dept.deptno where dept.dname='ACCOUNTING';
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp left join dept on emp.deptno=dept.deptno;
;-- -. . -..- - / . -. - .-. -.--
select * from dept where dname='ACCOUNTING';
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp left join dept on emp.deptno=dept.deptno and dept.dname='ACCOUNTING';
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp inner join dept on emp.deptno=dept.deptno and dept.dname='ACCOUNTING';
;-- -. . -..- - / . -. - .-. -.--
select * from emp where mgr =1;
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp join dept on emp.deptno=dept.deptno and dept.dname='ACCOUNTING';
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp join dept on emp.deptno=dept.deptno and dept.dname='SALES' and mgr=1;
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp join dept on emp.deptno=dept.deptno and dept.dname='RESEARCH' and hiredate='2022-05-29';
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.dname from emp join dept on emp.deptno=dept.deptno and dept.dname='SALES';
;-- -. . -..- - / . -. - .-. -.--
select sum(sal) from emp join dept on emp.deptno=dept.deptno and dept.dname='SALES';
;-- -. . -..- - / . -. - .-. -.--
select count(*) from emp;
;-- -. . -..- - / . -. - .-. -.--
select distinct count(*) from dept;
;-- -. . -..- - / . -. - .-. -.--
select count(*) from dept;
;-- -. . -..- - / . -. - .-. -.--
select emp.sal from emp where emp.emname = '小王';
;-- -. . -..- - / . -. - .-. -.--
select emp.sal from emp where emp.emname like '%小王';
;-- -. . -..- - / . -. - .-. -.--
select emp.sal sum(sal) from emp where emp.emname like '%小王';
;-- -. . -..- - / . -. - .-. -.--
select emp.sal,sum(sal) from emp where emp.emname like '%小王';
;-- -. . -..- - / . -. - .-. -.--
select emp.emname,sum(sal) from emp where emp.emname like '%小王';
;-- -. . -..- - / . -. - .-. -.--
select emp.emname,sum(sal) from emp where emp.emname like '%小王' union
select emp.emname,sum(sal) from emp where emp.emname like '%小李';
;-- -. . -..- - / . -. - .-. -.--
select emp.emname,sum(sal) from emp
group by emp.emname;
;-- -. . -..- - / . -. - .-. -.--
select emp.sal,sum(sal),count(emname)from emp join dept d on emp.deptno = d.deptno
group by d.dname;
;-- -. . -..- - / . -. - .-. -.--
select emp.sal,sum(sal),count(empno)from emp join dept d on emp.deptno = d.deptno
group by d.dname;
;-- -. . -..- - / . -. - .-. -.--
(select d.deptno,sum(sal),count(empno)from emp join dept d on emp.deptno = d.deptno
group by d.dname);
;-- -. . -..- - / . -. - .-. -.--
select emp.*,dept.* from emp join (select d.deptno,sum(sal),count(empno)from emp join dept d on emp.deptno = d.deptno
group by d.dname) dept on emp.deptno=dept.deptno;
;-- -. . -..- - / . -. - .-. -.--
select d.deptno,sum(sal),count(empno)from emp join dept d on emp.deptno = d.deptno
group by d.dname;