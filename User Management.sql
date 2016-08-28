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
CREATE PROC GetAllUsers
AS
BEGIN
	SELECT * FROM T_USER 
END

go

---根据公司获得用户
CREATE PROC GetUsersByCompany
(
	@CompanyID int
)

AS
BEGIN
	SELECT * FROM t_uSER WHERE COMPANYID=@COMPANYid
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

select @UserID
END 