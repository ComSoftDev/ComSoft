--创建数据库ComSoft
set language 简体中文
go
use master;
go
if DB_ID('ComSoft') is not null drop database ComSoft;
create database ComSoft
go
use ComSoft
go
--创建基础表
/*
---------------------------------------------------
表名	表说明	
Base_BackupJob	数据库备份计划表
		字段说明	列名
		备份主键	BackupId
		服务器地址	ServerName
		数据库	DbName
		计划名称	JobName
		执行方式	Mode
		执行时间	StartTime
		备份路径	FilePath
		有效	Enabled
		排序码	SortCode
		创建时间	CreateDate
		创建用户主键	CreateUserId
		创建用户	CreateUserName
---------------------------------------------------
*/
if OBJECT_ID('Base_BackupJob') is not null drop table Base_BackupJob;
create table Base_BackupJob
(
	BackupId nvarchar(50) not null primary key,
	ServerName nvarchar(50) not null,
	DbName	nvarchar(50) not null,
	JobName nvarchar(200) not null,
	Mode nvarchar(50) not null,
	StartTime nvarchar(50) not null,
	FilePath nvarchar(200) not null,
	[Enabled] int default 1,
	SortCode int,
	CreateDate datetime default getdate(),
	CreateUserId nvarchar(50),
	CreateUserName nvarchar(50)
)
go

insert into Base_BackupJob(BackupId, ServerName, DbName, JobName, Mode, StartTime, FilePath)
values('job1','localhost','ComSoft',N'第一次插入数据',N'新建测试','2016-09-29','c:')
go
select * from Base_BackupJob

