USE [UEWP]
GO

/****** Object:  Table [dbo].[T_TEMPLATE]    Script Date: 8/14/2016 3:12:14 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_TEMPLATE](
	[TemplateID] [int] NOT NULL,
	[ComanyId] [int] NULL,
	[BusinessID] [int] NULL,
	[TemplateName] [nvarchar](50) NOT NULL,
	[TemplateStructure] [xml] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [nvarchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
	[ProcessID] [int] NULL,
	[Status] bit,
PRIMARY KEY CLUSTERED 
(
	[TemplateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


