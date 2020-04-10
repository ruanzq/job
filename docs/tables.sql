-- 学生管理系统基础表与视图的设计
#  作者：阮赵祺
# 基础表结构设计
drop database if exists `handsomeR`;
drop table if exists  `college`;
drop table if exists  `class`;
drop table if exists  `employees`;
drop table if exists  `students`;
drop table if exists  `administrator`;
drop table if exists  `provinces`;
drop table if exists  `city`;
drop table if exists  `nation`;
drop table if exists  `employee_type`;
drop table if exists  `courses`;

create database handsomeR default charset utf8mb4;

use handsomeR;

-- 学院表
create table `college`(
	`college_id` tinyint auto_increment comment '学院唯一编码',
	`college_name` varchar(30) not null comment '学院名称',
	`college_description` varchar(150) null default null comment '学院相关描述',
	primary key(`college_id`),
	unique key(`college_name`)
)

-- 班级表
create table `class`(
	`class_id` smallint auto_increment comment '班级唯一标识',
	`class_name` varchar(70) not null comment '班级名称',
	`college_id` tinyint not null comment '班级所属学院 逻辑外键 参照与表 college 的字段 college_id',
	`instructor` int not null comment '辅导员 逻辑外键 参照于表 employees 字段 employee_id',
	`comment` varchar(200) comment '班级备注',
	primary key(`class_id`),
	unique key(`class_name`)
)

-- 雇员信息
create table `employees`(
	`employee_id` int auto_increment comment '雇员唯一识别编码',
	`employee_name` varchar(25) not null comment '雇员姓名',
	`employee_gender` enum('1','0') not null comment '雇员性别  1 代表男性，0代表女性',
	`employee_phone` varchar(50) not null comment '雇员联系电话',
	`employee_email` varchar(100) not null comment '雇员联系邮箱',
	`employee_college_id` int null comment '雇员所属学院 逻辑外键 参照于表college 的主键college_id',
	`employee_type` int not null comment '雇员类型',
	`employee_password` int not null comment '雇员密码',
	primary key(`employee_id`)
)

-- 雇员类型
create table `employee_type`(
	`type_id` int auto_increment comment '雇员类型唯一识别码',
	`type_name` varchar(100) not null comment '雇员类型描述',
	primary key(`type_id`)
)

-- 权限表
create `admin`(
    `admin_id` int comment '管理人员id，参照employees表的 employee_id字段',
    `level` tinyint comment '权限级别',
)

-- 学生表
create table `students`(
	`stu_id` int auto_increment comment '学号编码',
	`stu_name` varchar(25) not null comment '姓名',
	`stu_gender` enum('1','0') not null comment '性别   1 代表男性，0代表女性',
	`stu_nation_id` tinyint not null comment '民族id 逻辑外键 参照于表nation的字段 nation_id',
	`stu_provincial_id` tinyint null comment '学生所在省',
	`stu_city_id` smallint null comment '学生所在城市',
	`stu_class_id` smallint not null comment '所属班级id 逻辑外键 参照于表class 的字段 class_id',
	`stu_college_id` tinyint not null comment '所属学院id 逻辑外键 参照于表college 的字段 college_id',
	`stu_email` varchar(100) null comment '学生电子邮件地址',
	`stu_phone_number` varchar(30) null comment '学生联系电话号码',
	`stu_comment` varchar(200) null comment '学生相关备注',
	`stu_password` int not null comment '学生登录密码',
	primary key(`stu_id`)
)

-- 科目表
create table `courses`(
	`course_id` int auto_increment comment '课程唯一识别码',
	`course_name` varchar(15) not null comment '课程名称',
	`course_description` varchar(220) null comment '课程描述',
	`course_college_id` int comment '课程所属学院 逻辑外键 参照于表 college 的主键college_id',
	`course_employee_id` int comment '课程负责人 逻辑外键 参照于表 employees 的主键 employee_id',
	primary key(`course_id`)
)
create table ``
create table `选课`(
	`sqc` int auto_increment,
	`stu_id` int not null comment '逻辑外键 参照于表student的字段stu_id',
	`course_id` int not null comment '逻辑外键 参照于表courses的字段course_id',
	primary key(`sqc`)
)

-- 省份表
create table `provinces`(
    `province_id` tinyint auto_increment comment '省份唯一识别id',
    `province_name` varchar(16) comment '省份名',
    primary key(`province_id`),
    unique key(`province_name`)
) auto_increment=1;

-- 城市表
create table `city`(
    `city_id` smallint auto_increment comment '城市唯一识别id',
    `city_name` varchar(22) comment '城市名称',
    `province_id` tinyint comment '城市所属省份',
    primary key(`city_id`),
    unique key(`city_name`)
);
-- 民族表
create table `nation`(
	`nation_id` tinyint auto_increment comment "民族唯一识别码",
	`nation_name` char(10) not null comment "民族字符串表示",
	primary key(`nation_id`),
	unique key(`nation_name`)



