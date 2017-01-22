

insert into user_f values (1,'hhh','a','','','男',sysdate,'','15386001960','','','','','');
insert into user_f values (2,'lll','a','','','男',sysdate,'','15386001922','','','','','');
insert into manager values (1,'tt','a','','','');
insert into manager values (2,'kk','a','','','');
insert into music values (1,'hhh','a','','','男',sysdate,'','15386001960','','','','','');
insert into style values (1,'流行','','');
insert into style values (2,'民谣','','');
insert into style values (3,'轻音乐','','');
insert into Area values (1,'华语','','');
insert into Area values (2,'欧美','','');
insert into Area values (3,'日韩','','');

drop table music;
drop table manager;
drop table style;
drop table Area;
drop table user_f;
drop table singer;
drop table album;
drop table collect;
drop table sclist;
drop table sarela;
drop table enshrine;
drop table gedanlist;
drop table comment_f




--1.用户表
create table user_f(
	User_id int primary key,--用户编号
	User_name varchar2(40) not null,--用户昵称,
	User_pwd varchar2(40) not null,--用户密码
	User_sign varchar2(12),--用户签名
	User_picpath varchar2(60),--用户头像路径
	User_sex varchar2(2) check (User_sex in('男','女')),
	User_birth date,--用户生日
	User_constell varchar2(20),--用户星座
	User_mobile varchar2(20),--用户手机号
	User_email varchar2(20),--用户邮箱
	User_address varchar2(20),--用户地址
	User_another1 varchar2(40),--预留字段1
	User_another2 varchar2(40),--预留字段2
	User_another3 varchar2(40) --预留字段3
)

create sequence seq_user_f start with 1

select *from USER_F;
--2.管理员表
create table manager(
	Manager_id int primary key,--管理员编号
	Manager_name varchar2(20) not null,--管理员姓名
	Manager_pwd varchar2(40) not null,--管理员密码
	Manager_another1 varchar2(40),--预留字段1
	Manager_another2 varchar2(40),--预留字段2
	Manager_another3 varchar2(40)--预留字段3
)
insert into music values (1,'春风十里','2','2','','','','','','');

--3.歌曲信息表
create table music(
	Music_id int primary key,--歌曲id
	Music_name varchar2(20), --歌曲名称
	Music_style int references style(Style_id),--歌曲类型
	Music_singer int references singer(Singer_id),--歌曲演唱者
	Music_lyricpath varchar2(60),--歌词路径
	Music_album varchar2(20),--所属专辑
	Music_another1 varchar2(40),--预留字段1
	Music_another2 varchar2(40),--预留字段2
	Music_another3 varchar2(40)--预留字段3

)

--4.歌手信息表
create table singer(
	Singer_id int primary key,--歌手编号
	Singer_name varchar2(20),--歌手名称
	Area_id int references Area(Area_id),--歌手区域
	Style_id int references Style(Style_id),--歌手风格
	Singer_another1 varchar2(40),--预留字段1
	Singer_another2 varchar2(40)--预留字段2
)

--5.歌曲风格表
create table style(
	Style_id int primary key,--风格编号
	Style_name varchar2(20),--风格名称
	Style_another1 varchar2(40),--预留字段1
	Style_another2 varchar2(40)--预留字段2
)
 
select * from style


select * from Area




--6.音乐区域表
create table Area(
	Area_id int primary key,--区域编号
	Area_name varchar2(20),--区域名称
	Area_another1 varchar2(40),--预留字段1
	Area_another2 varchar2(40)--预留字段2
)


--7.专辑列表
create table album(
	Album_id int primary key,-- 专辑编号 
	Area_id int  references Area(Area_id),-- 栏目编号
	Style_id int references Style(Style_id),-- 风格编号
	Singer_id int references singer(Singer_id),-- 歌手编号 
	Album_name varchar2(20),-- 专辑名称 
	Album_describe varchar2(200),-- 专辑介绍
	Album_date  date,-- 发行时间 
	Album_picpath varchar2(40),-- 专辑图片 
	Album_another1 varchar2(40),--预留字段1
	Album_another2 varchar2(40)--预留字段2

)



--8.歌单
create table collect(
	Collect_id int primary key,--歌单编号
	User_id int references User_f(User_id),--创建人id(属于用户表)
	Collect_date date,--创建日期
	Collect_describe varchar2(200),--歌单描述
	Collect_title varchar2(50),--歌单标题
	Collect_tag varchar2(50),--歌单标签
	Collect_another1 varchar2(40),--预留字段1
	Collect_another2 varchar2(40)--预留字段2
 
  
 )
 

 
--9.歌曲和歌单联系表
create table sclist(
	Sclist_id int primary key,--联系表id（自增）
	Collect_id references collect(Collect_id),--引用collect_id(外键)
	Music_id  references music(Music_id),--引用Music_id(外键)
	Sclist_another1 varchar2(40),--预留字段1
	Sclist_another2 varchar2(40)--预留字段2

)


--10.歌曲和专辑联系表

create table sarela(
	Sarela_id int primary key,--联系表id（自增）
	Album_id  int references album(Album_id),--引用Album_id(外键)
	Music_id  references music(Music_id),--引用Music_id(外键)
	Sarela_another1 varchar2(40),--
	Sarela_another2 varchar2(40)--
)


--11.歌的收藏列表
create table enshrine(
	Enshrine_id int primary key,--收藏表id
	Music_id  references music(Music_id),--引用Music_id(外键)
	User_id int references User_f(User_id),--
	Enshrine_another1 varchar2(40),
	Enshrine_another2 varchar2(40) 
)

--12.歌单的收藏列表
create table gedanlist(
Gedanlist_id int primary key,--
User_id int references User_f(User_id),--
Collect_id references collect(Collect_id),--引用collect_id(外键)
Gedanlist_another1 varchar2(40),
Gedanlist_another2 varchar2(40)

)


--13.评论表
create table comment_f(
	comment_id int primary key,-- id（主键）
	Comment_content varchar2(200),--评论内容
	Comment_date date,--评论时间
	Comment_ip varchar2(20),--评论人的ip
	User_id int references User_f(User_id),
	Comment_another1 varchar2(40),
	Comment_another2 varchar2(40)
)

