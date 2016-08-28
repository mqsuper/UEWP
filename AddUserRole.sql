CREATE PROC AddUserRole(
@UserID uniqueidentifier,
@RoleID int,
@BusinessID int,
@CompanyID int
)
as

BEGIN
INSERT T_USER_ROLE (UserRoleID, UserID,RoleID,BUSINESSID,CompanyID)
VALUES(NEWID(),@UserID,@RoleID,@BusinessID,@CompanyID);
END 