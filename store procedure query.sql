create database sp_testdb;


use sp_testdb;


create table departments
(id int primary key identity,
depname varchar(255),
email varchar (255),
mobile varchar(255)
);

create procedure sp_department
@action varchar(40),
@id int=0,
@depname varchar (255)=null,
@email varchar (255)=null,
@mobile varchar (255)=null
as
begin
if(@action ='select')
begin
select * from departments
end
else if (@action='create')
begin
insert into departments(depname,email,mobile)values(@depname,@email,@mobile)
select 1 as result
end
else if (@action='delete')
begin
delete from departments where id=@id
select 1 as result
end
else if (@action='update ')
begin
update departments set depname =@depname ,email=@email,mobile=@mobile where id=@id
select 1 as result 
end
end


exec sp_department 'select'
exec sp_department 'create',2,'cm','cmm','cmm@gmail.com'

exec sp_department 'update',2,'cm','cm@gmail.com',2589637415
exec sp_department 'delete',2


