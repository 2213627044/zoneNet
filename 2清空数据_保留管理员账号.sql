use zoneNet
truncate table [dbo].[TableApply]
truncate table [dbo].[TableHandleState]
truncate table [dbo].[TableInfo]
truncate table [dbo].[TableUpfile]
truncate table [dbo].[TableUser]

SET IDENTITY_INSERT [dbo].[TableUser] ON 
GO
INSERT [dbo].[TableUser] ([U00], [U01], [U02], [U03], [U04], [U05], [U06], [U07], [U08], [U09], [U10], [U11], [U12], [U13], [U14], [U15], [U16], [U17]) VALUES (1, N'1111111111', N'admin', N'A50B407B0E4106420CB23A49CA1AA770', N'Ö£×Óè¤', N'', N'', N'', N'', N'', N'', N'', N'', N'', NULL, N'', 4, 1)
GO
SET IDENTITY_INSERT [dbo].[TableUser] OFF
GO
