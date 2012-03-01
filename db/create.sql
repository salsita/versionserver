create table Project (
  id integer not null primary key auto_increment,
  name varchar(256) not null unique
);

create table LastBuild (
  project_id int not null,
  ver_a int not null,
  ver_b int not null,
  ver_c int not null,
  ver_build int not null,
  primary key(project_id, ver_a, ver_b, ver_c),
  foreign key(project_id) references Project(id)
);
