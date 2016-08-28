USE [UEWP]
GO

/****** Object:  Table [dbo].[T_USER]    Script Date: 8/14/2016 2:56:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_USER](
	[UserID] [uniqueidentifier] NOT NULL,
	[CompanyID] [int] NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](100) NOT NULL,
	[UserPWD] [nvarchar](100) NOT NULL,
	[UserGender] [bit] NULL,
	[UserAge] [int] NULL,
	[UserPhone] [nvarchar](30) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--基础数据

DEclare @NewUserID uniqueidentifier;
set @NewUserID=newid();
INSERT T_USER (UserID, UserName,UserEmail, UserPhone,UserPWD, IsActive)
values 
(@NewUserID, 'System Admin','mqsuper@126.com','18217265225','admin',1)

INSERT T_USER_ROLE(UserRoleID,UserID,RoleID,BUSINESSID,CompanyID)
values (Newid(),@NewUserID,1,null,null)
