USE [zoneNet]
GO
SET IDENTITY_INSERT [dbo].[optHandleState] ON 

INSERT [dbo].[optHandleState] ([C00], [C01]) VALUES (1, N'待办')
INSERT [dbo].[optHandleState] ([C00], [C01]) VALUES (2, N'办理中')
INSERT [dbo].[optHandleState] ([C00], [C01]) VALUES (3, N'完成')
SET IDENTITY_INSERT [dbo].[optHandleState] OFF
SET IDENTITY_INSERT [dbo].[optInfoType] ON 

INSERT [dbo].[optInfoType] ([T00], [T01]) VALUES (1, N'最新资讯')
INSERT [dbo].[optInfoType] ([T00], [T01]) VALUES (2, N'人事人才')
INSERT [dbo].[optInfoType] ([T00], [T01]) VALUES (3, N'社保')
INSERT [dbo].[optInfoType] ([T00], [T01]) VALUES (4, N'医保')
SET IDENTITY_INSERT [dbo].[optInfoType] OFF
SET IDENTITY_INSERT [dbo].[optQuestion] ON 

INSERT [dbo].[optQuestion] ([Q00], [Q01]) VALUES (1, N'人事人才')
INSERT [dbo].[optQuestion] ([Q00], [Q01]) VALUES (2, N'社保')
INSERT [dbo].[optQuestion] ([Q00], [Q01]) VALUES (3, N'医保')
INSERT [dbo].[optQuestion] ([Q00], [Q01]) VALUES (4, N'劳动政策')
INSERT [dbo].[optQuestion] ([Q00], [Q01]) VALUES (5, N'其它')
SET IDENTITY_INSERT [dbo].[optQuestion] OFF
SET IDENTITY_INSERT [dbo].[optUserType] ON 

INSERT [dbo].[optUserType] ([A00], [A01]) VALUES (1, N'园区联系人')
INSERT [dbo].[optUserType] ([A00], [A01]) VALUES (2, N'内部工作人员')
INSERT [dbo].[optUserType] ([A00], [A01]) VALUES (3, N'管理员')
INSERT [dbo].[optUserType] ([A00], [A01]) VALUES (4, N'系统管理员')
SET IDENTITY_INSERT [dbo].[optUserType] OFF
