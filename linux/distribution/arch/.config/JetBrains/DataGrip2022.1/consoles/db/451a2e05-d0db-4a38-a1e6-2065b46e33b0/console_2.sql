select * from sys_route where uuid in(select route_uuid from sys_role_route where role_uuid='b5243debb7ac4014ad6e88ffa1bc4248')
