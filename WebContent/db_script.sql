create database db_bluebook;
use db_bluebook;

create table tbl_user(
	id int auto_increment,
	full_name varchar(100) not null,
	user_type varchar(100) not null,
	primary key(id)
);

create table tbl_account(
	id int auto_increment,
	user_id int not null,
	username varchar(70) not null,
	password varchar(150) not null,
	account_creation_date datetime not null,
	primary key(id),
	foreign key(user_id) references tbl_user(id)
);

create table tbl_applicant(
	id bigint auto_increment,
	applicant_id_number varchar(100) not null,
	full_name varchar(100) not null,
	sex varchar(10) not null,
	age_category varchar(50) not null,
	number_of_applicants_male int not null,
	number_of_applicants_female int not null,
	occupation varchar(100) not null,
	disability varchar(50) not null,
	primary key(id)
);

create table tbl_applicant_address(
	id bigint auto_increment,
	applicant_id bigint not null,
	region varchar(50) not null,
	applicant_zone varchar(70) not null,
	woreda varchar(70) not null,
	kebele varchar(70) not null,
	office_telephone varchar(70) not null,
	home_telephone varchar(70) not null,
	mobile_telephone varchar(70) not null,
	email varchar(70) not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id)
);

create table tbl_case_category(
	id int auto_increment,
	case_category_name varchar(100) not null,
	description text not null,
	primary key(id)
);

create table tbl_case(
	id bigint auto_increment,
	case_id_number varchar(100) not null,
	theme text not null,
	relief_sought text not null,
	case_category_id int not null,
	linkage varchar(200) not null,
	evidence_type varchar(100) not null,
	number_of_pages int not null,
	means_of_application varchar(200) not null,
	applied_by varchar(70) not null,
	primary key(id),
	foreign key(case_category_id) references tbl_case_category(id)
);

create table tbl_respondent(
	id int auto_increment,
	respondent_id_number varchar(100) not null,
	name varchar(100) not null,
	structure varchar(100) not null,
	sector varchar(100) not null,
	primary key(id)
);

create table tbl_respondent_address(
	id int auto_increment,
	respondent_id int not null,
	region varchar(50) not null,
	woreda varchar(50) not null,
	kebele varchar(50) not null,
	telephone varchar(70) not null,
	mobile varchar(70) not null,
	fax varchar(70) not null,
	pobox varchar(100) not null,
	email varchar(70) not null,
	primary key(id),
	foreign key(respondent_id) references tbl_respondent(id)
);

create table tbl_decision(
	id bigint auto_increment,
	file_number varchar(100) not null,
	applicant_id bigint not null,
	case_id bigint not null,
	respondent_id int not null,
	decision_given varchar(100) not null,
	notes text not null,
	registration_date datetime not null,
	user_id int not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id),
	foreign key(case_id) references tbl_case(id),
	foreign key(respondent_id) references tbl_respondent(id),
	foreign key(user_id) references tbl_user(id)
);

create table tbl_decision_main_reason(
	id bigint auto_increment,
	decision_id bigint not null,
	main_reason text not null,
	primary key(id),
	foreign key(decision_id) references tbl_decision(id)
);

create table tbl_early_resolution(
	id bigint auto_increment,
	applicant_id bigint not null,
	case_id bigint not null,
	officer_effort text not null,
	respondent_response text not null,
	applicant_reaction text not null,
	resolution_date datetime not null,
	result varchar(50) not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id),
	foreign key(case_id) references tbl_case(id)
);

create table tbl_investigator(
	id int auto_increment,
	full_name varchar(100) not null,
	primary key(id)
);

create table tbl_investigator_assignment(
	id bigint auto_increment,
	applicant_id bigint not null,
	case_id bigint not null,
	respondent_id int not null,
	file_source varchar(100) not null,
	user_id int not null,
	investigator_id int not null,
	investigator_level varchar(70) not null,
	case_status varchar(100) not null,
	date_assigned datetime not null,
	open_date datetime not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id),
	foreign key(case_id) references tbl_case(id),
	foreign key(respondent_id) references tbl_respondent(id),
	foreign key(user_id) references tbl_user(id),
	foreign key(investigator_id) references tbl_investigator(id)
);

create table tbl_case_review(
	id bigint auto_increment,
	applicant_id bigint not null,
	case_id bigint not null,
	respondent_id int not null,
	case_theme text not null,
	investigation_required boolean not null,
	reason text not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id),
	foreign key(case_id) references tbl_case(id),
	foreign key(respondent_id) references tbl_respondent(id)
);

create table tbl_agreement(
	id bigint auto_increment,
	applicant_id bigint not null,
	case_id bigint not null,
	respondent_id int not null,
	case_theme text not null,
	investigator_point_of_view text not null,
	applicant_stand text not null,
	respondent_stand text not null,
	agreement text not null,
	result varchar(50) not null,
	agreement_date datetime not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id),
	foreign key(case_id) references tbl_case(id),
	foreign key(respondent_id) references tbl_respondent(id)
);

create table tbl_investigation(
	id bigint auto_increment,
	applicant_id bigint not null,
	case_id bigint not null,
	respondent_id int not null,
	case_theme text not null,
	what_register varchar(100) not null,
	termination_reason text not null,
	current_status_of_case varchar(100) not null,
	investigation_date datetime not null,
	next_job_and_date text not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id),
	foreign key(case_id) references tbl_case(id),
	foreign key(respondent_id) references tbl_respondent(id)
);

create table tbl_followup(
	id bigint auto_increment,
	applicant_id bigint not null,
	case_id bigint not null,
	respondent_id int not null,
	case_theme text not null,
	decision_given varchar(50) not null,
	followup_date datetime not null,
	primary key(id),
	foreign key(applicant_id) references tbl_applicant(id),
	foreign key(case_id) references tbl_case(id),
	foreign key(respondent_id) references tbl_respondent(id)
);