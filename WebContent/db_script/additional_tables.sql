create table tbl_service_utilization_details(
	id bigint auto_increment,
	service_utilization_id bigint not null,
	card_consulting float not null,
	lab float not null,
	imaging float not null,
	surgery float not null,
	medicine float not null,
	ward float not null,
	others float not null,
	remark text not null,
	primary key(id),
	foreign key(service_utilization_id) references tbl_service_utilization(id)
);

create table tbl_admin_field(
	id int auto_increment,
	field_name varchar(50) not null,
	option_value varchar(100) not null,
	description varchar(255) not null,
	primary key(id)
);