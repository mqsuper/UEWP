alter PROC AddUser(
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