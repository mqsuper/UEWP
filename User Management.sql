--Validate user
GO
CREATE PROC ValidateUser
(
	@UserEmail nvarchar(100),
	@UserPWD nvarchar(100)
)
AS
BEGIN
	select count(1) from T_USER where UserEmail=@UserEmail and UserPWD=@UserPWD and IsActive=1
END
GO

--获得所有用户
ALTER PROC GetAllUsers(
 @keyWord nvarchar(max)
 )
AS
BEGIN
	SELECT * FROM T_USER  where 
	UserName like '%'+@keyWord+'%' or UserEmail like '%'+@keyWord+'%'
END

go

---根据公司获得用户
CRATE PROC GetUsersByCompany
(
	@CompanyID int,
	 @keyWord nvarchar(max)
)

AS
BEGIN
	SELECT * FROM t_uSER WHERE COMPANYID=@COMPANYid and ( 
	UserName like '%'+@keyWord+'%' or UserEmail like '%'+@keyWord+'%')
END
go

--更新用户
CREATE PROC UpdateUser
(
@UserID UniqueIdentifier,
@UserName nvarchar(50),
@UserPWD nvarchar(100),
@UserGender bit,
@UserAge int,
@UserPhone nvarchar(50)
)

AS
BEGIN
	update T_USER set UserName=@UserName, UserPWD=@UserPWD, UserAge=@UserAge, UserPhone=@UserPhone
	where userid=@UserID
END
go

--删除用户
CREATE PROC DeleteUser
(
@UserID UniqueIdentifier
)

AS
BEGIN
	update T_USER set IsActive=0
	where userid=@UserID
END
go

--添加用户
Create PROC AddUser(
@CompanyID int,
@UserName nvarchar(50),
@UserEmail nvarchar(100),
@UserPWD nvarchar(100),
@UserGender bit,
@UserAge int,
@UserPhone nvarchar(50),
@IsActive bit,
@CreatedBy nvarchar(50),
@UserID uniqueidentifier output
)
as

BEGIN
if(@UserID is null)
BEGIN
	set @UserID =newid();
END 
INSERT T_User (UserID, CompanyID, UserName, UserEmail, UserPWD, UserGender, UserAge, UserPhone, IsActive, CreatedBy, CreatedDate)
VALUES(@UserID, @CompanyID,@UserName,@UserEmail,@UserPWD,@UserGender,@UserAge,@UserPhone,@IsActive,@CreatedBy,getdate());

select @UserID as 'UserID'
END 

CREATE PROC PROC [dbo].[GetAssignedBusinessByUserID]
(
	@UserID uniqueidentifier,
	@CompanyID int
)
as
BEGIN
	select * from RoleWithBusiness where USERID=@UserID and CompanyID=@CompanyID
END
GO



--exec  GetAssignedBusinessByUserID '73e9bb3b-7c34-493e-b7c3-027ad3584b87'

--exec GetRoleInformationonAllBusiness 7,'73e9bb3b-7c34-493e-b7c3-027ad3584b87'

-- 获取公司全部的业务，以及用户在每个业务的权限
CREATE PROC GetRoleInformationonAllBusiness
(
	@CompanyID int,
	@UserID uniqueIdentifier
)

AS
BEGIN
	select * from (
	select * from T_BUSINESS B where b.CompanyId=@CompanyID ) TB left join 
	(select * from 	 T_USER_ROLE UR where CompanyID=@CompanyID and UserID=@UserID) TUR
	
	 on  TB.BUSINESSID=TUR.BUSINESSID 
END
GO


CREATE PROC GetUserByEmail
(
@UserEmail nvarchar(100)
)
AS
BEGIN
	SELECT * FROM T_USER WHERE UserEmail=@UserEmail
END 
GO

CREATE PROC [dbo].[GetAllRolesByUserID]
(
	@UserID uniqueidentifier
)
as
BEGIN
	select * from RoleWithBusiness where USERID=@UserID
END

GO

