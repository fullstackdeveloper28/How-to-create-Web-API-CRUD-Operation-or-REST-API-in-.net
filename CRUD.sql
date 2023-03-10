

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 02/06/2023 00:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](50) NULL,
	[LOGIN_NAME] [nvarchar](50) NULL,
	[PASSWORD] [nvarchar](50) NULL,
	[MOBILE] [nvarchar](50) NULL,
 CONSTRAINT [PK_Registration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Registration] ON
INSERT [dbo].[Registration] ([ID], [NAME], [LOGIN_NAME], [PASSWORD], [MOBILE]) VALUES (1, N's k parimal', N'parimal', N'admin123', N'7777777777')
INSERT [dbo].[Registration] ([ID], [NAME], [LOGIN_NAME], [PASSWORD], [MOBILE]) VALUES (2, N'Mohan Kumar', N'mohan', N'admin123', N'6666666666')
SET IDENTITY_INSERT [dbo].[Registration] OFF
/****** Object:  Table [dbo].[Login]    Script Date: 02/06/2023 00:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LOGIN_NAME] [nvarchar](50) NULL,
	[PASSWORD] [nvarchar](50) NOT NULL,
	[MOBILE] [nvarchar](50) NULL,
	[NAME] [nvarchar](50) NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Login] ON
INSERT [dbo].[Login] ([Id], [LOGIN_NAME], [PASSWORD], [MOBILE], [NAME]) VALUES (1, N'admin', N'admin', N'9999999999', N'Admin')
INSERT [dbo].[Login] ([Id], [LOGIN_NAME], [PASSWORD], [MOBILE], [NAME]) VALUES (3, N'parimal1', N'admin1231', N'8888888111', N'S K Parimal1')
INSERT [dbo].[Login] ([Id], [LOGIN_NAME], [PASSWORD], [MOBILE], [NAME]) VALUES (49, N'ramlal', N'admin', N'876987643', N'Ram Lal')
SET IDENTITY_INSERT [dbo].[Login] OFF
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateRegistration]    Script Date: 02/06/2023 00:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertUpdateRegistration]
    @ID INT,
	@NAME NVARCHAR(50),
	@LOGIN_NAME NVARCHAR(50),
	@PASSWORD NVARCHAR(50),
	@MOBILE NVARCHAR(50)
AS
BEGIN
IF(@ID =0)
 BEGIN
INSERT INTO [dbo].[Login]
           ([NAME]
           ,[LOGIN_NAME]
           ,[PASSWORD]
           ,[MOBILE])
     VALUES
           (@NAME
           ,@LOGIN_NAME
           ,@PASSWORD
           ,@MOBILE)
   END
 ELSE
  BEGIN
     UPDATE [dbo].[Login]
            SET [NAME] =@NAME
           ,[LOGIN_NAME]=@LOGIN_NAME
           ,[PASSWORD]=@PASSWORD
           ,[MOBILE]=@MOBILE
           WHERE ID=@ID
  END
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserDetails]    Script Date: 02/06/2023 00:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserDetails]
AS
BEGIN
SELECT * FROM dbo.Login
END
GO
/****** Object:  StoredProcedure [dbo].[sp_deleteUser]    Script Date: 02/06/2023 00:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_deleteUser]
	@Id INT
AS
BEGIN
	DELETE FROM DBO.Login WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[GetLoginDetails]    Script Date: 02/06/2023 00:23:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetLoginDetails]
	@loginName VARCHAR(50), 
	@password  VARCHAR(50)
AS
BEGIN
SELECT * FROM dbo.Login WHERE LOGIN_NAME=@loginName and PASSWORD=@password
END
GO
