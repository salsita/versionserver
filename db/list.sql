select p.name, p.id, coalesce(v.ver_a || '.' || v.ver_b || '.' || v.maxver_c || '.' || v.ver_build, 'no build yet') from
Project p left outer join
(select lc.project_id, lc.ver_a, lc.ver_b, max(lc.ver_c) maxver_c, lc.ver_build from LastBuild lc join
(select lb.project_id, lb.ver_a, max(lb.ver_b) maxver_b from LastBuild lb join
(select project_id, max(ver_a) maxver_a from LastBuild group by project_id) as a
on lb.ver_a = a.maxver_a and lb.project_id = a.project_id group by lb.project_id) as b
on lc.ver_a = b.ver_a and lc.ver_b = b.maxver_b and lc.project_id = b.project_id group by lc.project_id
) v
on p.id = v.project_id
order by p.name desc;
