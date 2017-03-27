create database `electricity market` character set utf8;
use `electricity market`;

drop table if exists `power_plant`;
create table `power_plant` (
    `id` int auto_increment,
    `연료원` varchar(40) ,
    `발전형식` varchar(40) null,
    `발전소명` varchar(40) null,
    `설비용량` varchar(40) null,
    `대수` varchar(40) null,
    `총설비용량` varchar(40) null,
    primary key(`id`)
);

load data local infile 'Users/youngji/Dropbox/data/power_plant.csv'
into table power_plant 
fields terminated by ',' 
lines terminated by '\r'
(`연료원`,`발전형식`,`발전소명`,`설비용량`,`대수`,`총설비용량`);

select *from power_plant;

select * from `power_plant` where  `발전소명`='계' or `발전소명`='소계';
select * from `power_plant` where  `발전소명`='계' or `발전소명`='소계';
select * from `power_plant` where  `총설비용량`like '%"%'  limit 1,4;
