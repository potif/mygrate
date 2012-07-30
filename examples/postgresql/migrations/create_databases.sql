drop database if exists mygrate_db_dev;
drop user if exists mygrate_user_dev;
drop database if exists mygrate_db_test;
drop user if exists mygrate_user_test;

create user mygrate_user_dev password 'dev';
create database mygrate_db_dev owner mygrate_user_dev;
alter schema public OWNER TO mygrate_user_dev;

create user mygrate_user_test password 'test';
create database mygrate_db_test owner mygrate_user_test;
alter schema public OWNER TO mygrate_user_test;
