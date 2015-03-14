drop table if exists organizations;

create table organizations(
	id int primary key auto_increment,
	name varchar(100),
	logo_path varchar(255),
	url varchar(255),
	description text,
	wallet varchar(35)
);

drop table if exists users;

create table users(
	id int primary key auto_increment,
	wallet varchar(35)
);


drop table if exists tickets;

create table tickets(
	id int primary key auto_increment,
	user_id int,
	datetime datetime,
	organization_id int,
	foreign key (organization_id) references organizations(id)
);

drop table if exists draws;

create table draws(
	id int primary key auto_increment,
	date_begin datetime,
	date_end datetime,
	first_winner int,
	second_winner int,
	sum double,
	name varchar(100)
);

drop table if exists org_draw;
create table org_draw(
	organization_id int,
	draw_id int,
	foreign key (organization_id) references organizations(id),
	foreign key (draw_id) references draws(id)
);