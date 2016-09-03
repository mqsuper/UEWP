--添加业务
CREATE  [dbo].[AddBusiness]
(
	@BusinessName nvarchar(50),
	@BusinessDescription nvarchar(200),	
	@CompanyID int output,
	@IsActive bit,
	@UserName nvarchar(50),
	@BusinessID int out
)

AS
BEGIN
	INSERT T_BUSINESS(BusinessName, CompanyId, BusinessDescription,IsActive, CreatedBy,CreatedDate,ModifiedBy,ModifiedDate)
	values
	(@BusinessName,@CompanyID,@BusinessDescription,@IsActive,@UserName,getdate(),@UserName,getdate() );
	set @BusinessID=SCOPE_IDENTITY();
	select @BusinessID as 'BusinessID' ;

END
GO
--更新业务
CREATE PROC  UpdateBusiness
(
	@BusinessID int,
	@BusinessName nvarchar(50),
	@BusinessDescription nvarchar(200),		
	@UserName nvarchar(50)
)

AS
BEGIN
	UPDATE T_BUSINESS SET BusinessName=@BusinessName, BusinessDescription=@BusinessDescription, ModifiedDate=getdate(),
	ModifiedBy=@UserName
	 where BUSINESSID=@BusinessID	;

END
GO
--删除业务
CREATE PROC  DeleteBusiness
(
	@BusinessID int 	
)

AS
BEGIN
	UPDATE T_BUSINESS SET IsActive=0
	 where BUSINESSID=@BusinessID	

END
GO
--获取业务
CREATE PROC [dbo].GetAllBusiness(
@KeyWord nvarchar(max)
)
AS 
IF (@KeyWord='')
BEGIN
	SELECT * FROM T_BUSINESS 
END
ELSE
BEGIN
	SELECT * FROM T_BUSINESS WHERE BusinessName like '%'+@KeyWord+'%' 
END
GO

--根据公司获取业务
CREATE PROC [dbo].GetBusinessByCompany(
@CompanyID int,
@keyWord nvarchar(max)
)
AS 

BEGIN
	SELECT * FROM T_BUSINESS where CompanyID=@CompanyID and  BusinessName like '%'+@keyWord+'%' 
END

GO