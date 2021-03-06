USE [zoneNet]
GO
/****** Object:  Table [dbo].[optHandleState]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[optHandleState](
	[C00] [int] IDENTITY(1,1) NOT NULL,
	[C01] [nvarchar](50) NULL,
 CONSTRAINT [PK_optHandleState] PRIMARY KEY CLUSTERED 
(
	[C00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[optInfoType]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[optInfoType](
	[T00] [int] IDENTITY(1,1) NOT NULL,
	[T01] [nvarchar](50) NULL,
 CONSTRAINT [PK__optInfoT__C45609DEA24BCCDD] PRIMARY KEY CLUSTERED 
(
	[T00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[optQuestion]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[optQuestion](
	[Q00] [int] IDENTITY(1,1) NOT NULL,
	[Q01] [nvarchar](50) NULL,
 CONSTRAINT [PK_optQuestion] PRIMARY KEY CLUSTERED 
(
	[Q00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[optUserType]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[optUserType](
	[A00] [int] IDENTITY(1,1) NOT NULL,
	[A01] [nvarchar](50) NULL,
 CONSTRAINT [PK_optUserType] PRIMARY KEY CLUSTERED 
(
	[A00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableApply]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableApply](
	[B00] [int] IDENTITY(1,1) NOT NULL,
	[B01] [int] NULL,
	[B02] [int] NULL,
	[B03] [nvarchar](100) NULL,
	[B04] [text] NULL,
	[B05] [datetime] NULL,
	[B06] [int] NULL,
	[B07] [datetime] NULL,
	[B08] [int] NULL,
	[B09] [int] NULL,
	[B10] [text] NULL,
	[B12] [text] NULL,
 CONSTRAINT [PK_TableApply] PRIMARY KEY CLUSTERED 
(
	[B00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableHandleState]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableHandleState](
	[D00] [int] IDENTITY(1,1) NOT NULL,
	[D01] [int] NULL,
	[D02] [int] NULL,
	[D03] [int] NULL,
	[D04] [text] NULL,
	[D05] [datetime] NULL,
 CONSTRAINT [PK_TableHandleState_1] PRIMARY KEY CLUSTERED 
(
	[D00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableInfo]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableInfo](
	[I00] [int] IDENTITY(1,1) NOT NULL,
	[I01] [int] NULL,
	[I02] [nvarchar](255) NULL,
	[I03] [ntext] NULL,
	[I04] [datetime] NULL,
	[I05] [nvarchar](255) NULL,
	[I06] [datetime] NULL,
	[I07] [nvarchar](255) NULL,
	[I08] [datetime] NULL,
	[I09] [int] NULL,
 CONSTRAINT [PK_TableInfo] PRIMARY KEY CLUSTERED 
(
	[I00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableUpfile]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableUpfile](
	[F00] [int] IDENTITY(1,1) NOT NULL,
	[F01] [int] NULL,
	[F02] [nvarchar](50) NULL,
	[F03] [datetime] NULL,
	[F04] [nvarchar](50) NULL,
	[F05] [nvarchar](50) NULL,
	[F06] [bit] NULL,
	[F07] [int] NULL,
	[F08] [int] NULL,
 CONSTRAINT [PK_TableUpfile] PRIMARY KEY CLUSTERED 
(
	[F00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TableUser]    Script Date: 2016-10-11 10:27:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableUser](
	[U00] [int] IDENTITY(1,1) NOT NULL,
	[U01] [nvarchar](50) NULL,
	[U02] [nvarchar](50) NULL,
	[U03] [nvarchar](50) NULL,
	[U04] [nvarchar](50) NULL,
	[U05] [nvarchar](50) NULL,
	[U06] [nvarchar](50) NULL,
	[U07] [nvarchar](50) NULL,
	[U08] [nvarchar](50) NULL,
	[U09] [nvarchar](50) NULL,
	[U10] [nvarchar](50) NULL,
	[U11] [nvarchar](50) NULL,
	[U12] [nvarchar](50) NULL,
	[U13] [nvarchar](50) NULL,
	[U14] [datetime] NULL,
	[U15] [text] NULL,
	[U16] [int] NULL,
	[U17] [bit] NULL,
 CONSTRAINT [PK_TableUser] PRIMARY KEY CLUSTERED 
(
	[U00] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[TableApply] ADD  CONSTRAINT [DF_TableApply_B08]  DEFAULT ((0)) FOR [B08]
GO
ALTER TABLE [dbo].[TableApply] ADD  CONSTRAINT [DF_TableApply_B09]  DEFAULT ((0)) FOR [B09]
GO
ALTER TABLE [dbo].[TableInfo] ADD  CONSTRAINT [DF_TableInfo_I06]  DEFAULT (getdate()) FOR [I06]
GO
ALTER TABLE [dbo].[TableInfo] ADD  CONSTRAINT [DF_TableInfo_I09]  DEFAULT ((0)) FOR [I09]
GO
ALTER TABLE [dbo].[TableUpfile] ADD  CONSTRAINT [DF_TableUpfile_F06]  DEFAULT ((1)) FOR [F06]
GO
ALTER TABLE [dbo].[TableUser] ADD  CONSTRAINT [DF_TableUser_U01]  DEFAULT (N'0000000000') FOR [U01]
GO
ALTER TABLE [dbo].[TableUser] ADD  CONSTRAINT [DF_TableUser_U17]  DEFAULT ((1)) FOR [U17]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'optHandleState', @level2type=N'COLUMN',@level2name=N'C01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提问用户编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题类别编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'标题' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'问题说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'提交时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复人编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'答复时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理状态编码' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'当前跟进人员编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回复内容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'内部备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableApply', @level2type=N'COLUMN',@level2name=N'B12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联apply表B00' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableHandleState', @level2type=N'COLUMN',@level2name=N'D01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableHandleState', @level2type=N'COLUMN',@level2name=N'D02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流转人编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableHandleState', @level2type=N'COLUMN',@level2name=N'D03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理意见' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableHandleState', @level2type=N'COLUMN',@level2name=N'D04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'处理时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableHandleState', @level2type=N'COLUMN',@level2name=N'D05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联问题编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文件名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上传时间' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'临时id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'显示文件名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'附件类别，区分客户与后台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'关联用户编号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUpfile', @level2type=N'COLUMN',@level2name=N'F08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'权限编码-1：用户登录；2：客户页面；3：工作人员页面；4、管理员页面' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U01'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'账号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U02'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密码md5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U03'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U04'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'单位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U05'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'职务' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U06'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'固话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U07'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手机' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U08'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'传真' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U09'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U10'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'QQ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U11'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'邮编' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U13'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'开户日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U14'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U15'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户类别-关联optUsertype' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U16'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效状态' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TableUser', @level2type=N'COLUMN',@level2name=N'U17'
GO
