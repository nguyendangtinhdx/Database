USE [master]
GO
/****** Object:  Database [JavaBasicDay1Day6]    Script Date: 20/3/2018 9:57:54 AM ******/
CREATE DATABASE [JavaBasicDay1Day6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JavaBasic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\JavaBasic.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JavaBasic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\JavaBasic_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JavaBasicDay1Day6] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JavaBasicDay1Day6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JavaBasicDay1Day6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET ARITHABORT OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET  MULTI_USER 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JavaBasicDay1Day6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JavaBasicDay1Day6] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [JavaBasicDay1Day6]
GO
/****** Object:  Table [dbo].[Candidate]    Script Date: 20/3/2018 9:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidate](
	[CandidateID] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[BirthDay] [date] NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Candidate_type] [int] NULL,
	[ExpInYear] [int] NULL,
	[ProSkill] [nvarchar](50) NULL,
	[Graduation_date] [date] NULL,
	[Graduation_rank] [nvarchar](50) NULL,
	[Education] [nvarchar](50) NULL,
	[Majors] [nvarchar](50) NULL,
	[Semester] [nvarchar](50) NULL,
	[University_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Candidate] PRIMARY KEY CLUSTERED 
(
	[CandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Certificate]    Script Date: 20/3/2018 9:57:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificate](
	[CertificatedID] [nvarchar](50) NOT NULL,
	[CertificateName] [nvarchar](50) NULL,
	[CertificateRank] [nvarchar](50) NULL,
	[CertificatedDate] [date] NULL,
	[CandidateID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Certificate] PRIMARY KEY CLUSTERED 
(
	[CertificatedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [BirthDay], [Phone], [Email], [Candidate_type], [ExpInYear], [ProSkill], [Graduation_date], [Graduation_rank], [Education], [Majors], [Semester], [University_name]) VALUES (N'Cand01', N'Trần Văn Bình', CAST(N'1998-12-06' AS Date), N'1235647895', N'binhtv@gmail.com', 0, 2, N'Speaking English', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [BirthDay], [Phone], [Email], [Candidate_type], [ExpInYear], [ProSkill], [Graduation_date], [Graduation_rank], [Education], [Majors], [Semester], [University_name]) VALUES (N'Cand02', N'Lê Thủy	', CAST(N'1995-02-02' AS Date), N'1234567894', N'thuyl@gmail.com', 2, 6, N'speaking English', CAST(N'2015-05-30' AS Date), N'Giỏi', N'Đại học Kinh tế Đà Nẵng', NULL, NULL, NULL)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [BirthDay], [Phone], [Email], [Candidate_type], [ExpInYear], [ProSkill], [Graduation_date], [Graduation_rank], [Education], [Majors], [Semester], [University_name]) VALUES (N'Cand03', N'Trương Nam Minh', CAST(N'1998-07-06' AS Date), N'1234567894', N'minhtn@gmail.com', 2, 0, N'', CAST(N'1996-01-01' AS Date), N'giỏi', N'Đại học bách khoa', N'Sinh viên', N'Học kỳ 2', N'Đại học Khoa học huế')
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [BirthDay], [Phone], [Email], [Candidate_type], [ExpInYear], [ProSkill], [Graduation_date], [Graduation_rank], [Education], [Majors], [Semester], [University_name]) VALUES (N'Cand04', N'Nguyễn Thành Hưng', CAST(N'1995-05-30' AS Date), N'1255669855', N'hungnt@gmail.com', 0, 3, N'read code', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [BirthDay], [Phone], [Email], [Candidate_type], [ExpInYear], [ProSkill], [Graduation_date], [Graduation_rank], [Education], [Majors], [Semester], [University_name]) VALUES (N'Cand05', N'Đỗ Thành Trung', CAST(N'1998-06-03' AS Date), N'987456321', N'trungdt@gmail.com', 2, 8, N'listen music', NULL, NULL, NULL, N'Sinh viên', N'học kỳ 1', N'Đại học Y dược Huế')
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [BirthDay], [Phone], [Email], [Candidate_type], [ExpInYear], [ProSkill], [Graduation_date], [Graduation_rank], [Education], [Majors], [Semester], [University_name]) VALUES (N'Cand06', N'Lê Bình Phước', CAST(N'1999-08-30' AS Date), N'1234567894', N'phuongln@gmail.com', 1, 0, N'', NULL, NULL, NULL, N'sinh viên', N'học kỳ 2', N'đh huế')
INSERT [dbo].[Candidate] ([CandidateID], [FullName], [BirthDay], [Phone], [Email], [Candidate_type], [ExpInYear], [ProSkill], [Graduation_date], [Graduation_rank], [Education], [Majors], [Semester], [University_name]) VALUES (N'Cand07', N'Lê Thành', CAST(N'1998-01-01' AS Date), N'1234567894', N'thanhl@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, N'Sinh viên cao học', N'học kì 3', N'Đại học Duy Tân')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert01', N'B1', N'Khá', CAST(N'2011-05-03' AS Date), N'Cand01')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert02', N'C1', N'Trung bình', CAST(N'2017-09-25' AS Date), N'Cand02')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert03', N'TOEIC', N'Khá', CAST(N'2016-02-03' AS Date), N'Cand02')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert04', N'A2', N'Giỏi', CAST(N'2011-12-30' AS Date), N'Cand03')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert05', N'IELTS', N'Trung bình', CAST(N'2014-04-06' AS Date), N'Cand03')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert06', N'TOEFL', N'Khá', CAST(N'2012-09-05' AS Date), N'Cand03')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert07', N'C2', N'Khá', CAST(N'2015-08-28' AS Date), N'Cand04')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert08', N'TOEIC', N'Khá', CAST(N'2017-12-06' AS Date), N'Cand05')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert09', N'Tiếng anh B1', N'Khá', CAST(N'2016-12-30' AS Date), N'Cand06')
INSERT [dbo].[Certificate] ([CertificatedID], [CertificateName], [CertificateRank], [CertificatedDate], [CandidateID]) VALUES (N'Cert10', N'Tiếng nhật', N'Giỏi', CAST(N'2014-01-02' AS Date), N'Cand07')
ALTER TABLE [dbo].[Certificate]  WITH CHECK ADD  CONSTRAINT [FK_Certificate_Candidate] FOREIGN KEY([CandidateID])
REFERENCES [dbo].[Candidate] ([CandidateID])
GO
ALTER TABLE [dbo].[Certificate] CHECK CONSTRAINT [FK_Certificate_Candidate]
GO
USE [master]
GO
ALTER DATABASE [JavaBasicDay1Day6] SET  READ_WRITE 
GO
