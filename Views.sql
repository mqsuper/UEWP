CREATE VIEW RoleWithBusiness
as 
select UR.*, B.BusinessName from T_USER_ROLE UR left join T_BUSINESS  B on UR.BUSINESSID =B.businessID
go