insert into  S_MENU values (${uuid0}, 0, '新增目录(要修改)', null, '${menuName}', '0', 'layui-icon layui-icon-app', '4', null, 'admin',sysdate,'admin',sysdate);
insert into  S_MENU values (${uuid1}, ${uuid0}, '${table.comments!""}', '/${table.smallCamelName}', '${table.smallCamelName}', '1', '', '99', null, 'admin',sysdate,'admin',sysdate);
insert into  S_MENU values (${uuid2}, ${uuid1}, '详情', '/${table.smallCamelName}/detail', '${table.smallCamelName}/detail', '2', null, '1', null, 'admin',sysdate,'admin',sysdate);
insert into  S_MENU values (${uuid3}, ${uuid1}, '新增', '/${table.smallCamelName}/add', '${table.smallCamelName}/add', '2', null, '2', null, 'admin',sysdate,'admin',sysdate);
insert into  S_MENU values (${uuid4}, ${uuid1}, '修改', '/${table.smallCamelName}/edit', '${table.smallCamelName}/edit', '2', null, '3', null, 'admin',sysdate,'admin',sysdate);
insert into  S_MENU values (${uuid5}, ${uuid1}, '删除', '/${table.smallCamelName}/delete', '${table.smallCamelName}/delete', '2', null, '4', null, 'admin',sysdate,'admin',sysdate);
insert into  S_MENU values (${uuid6}, ${uuid1}, '批量删除', '/${table.smallCamelName}/batchDelete', '${table.smallCamelName}/batchdelete', '2', null, '5', null, 'admin',sysdate,'admin',sysdate);
