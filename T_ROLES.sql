	USE [UEWP]
	GO

	/****** Object:  Table [dbo].[T_USER]    Script Date: 8/14/2016 2:56:41 PM ******/
	SET ANSI_NULLS ON
	GO

	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE [dbo].[M_ROLES](
		[RoleID] [Int] identity (1,1) NOT NULL,	
		[RoleName] [nvarchar](50) NOT NULL,
		[RoleDescription] [nvarchar](100) NOT NULL,
		
	
	PRIMARY KEY CLUSTERED 
	(
		[RoleID] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]

	GO

insert M_Roles (RoleName, RoleDescription) values ('SystemAdmin','System Admin');
insert M_Roles (RoleName, RoleDescription) values ('EnterpriseAdmin','Enterprise Admin');
insert M_Roles (RoleName, RoleDescription) values ('Business Admin','Business Admin');
insert M_Roles (RoleName, RoleDescription) values ('NormalUser','Normal User');

