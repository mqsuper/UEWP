ALTER PROC  AddCompany
(
	@CompanyName nvarchar(200),
	@CompanyAddress nvarchar(300),
	@CompanyPhone nvarchar(50),
	@CompanyContactor nvarchar (50),
	@IsActive bit,
	@ApprovalStatus bit, 
	@Level int,
	@CompanyID int output,
	@ApplyUserID Uniqueidentifier
)

AS
BEGIN
	INSERT T_COMPANY (CompanyName, ComanyAddress, CompanyContactor,  CompanyPhone, IsActive, ApprovalStatus, Level,ApplyUserID)
	values
	(@CompanyName, @CompanyAddress, @CompanyContactor, @CompanyPhone, @IsActive, @ApprovalStatus, @Level,@ApplyUserID )

	set @CompanyID=SCOPE_IDENTITY();
	select @CompanyID;

END