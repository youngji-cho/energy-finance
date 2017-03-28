
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

#문자찾기 
select * from `power_plant` where  `발전소명`='계' or `발전소명`='소계';
select * from `power_plant` where  `발전소명`='계' or `발전소명`='소계';
select * from `power_plant` where  `총설비용량`like '%"%'  limit 1,4;
select *from `power_plant` where `id` like '%"%' or`연료원` like '%"%' or`발전형식` like '%"%' or
`발전소명` like '%"%' or`설비용량` like '%"%' or`대수` like '%"%' or`총설비용량` like '%"%';

##정규표현식 
select *from `power_plant` where `발전소명` regexp '^현';
select *from `power_plant` where `발전소명` regexp '현';
select *from `power_plant` where `발전형식` regexp '^$|\s+'; #빈칸을 찾는다. 
select *from `power_plant` where `발전소명` regexp '"' or `설비용량` regexp '"' or 
`대수` regexp '"' or `총설비용량` regexp '"' ;
select *from `power_plant` where `발전소명` regexp ('10호'| '군복');
