select emp.*,dept.dname from emp join dept on emp.deptno=dept.deptno and dept.dname='ACCOUNTING'

select emp.*,dept.dname from emp join dept on emp.deptno=dept.deptno and dept.dname='SALES' and mgr=1

select emp.*,dept.dname from emp join dept on emp.deptno=dept.deptno and dept.dname='RESEARCH' and hiredate='2022-05-29'

select sum(sal) from emp join dept on emp.deptno=dept.deptno and dept.dname='SALES'

select count(*) from dept

select emp.emname,sum(sal)from emp
group by emp.emname

select sum(sal),count(empno)from emp join dept d on emp.deptno = d.deptno
group by d.dname


select emp.*,dept.* from emp join (select d.deptno,sum(sal),count(empno)from emp join dept d on emp.deptno = d.deptno
group by d.dname) dept on emp.deptno=dept.deptno