create PROC [dbo].[AddUserRole](
@UserID uniqueidentifier,
@RoleID int,
@BusinessID int,
@CompanyID int
)
as

BEGIN
DECLARE @IsExisted int
SET @IsExisted=0

IF (@RoleID =1)
BEGIN
	 -- get if the current role is existed or not 
	 select  @IsExisted=count(1) from T_USER_ROLE WHERE UserID=@UserID and RoleID=@RoleID and BusinessID is null and CompanyID is null
	 DELETE FROM T_USER_ROLE WHERE USERID=@UserID AND ROLEID!=@RoleID -- 删除不是这个role的所有权限，如果存在
	 if(@IsExisted =0)
		 BEGIN
			INSERT T_USER_ROLE (UserRoleID, UserID,RoleID,BUSINESSID, CompanyID)
			VALUES(NEWID(),@UserID,@RoleID,null,null);
		 END	
END 
ELSE IF (@RoleID=2)
BEGIN
	 -- get if the current role is existed or not on the same company
	 select  @IsExisted=count(1) from T_USER_ROLE WHERE UserID=@UserID and RoleID=@RoleID and CompanyID=@CompanyID and  BusinessID is null 
	 DELETE FROM T_USER_ROLE WHERE USERID=@UserID and CompanyID=@CompanyID AND ROLEID!=@RoleID -- 删除不是这个role的所有权限，如果存在
	 if(@IsExisted =0)
		 BEGIN
			INSERT T_USER_ROLE (UserRoleID, UserID,RoleID,BUSINESSID, CompanyID)
			VALUES(NEWID(),@UserID,@RoleID,null,@CompanyID);
		 END
END
ELSE IF (@RoleID=4)
BEGIN
	DELETE FROM T_USER_ROLE WHERE USERID=@UserID and CompanyID=@CompanyID AND BUSINESSID is null -- 删除用户在公司管理员权限
	 -- get if the current role is existed or not on the same company
	 select  @IsExisted=count(1) from T_USER_ROLE WHERE UserID=@UserID and RoleID=@RoleID and CompanyID=@CompanyID and  BUSINESSID= @BusinessID 	 
	 if(@IsExisted =0)
		 BEGIN
			INSERT T_USER_ROLE (UserRoleID, UserID,RoleID,BUSINESSID, CompanyID)
			VALUES(NEWID(),@UserID,@RoleID,@BusinessID,@CompanyID);
		 END
END
end
GO

