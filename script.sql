USE [sample ]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 5/16/2019 8:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Employee](
	[emp_id] [int] IDENTITY(1,1) NOT NULL,
	[emp_name] [nvarchar](50) NULL,
	[sex] [char](1) NULL,
	[emp_position] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[roles]    Script Date: 5/16/2019 8:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emp_no] [int] NULL,
	[role] [varchar](255) NULL DEFAULT (NULL),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[getAllEmployee]    Script Date: 5/16/2019 8:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getAllEmployee] 
	-- Add the parameters for the stored procedure here

AS
BEGIN
	select * from Employee
END

GO
/****** Object:  StoredProcedure [dbo].[getemployeebyId]    Script Date: 5/16/2019 8:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getemployeebyId] 
 @id int 
 AS
BEGIN
	select * from Employee where emp_id=@id
END

GO
/****** Object:  StoredProcedure [dbo].[getemployeebyname]    Script Date: 5/16/2019 8:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[getemployeebyname]
 @name nvarchar(50)
 as 
 begin
 select * from Employee 
 where emp_name = @name
 end 
GO
/****** Object:  StoredProcedure [dbo].[getemployeebysex]    Script Date: 5/16/2019 8:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[getemployeebysex] 
 @sex  char(1),
 @emppos varchar(20) 
 AS
BEGIN
	select * from Employee where sex = @sex and emp_position=@emppos
END

GO
/****** Object:  StoredProcedure [dbo].[insertemployee]    Script Date: 5/16/2019 8:41:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertemployee] @emp_name         VARCHAR(50), 
                                    @sex            CHAR(1), 
                                    @emp_position  VARCHAR(50) 
AS 
  BEGIN 
      INSERT INTO Employee 
                  (emp_name, 
                   sex, 
                   emp_position) 
      VALUES      (@emp_name, 
                   @sex, 
                   @emp_position) 
  END
GO
