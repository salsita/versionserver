insert into Project(name) values ('BargainMatchIE');
insert into Project(name) values ('ienotifybar');
insert into Project(name) values ('iesetuphelper');
insert into Project(name) values ('libbhohelper');

insert into LastBuild(project_id, ver_a, ver_b, ver_c, ver_build) values ((select id from Project where name='BargainMatchIE'), 1, 0, 1, 1400);