CREATE PROC Register(
@UserName nvarchar(50),
@UserEmail nvarchar(100),
@UserPWD nvarchar(100),
@CompanyName nvarchar(200),
@CompanyAddress nvarchar(300),
@CompanyPhone nvarchar(50)
)
as 
BEGIN
--DECLARE @CompanyIDOutPut table ( ID int );
--DECLARE @CompanyID1 int;
DECLARE @CompanyID int;
DeCLARE @NewUserID uniqueidentifier;
DECLARE @NewRoleID int;
DECLARE @CompanyIsActive bit;
DECLARE @UserIsActive bit;
DECLARE @ApprovalStatus bit;
--初始化对象
SET @NewUserID=NEWID();

-- 添加企业
set @CompanyIsActive=0;
set @ApprovalStatus=0

exec AddCompany @CompanyName, @CompanyAddress,@CompanyPhone, @UserName,	 @CompanyIsActive,@ApprovalStatus,null, @CompanyID output,@NewUserID;

----添加用户
set @UserIsActive=0;
exec AddUser  @CompanyID, @UserName, @UserEmail,@UserPWD, null, null,null, @UserIsActive, @UserName, @NewUserID  output

--添加权限 --正常情况下，审批通过才能添加权限
set @NewRoleID=2 -- 企业管理员
exec AddUserRole @NewUserID, @NewRoleID,null, @CompanyID
END
GO

