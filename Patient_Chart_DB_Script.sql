/*
Version 1.0
BV Srinivas
01 Aug 2021
Patient Chart complete Script

server and port:  patient-chart-dev-db.foundationai.com
user sa password: Dx0(083ldls*27
port: 1433
its open for VPN

server: patient-chart-dev-db.foundationai.com
port: 1433
user name: PatChart_FAI
password: CAI$oluti0n$
Note: available only over VPN

*/

USE [master]
GO
/****** Object:  Database [PatientChart]    Script Date: 8/11/2021 12:28:27 PM ******/
--drop DATABASE [PatientChart]

CREATE DATABASE [PatientChart]
GO
ALTER DATABASE [PatientChart] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PatientChart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PatientChart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PatientChart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PatientChart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PatientChart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PatientChart] SET ARITHABORT OFF 
GO
ALTER DATABASE [PatientChart] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PatientChart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PatientChart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PatientChart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PatientChart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PatientChart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PatientChart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PatientChart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PatientChart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PatientChart] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PatientChart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PatientChart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PatientChart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PatientChart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PatientChart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PatientChart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PatientChart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PatientChart] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PatientChart] SET  MULTI_USER 
GO
ALTER DATABASE [PatientChart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PatientChart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PatientChart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PatientChart] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PatientChart] SET DELAYED_DURABILITY = DISABLED 
GO
--ALTER DATABASE [PatientChart] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PatientChart] SET QUERY_STORE = OFF
GO
USE [PatientChart]
GO
/****** Object:  Schema [pac]    Script Date: 8/11/2021 12:28:34 PM ******/
CREATE SCHEMA [pac]
GO
/****** Object:  Table [dbo].[Patients_Notrequired]    Script Date: 8/11/2021 12:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
CREATE TABLE [dbo].[Patients_Notrequired](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[PatientId] [varchar](30) NOT NULL,
	[First_Name] [varchar](50) NOT NULL,
	[Middle_Name] [varchar](50) NULL,
	[Last_Name] [varchar](50) NULL,
	[DisplayName] [varchar](100) NOT NULL,
	[DOB] [date] NULL,
	[Age] [smallint] NULL,
	[Gender] [varchar](10) NULL,
	[Email] [varchar](50) NULL,
	[Mob_No] [varchar](50) NULL,
	[RegisteredFacility] [varchar](50) NULL,
	[Status] [varchar](10) NULL,
	[CDNT] [date] NOT NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
*/
/****** Object:  Table [pac].[PatientDiagnosis]    Script Date: 8/11/2021 12:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pac].[PatientDiagnosis](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[PatientID] [varchar](30) NOT NULL,
	[EnconterID] [varchar](30) NULL,
	[NameSpace] [varchar](10) NOT NULL,
	[DiagnosisCode] [varchar](30) NOT NULL,
	[DiagnosisDescription] [varchar](300) NULL,
	[OldStatus] [varchar](10) NOT NULL,
	[NewStatus] [varchar](10) NOT NULL,
	[Reason] [varchar](30) NOT NULL,
	[ResolvedDate] [date] NOT NULL,
	[Resolved_At_Facility] [varchar](50) NULL,
	[ResolvedBy] [varchar](50) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [date] NOT NULL,
 CONSTRAINT [PK_Diagnosis] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pac].[ReportCategory]    Script Date: 8/11/2021 12:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pac].[ReportCategory](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Name] [varchar](20) NOT NULL,
	[Description] [varchar](50) NULL,
	[Status] [varchar](10) NOT NULL,
	[IsMergeAllowed] [char](1) NULL,
	[IsSplitAllowed] [char](1) NULL,
	[IsSourceCategory] [char](1) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [date] NOT NULL,
 CONSTRAINT [PK_ReportCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [pac].[Reportupload]    Script Date: 8/11/2021 12:28:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [pac].[Reportupload](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[PatientID] [varchar](30) NOT NULL,
	[EnconterID] [varchar](30) NULL,
	[ActivityType] [varchar](10) NOT NULL,
	[Source_ReportCategoryID] [smallint] NOT NULL,
	[Source_FileName] [varchar](100) NOT NULL,
	[Source_FileExtension] [varchar](5) NOT NULL,
	[Source_FilePath] [varchar](255) NOT NULL,
	[Source_NoofPages] [smallint] NULL,
	[Destination_ReportCategoryID] [smallint] NOT NULL,
	[Destination_FileName] [varchar](100) NOT NULL,
	[Destination_FileExtension] [varchar](5) NOT NULL,
	[Destination_FilePath] [varchar](255) NOT NULL,
	[Destination_NoofPages] [smallint] NULL,
	[Comments] [varchar](1000) NULL,
	[Uploaded_At_Facility] [varchar](50) NULL,
	[UploadedBy] [varchar](50) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedBy] [varchar](50) NULL,
	[ModifiedDate] [date] NOT NULL,
 CONSTRAINT [PK_Reportupload] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_Patients]    Script Date: 8/11/2021 12:28:34 PM ******/
/*
CREATE NONCLUSTERED INDEX [ix_Patients] ON [dbo].[Patients_Notrequired]
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
*/
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_PatientDiagnosis]    Script Date: 8/11/2021 12:28:35 PM ******/
CREATE NONCLUSTERED INDEX [ix_PatientDiagnosis] ON [pac].[PatientDiagnosis]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_Reportupload]    Script Date: 8/11/2021 12:28:35 PM ******/
CREATE NONCLUSTERED INDEX [ix_Reportupload] ON [pac].[Reportupload]
(
	[PatientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [PatientChart] SET  READ_WRITE 
GO

--Data Ingest
USE [PatientChart]
GO

insert into [pac].[ReportCategory]  (Name,Type,Description,Status,IsMergeAllowed,IsSplitAllowed,IsSourceCategory,CreatedBy,CreatedDate,ModifiedBy,ModifiedDate)
values 

('Radiology','Med','Radiology','A','Y','Y','Y','Initial',getdate(),'Initial', getdate()),
('Laboratory','Med','Laboratory','A','Y','Y','Y','Initial',getdate(),'Initial', getdate()),
('Cardiology','Med','Cardiology','A','Y','Y','Y','Initial',getdate(),'Initial', getdate()),
('Doctor''s Notes','Med','Doctor''s Notes','A','Y','Y','Y','Initial',getdate(),'Initial', getdate()),
('ER/Hospital','Non-Med','ER/Hospital','A','Y','Y','Y','Initial',getdate(),'Initial', getdate()),
('Legal','Non-Med','Legal','A','Y','Y','Y','Initial',getdate(),'Initial', getdate()),
('Other','Non-Med','Other','A','Y','Y','Y','Initial',getdate(),'Initial', getdate()),
('Hidden','Non-Med','Hidden','A','Y','Y','Y','Initial',getdate(),'Initial', getdate());


--TRUNCATE TABLE [pac].[ReportCategory]
--SELECT * FROM [pac].[ReportCategory]

--EOF
