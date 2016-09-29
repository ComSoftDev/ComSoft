--创建数据库ComSoft

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
	BackupId varchar(50) not null primary key,
	ServerName varchar(50) not null,
	DbName	varchar(50) not null,
	JobName varchar(200) not null,
	Mode varchar(50) not null,
	StartTime varchar(50) not null,
	FilePath varchar(200) not null,
	[Enabled] int default 1,
	SortCode int,
	CreateDate datetime default getdate(),
	CreateUserId varchar(50),
	CreateUserName varchar(50)
)
go
select * from Base_BackupJob


