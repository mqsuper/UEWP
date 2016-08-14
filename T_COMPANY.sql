USE [UEWP]
GO

/****** Object:  Table [dbo].[T_COMPANY]    Script Date: 8/14/2016 2:54:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_COMPANY](
	[CompanyID] [int] NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[ComanyAddress] [nvarchar](300) NOT NULL,
	[CompanyPhone] [nvarchar](30) NULL,
	[CompanyContactor] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[ApprovalStatus] [int] NULL,
	[Level] int,
PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


