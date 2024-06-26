USE [master]
GO
/****** Object:  Database [Project_CIMB]    Script Date: 06/06/2024 18:15:32 ******/
CREATE DATABASE [Project_CIMB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Project_CIMB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_CIMB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Project_CIMB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Project_CIMB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Project_CIMB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Project_CIMB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Project_CIMB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Project_CIMB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Project_CIMB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Project_CIMB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Project_CIMB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Project_CIMB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Project_CIMB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Project_CIMB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Project_CIMB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Project_CIMB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Project_CIMB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Project_CIMB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Project_CIMB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Project_CIMB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Project_CIMB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Project_CIMB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Project_CIMB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Project_CIMB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Project_CIMB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Project_CIMB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Project_CIMB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Project_CIMB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Project_CIMB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Project_CIMB] SET  MULTI_USER 
GO
ALTER DATABASE [Project_CIMB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Project_CIMB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Project_CIMB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Project_CIMB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Project_CIMB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Project_CIMB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Project_CIMB] SET QUERY_STORE = OFF
GO
USE [Project_CIMB]
GO
/****** Object:  Table [dbo].[DetailKaryawan]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailKaryawan](
	[KaryawanID] [varchar](10) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[EmailAddress] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[BirthDate] [datetime] NULL,
	[BirthPlace] [nchar](200) NULL,
	[MaritalSatus] [varchar](50) NULL,
	[Gender] [nchar](4) NULL,
	[Other] [nchar](60) NULL,
	[HP] [nchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_DetailKaryawan] PRIMARY KEY CLUSTERED 
(
	[KaryawanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchID] [varchar](10) NOT NULL,
	[BranchFullName] [varchar](100) NULL,
	[BranchAddress] [varchar](200) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[dept_id] [nchar](16) NOT NULL,
	[dept_parentid] [nchar](20) NULL,
	[dept_name] [nchar](100) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[dept_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblGenderType]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblGenderType](
	[GenderTypeID] [varchar](10) NOT NULL,
	[GenderTypeDescription] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_TblGenderType] PRIMARY KEY CLUSTERED 
(
	[GenderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOffice]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOffice](
	[OfficeID] [nchar](8) NOT NULL,
	[OfficeDescription] [nchar](120) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_TblOffice] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Karyawan]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Karyawan](
	[BranchID] [varchar](10) NOT NULL,
	[KaryawanID] [varchar](10) NOT NULL,
	[Isactive] [bit] NULL,
	[Dept_ID] [nchar](16) NULL,
	[OfficeID] [nchar](8) NULL,
	[PositionID] [nchar](16) NULL,
 CONSTRAINT [PK_Karyawan_1] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC,
	[KaryawanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[KaryawanDetails]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[KaryawanDetails] AS
SELECT 
    K.KaryawanID AS KaryawanID,
    B.BranchFullName AS Branch,
    D.dept_name AS Department,
    O.OfficeDescription AS Office,
    CONCAT(DK.FirstName, ' ', DK.MiddleName, ' ', DK.LastName) AS Nama,
    DK.EmailAddress AS Email,
    G.GenderTypeDescription AS Gender,
    K.Isactive AS IsActive
FROM 
    Karyawan K
    INNER JOIN DetailKaryawan DK ON K.KaryawanID = DK.KaryawanID
    INNER JOIN Branch B ON K.BranchID = B.BranchID
    INNER JOIN Departments D ON K.Dept_ID = D.dept_id
    INNER JOIN TblOffice O ON K.OfficeID = O.OfficeID
    INNER JOIN TblGenderType G ON DK.Gender = G.GenderTypeID;
GO
/****** Object:  Table [dbo].[Anggota]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Anggota](
	[BranchID] [varchar](10) NOT NULL,
	[KaryawanID] [varchar](10) NOT NULL,
	[AnggotaID] [varchar](20) NULL,
	[Plafond] [varchar](5) NULL,
	[isValid] [bit] NULL,
	[void] [bit] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC,
	[KaryawanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[migrations]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[version] [varchar](255) NOT NULL,
	[class] [varchar](255) NOT NULL,
	[group] [varchar](255) NOT NULL,
	[namespace] [varchar](255) NOT NULL,
	[time] [int] NOT NULL,
	[batch] [int] NOT NULL,
 CONSTRAINT [pk_migrations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblMaritalStatus]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblMaritalStatus](
	[MaritalStatusID] [varchar](10) NOT NULL,
	[MaritalStatusDescription] [varchar](50) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_TblMaritalStatus] PRIMARY KEY CLUSTERED 
(
	[MaritalStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPlafond]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPlafond](
	[PlafondID] [varchar](5) NOT NULL,
	[Amount] [money] NULL,
	[PlafondDescription] [nchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_TblPlafond] PRIMARY KEY CLUSTERED 
(
	[PlafondID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblPosition]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblPosition](
	[PositionID] [nchar](16) NOT NULL,
	[PositionDescription] [nchar](100) NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_TblPosition] PRIMARY KEY CLUSTERED 
(
	[PositionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Anggota]  WITH CHECK ADD  CONSTRAINT [FK_Anggota_DetailKaryawan] FOREIGN KEY([KaryawanID])
REFERENCES [dbo].[DetailKaryawan] ([KaryawanID])
GO
ALTER TABLE [dbo].[Anggota] CHECK CONSTRAINT [FK_Anggota_DetailKaryawan]
GO
ALTER TABLE [dbo].[Anggota]  WITH CHECK ADD  CONSTRAINT [FK_Anggota_TblPlafond] FOREIGN KEY([Plafond])
REFERENCES [dbo].[TblPlafond] ([PlafondID])
GO
ALTER TABLE [dbo].[Anggota] CHECK CONSTRAINT [FK_Anggota_TblPlafond]
GO
ALTER TABLE [dbo].[Karyawan]  WITH CHECK ADD  CONSTRAINT [FK_Karyawan_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Karyawan] CHECK CONSTRAINT [FK_Karyawan_Branch]
GO
ALTER TABLE [dbo].[Karyawan]  WITH CHECK ADD  CONSTRAINT [FK_Karyawan_Departments] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[Departments] ([dept_id])
GO
ALTER TABLE [dbo].[Karyawan] CHECK CONSTRAINT [FK_Karyawan_Departments]
GO
ALTER TABLE [dbo].[Karyawan]  WITH CHECK ADD  CONSTRAINT [FK_Karyawan_DetailKaryawan] FOREIGN KEY([KaryawanID])
REFERENCES [dbo].[DetailKaryawan] ([KaryawanID])
GO
ALTER TABLE [dbo].[Karyawan] CHECK CONSTRAINT [FK_Karyawan_DetailKaryawan]
GO
ALTER TABLE [dbo].[Karyawan]  WITH CHECK ADD  CONSTRAINT [FK_Karyawan_TblOffice] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[TblOffice] ([OfficeID])
GO
ALTER TABLE [dbo].[Karyawan] CHECK CONSTRAINT [FK_Karyawan_TblOffice]
GO
ALTER TABLE [dbo].[Karyawan]  WITH CHECK ADD  CONSTRAINT [FK_Karyawan_TblPosition] FOREIGN KEY([PositionID])
REFERENCES [dbo].[TblPosition] ([PositionID])
GO
ALTER TABLE [dbo].[Karyawan] CHECK CONSTRAINT [FK_Karyawan_TblPosition]
GO
/****** Object:  StoredProcedure [dbo].[sp_AddAnggota]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddAnggota] 
    @BranchID VARCHAR(10),
    @KaryawanID VARCHAR(10),
    @AnggotaID VARCHAR(20),
    @Plafond VARCHAR(5),
    @isValid BIT,
    @void BIT,
    @ModifiedDate DATETIME
AS
BEGIN
    INSERT INTO Anggota (BranchID, KaryawanID, AnggotaID, Plafond, isValid, void, ModifiedDate)
    VALUES (@BranchID, @KaryawanID, @AnggotaID, @Plafond, @isValid, @void, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBranch]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddBranch] 
    @BranchID VARCHAR(10),
    @BranchFullName VARCHAR(100),
    @BranchAddress VARCHAR(200),
    @ModifiedDate DATETIME
AS
BEGIN
    INSERT INTO Branch (BranchID, BranchFullName, BranchAddress, ModifiedDate)
    VALUES (@BranchID, @BranchFullName, @BranchAddress, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddDepartment]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddDepartment] 
    @dept_id NCHAR(16),
    @dept_parentid NCHAR(20),
    @dept_name NCHAR(100)
AS
BEGIN
    INSERT INTO Departments (dept_id, dept_parentid, dept_name)
    VALUES (@dept_id, @dept_parentid, @dept_name)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddGenderType]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddGenderType] 
    @GenderTypeID VARCHAR(10),
    @GenderTypeDescription VARCHAR(50),
    @ModifiedDate DATETIME
AS
BEGIN
    INSERT INTO TblGenderType (GenderTypeID, GenderTypeDescription, ModifiedDate)
    VALUES (@GenderTypeID, @GenderTypeDescription, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddKaryawan]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AddKaryawan] 
    @BranchID VARCHAR(10),
    @KaryawanID VARCHAR(10),
    @Isactive BIT,
    @Dept_ID NCHAR(16),
    @OfficeID NCHAR(8),
    @PositionID NCHAR(16),
	@FirstName VARCHAR(50),
	@MiddleName VARCHAR(50),
	@LastName VARCHAR(50),
	@EmailAddress VARCHAR(50),
	@Phone VARCHAR(50),
	@BirthDate DATETIME,
	@BirthPlace VARCHAR(200),
	@MaritalStatus VARCHAR(50),
	@Gender NCHAR(4),
	@Other NCHAR(60),
	@HP NCHAR(100)

AS
BEGIN
    INSERT INTO Karyawan (BranchID, KaryawanID, Isactive, Dept_ID, OfficeID, PositionID)
    VALUES (@BranchID, @KaryawanID, @Isactive, @Dept_ID, @OfficeID, @PositionID)

	INSERT INTO DetailKaryawan(KaryawanID, FirstName, MiddleName, LastName, EmailAddress, Phone,
	BirthDate, BirthPlace, MaritalSatus, Gender, Other, HP, ModifiedDate)
	VALUES (@KaryawanID, @FirstName, @MiddleName, @LastName, @EmailAddress, @Phone, 
	@BirthDate, @BirthPlace, @MaritalStatus, @Gender, @Other, @HP, GETDATE())

END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddMaritalStatus]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddMaritalStatus] 
    @MaritalStatusID VARCHAR(10),
    @MaritalStatusDescription VARCHAR(50),
    @ModifiedDate DATETIME
AS
BEGIN
    INSERT INTO TblMaritalStatus (MaritalStatusID, MaritalStatusDescription, ModifiedDate)
    VALUES (@MaritalStatusID, @MaritalStatusDescription, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddOffice]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddOffice] 
    @OfficeID NCHAR(8),
    @OfficeDescription NCHAR(120),
    @ModifiedDate DATETIME
AS
BEGIN
    INSERT INTO TblOffice (OfficeID, OfficeDescription, ModifiedDate)
    VALUES (@OfficeID, @OfficeDescription, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddPlafond]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddPlafond] 
    @PlafondID NCHAR(16),
    @Amount MONEY,
    @PlafondDescription NCHAR(100),
    @ModifiedDate DATETIME
AS
BEGIN
    INSERT INTO TblPlafond (PlafondID, Amount, PlafondDescription, ModifiedDate)
    VALUES (@PlafondID, @Amount, @PlafondDescription, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AddPosition]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddPosition] 
    @PositionID NCHAR(16),
    @PositionDescription NCHAR(100),
    @ModifiedDate DATETIME
AS
BEGIN
    INSERT INTO TblPosition (PositionID, PositionDescription, ModifiedDate)
    VALUES (@PositionID, @PositionDescription, @ModifiedDate)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAnggota]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteAnggota] 
    @BranchID VARCHAR(10),
    @KaryawanID VARCHAR(10),
    @AnggotaID VARCHAR(20)
AS
BEGIN
    DELETE FROM Anggota WHERE BranchID = @BranchID AND KaryawanID = @KaryawanID AND AnggotaID = @AnggotaID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteBranch]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteBranch] 
    @BranchID VARCHAR(10)
AS
BEGIN
    DELETE FROM Branch WHERE BranchID = @BranchID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteDepartment]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteDepartment] 
    @dept_id NCHAR(16)
AS
BEGIN
    DELETE FROM Departments WHERE dept_id = @dept_id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteGenderType]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteGenderType] 
    @GenderTypeID VARCHAR(10)
AS
BEGIN
    DELETE FROM TblGenderType WHERE GenderTypeID = @GenderTypeID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteKaryawan]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteKaryawan] 
    @KaryawanID VARCHAR(10)
AS
BEGIN
    DELETE FROM Karyawan WHERE KaryawanID = @KaryawanID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteMaritalStatus]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteMaritalStatus] 
    @MaritalStatusID VARCHAR(10)
AS
BEGIN
    DELETE FROM TblMaritalStatus WHERE MaritalStatusID = @MaritalStatusID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteOffice]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteOffice] 
    @OfficeID NCHAR(8)
AS
BEGIN
    DELETE FROM TblOffice WHERE OfficeID = @OfficeID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePlafond]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeletePlafond] 
    @PlafondID NCHAR(16)
AS
BEGIN
    DELETE FROM TblPlafond WHERE PlafondID = @PlafondID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePosition]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeletePosition] 
    @PositionID NCHAR(16)
AS
BEGIN
    DELETE FROM TblPosition WHERE PositionID = @PositionID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditAnggota]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditAnggota] 
    @BranchID VARCHAR(10),
    @KaryawanID VARCHAR(10),
    @AnggotaID VARCHAR(20),
    @Plafond VARCHAR(5),
    @isValid BIT,
    @void BIT,
    @ModifiedDate DATETIME
AS
BEGIN
    UPDATE Anggota
    SET Plafond = @Plafond,
        isValid = @isValid,
        void = @void,
        ModifiedDate = @ModifiedDate
    WHERE BranchID = @BranchID AND KaryawanID = @KaryawanID AND AnggotaID = @AnggotaID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditBranch]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditBranch] 
    @BranchID VARCHAR(10),
    @BranchFullName VARCHAR(100),
    @BranchAddress VARCHAR(200),
    @ModifiedDate DATETIME
AS
BEGIN
    UPDATE Branch
    SET BranchFullName = @BranchFullName,
        BranchAddress = @BranchAddress,
        ModifiedDate = @ModifiedDate
    WHERE BranchID = @BranchID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditDepartment]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditDepartment] 
    @dept_id NCHAR(16),
    @dept_parentid NCHAR(20),
    @dept_name NCHAR(100)
AS
BEGIN
    UPDATE Departments
    SET dept_parentid = @dept_parentid,
        dept_name = @dept_name
    WHERE dept_id = @dept_id
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditGenderType]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditGenderType] 
    @GenderTypeID VARCHAR(10),
    @GenderTypeDescription VARCHAR(50),
    @ModifiedDate DATETIME
AS
BEGIN
    UPDATE TblGenderType
    SET GenderTypeDescription = @GenderTypeDescription,
        ModifiedDate = @ModifiedDate
    WHERE GenderTypeID = @GenderTypeID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditKaryawan]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EditKaryawan] 
    @BranchID VARCHAR(10),
    @KaryawanID VARCHAR(10),
    @Isactive BIT,
    @Dept_ID NCHAR(16),
    @OfficeID NCHAR(8),
    @PositionID NCHAR(16),
	@FirstName VARCHAR(50),
	@MiddleName VARCHAR(50),
	@LastName VARCHAR(50),
	@EmailAddress VARCHAR(50),
	@Phone VARCHAR(50),
	@BirthDate DATETIME,
	@BirthPlace VARCHAR(200),
	@MaritalStatus VARCHAR(50),
	@Gender NCHAR(4),
	@Other NCHAR(60),
	@HP NCHAR(100)


AS
BEGIN
    UPDATE Karyawan
    SET BranchID = @BranchID,
        Isactive = @Isactive,
        Dept_ID = @Dept_ID,
        OfficeID = @OfficeID,
        PositionID = @PositionID
    WHERE KaryawanID = @KaryawanID

	UPDATE DetailKaryawan
	SET 
	FirstName = @FirstName,
	MiddleName = @MiddleName,
	LastName = @LastName,
	EmailAddress = @EmailAddress,
	Phone = @Phone,
	BirthDate = @BirthDate,
	BirthPlace = @BirthPlace,
	MaritalSatus = @MaritalStatus,
	Gender = @Gender,
	Other = @Other,
	HP = @HP,
	ModifiedDate = GETDATE()
	WHERE KaryawanID = @KaryawanID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditMaritalStatus]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditMaritalStatus] 
    @MaritalStatusID VARCHAR(10),
    @MaritalStatusDescription VARCHAR(50),
    @ModifiedDate DATETIME
AS
BEGIN
    UPDATE TblMaritalStatus
    SET MaritalStatusDescription = @MaritalStatusDescription,
        ModifiedDate = @ModifiedDate
    WHERE MaritalStatusID = @MaritalStatusID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditOffice]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditOffice] 
    @OfficeID NCHAR(8),
    @OfficeDescription NCHAR(120),
    @ModifiedDate DATETIME
AS
BEGIN
    UPDATE TblOffice
    SET OfficeDescription = @OfficeDescription,
        ModifiedDate = @ModifiedDate
    WHERE OfficeID = @OfficeID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditPlafond]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditPlafond] 
    @PlafondID NCHAR(16),
    @Amount MONEY,
    @PlafondDescription NCHAR(100),
    @ModifiedDate DATETIME
AS
BEGIN
    UPDATE TblPlafond
    SET Amount = @Amount,
        PlafondDescription = @PlafondDescription,
        ModifiedDate = @ModifiedDate
    WHERE PlafondID = @PlafondID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EditPosition]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_EditPosition] 
    @PositionID NCHAR(16),
    @PositionDescription NCHAR(100),
    @ModifiedDate DATETIME
AS
BEGIN
    UPDATE TblPosition
    SET PositionDescription = @PositionDescription,
        ModifiedDate = @ModifiedDate
    WHERE PositionID = @PositionID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewAnggota]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewAnggota]
AS
BEGIN
    SELECT * FROM Anggota
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewBranch]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewBranch]
AS
BEGIN
    SELECT * FROM Branch
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewDepartment]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewDepartment]
AS
BEGIN
    SELECT * FROM Departments
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewGenderType]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewGenderType]
AS
BEGIN
    SELECT * FROM TblGenderType
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewKaryawan]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewKaryawan]
AS
BEGIN
    SELECT * FROM Karyawan
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewMaritalStatus]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewMaritalStatus]
AS
BEGIN
    SELECT * FROM TblMaritalStatus
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewOffice]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewOffice]
AS
BEGIN
    SELECT * FROM TblOffice
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewPlafond]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewPlafond]
AS
BEGIN
    SELECT * FROM TblPlafond
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ViewPosition]    Script Date: 06/06/2024 18:15:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ViewPosition]
AS
BEGIN
    SELECT * FROM TblPosition
END
GO
USE [master]
GO
ALTER DATABASE [Project_CIMB] SET  READ_WRITE 
GO
