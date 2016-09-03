--添加公司
CREATE PROC  AddCompany
(
	@CompanyName nvarchar(200),
	@CompanyAddress nvarchar(300),
	@CompanyPhone nvarchar(50),
	@CompanyContactor nvarchar (50),
	@IsActive bit,
	@ApprovalStatus bit, 
	@Level int,
	@CompanyID int out,
	@ApplyUserID Uniqueidentifier
)

AS
BEGIN
	INSERT T_COMPANY (CompanyName, ComanyAddress, CompanyContactor,  CompanyPhone, IsActive, ApprovalStatus, Level,ApplyUserID)
	values
	(@CompanyName, @CompanyAddress, @CompanyContactor, @CompanyPhone, @IsActive, @ApprovalStatus, @Level,@ApplyUserID )

	set @CompanyID=SCOPE_IDENTITY();
	select @CompanyID as 'CompanyID';

END
GO
--更新公司
CREATE PROC  UpdateCompany
(
	@CompanyName nvarchar(200),
	@CompanyAddress nvarchar(300),
	@CompanyPhone nvarchar(50),
	@CompanyContactor nvarchar (50),	
	@Level int,
	@CompanyID int 	
)

AS
BEGIN
	UPDATE T_COMPANY SET CompanyName=@CompanyName, ComanyAddress=@CompanyAddress, CompanyContactor=@CompanyContactor, 
	 CompanyPhone=@CompanyPhone,   Level=@Level 
	 where companyID=@CompanyID	

END
GO
--删除公司
CREATE PROC  DeleteCompany
(
	@CompanyID int 	
)

AS
BEGIN
	UPDATE T_COMPANY SET IsActive=0
	 where companyID=@CompanyID	

END
GO
--获取公司
CREATE PROC [dbo].GetAllCompanies(
@KeyWord nvarchar(50)
)
AS 
IF (@KeyWord='')
BEGIN
	SELECT * FROM T_COMPANY 
END
ELSE
BEGIN
	SELECT * FROM T_COMPANY WHERE COMPANYNAME like '%'+@KeyWord+'%'
END
GO

