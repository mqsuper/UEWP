USE [UEWP]
GO

/****** Object:  Table [dbo].[T_TEMPLATE]    Script Date: 8/14/2016 3:03:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_BUSINESS](
	[BUSINESSID] [int] PRIMARY key NOT NULL,
	[ComanyId] [int] NULL,
	[BUSINESSName] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
)

GO


