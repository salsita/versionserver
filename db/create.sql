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

-- everything besides the pk is nullable because we don't have the data for old builds
create table BuildInfo (
  project_id int not null,
  ver_a int not null,
  ver_b int not null,
  ver_c int not null,
  ver_build int not null,

  time%u TIMESTAMP null,
-- version control identity - identifies the changeset this build was made from, 128 chars is more than enough
-- hg identity or git rev-parse HEAD
  vc_identity varchar(128) null,

  primary key(project_id, ver_a, ver_b, ver_c, ver_build),
  foreign key(project_id) references Project(id)
);