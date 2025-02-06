USE [master]
GO

CREATE DATABASE [prj301_1820_06]
 
USE [prj301_1820_06]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NULL,
	[fullName] [nvarchar](50) NULL,
	[roleID] [char](2) NULL,
	[password] [varchar](50) NULL
) ON [PRIMARY]
GO

INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'QL002', N'Administrator', N'AD', N'1')
INSERT [dbo].[tblUsers] ([userID], [fullName], [roleID], [password]) VALUES (N'SE003', N'I am User', N'US', N'1')
GO