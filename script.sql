USE [master]
GO
/****** Object:  Database [OnlineExaminationSystem]    Script Date: 16-06-2019 22:50:40 ******/
CREATE DATABASE [OnlineExaminationSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineExaminationSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineExaminationSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OnlineExaminationSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\OnlineExaminationSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [OnlineExaminationSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineExaminationSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineExaminationSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExaminationSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineExaminationSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineExaminationSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineExaminationSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OnlineExaminationSystem] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineExaminationSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineExaminationSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineExaminationSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineExaminationSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OnlineExaminationSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OnlineExaminationSystem] SET QUERY_STORE = OFF
GO
USE [OnlineExaminationSystem]
GO
/****** Object:  Table [dbo].[AssessmentSchedule]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentSchedule](
	[AssessmentId] [int] IDENTITY(1000,1) NOT NULL,
	[AssessmentName] [varchar](100) NOT NULL,
	[QuestionPaperId] [int] NOT NULL,
	[AssessmentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AssessmentSchedule] PRIMARY KEY CLUSTERED 
(
	[AssessmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credentials]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credentials](
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserType] [char](1) NOT NULL,
 CONSTRAINT [PK_Credentials] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionPaper]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPaper](
	[QuestionPaperId] [int] IDENTITY(1000,1) NOT NULL,
	[QuestionPaperName] [varchar](50) NOT NULL,
	[TotalQuestions] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
 CONSTRAINT [PK_QuestionPaper] PRIMARY KEY CLUSTERED 
(
	[QuestionPaperId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuestionPaperDetails]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPaperDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionPaperId] [int] NOT NULL,
	[QuestionIds] [int] NOT NULL,
 CONSTRAINT [PK_QuestionPaperDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionId] [int] IDENTITY(1000,1) NOT NULL,
	[TopicId] [int] NOT NULL,
	[Description] [varchar](1000) NOT NULL,
	[Option1] [varchar](100) NOT NULL,
	[Option2] [varchar](100) NOT NULL,
	[Option3] [varchar](100) NOT NULL,
	[Option4] [varchar](100) NOT NULL,
	[CorrectAnswer] [varchar](50) NOT NULL,
	[DifficultyLevel] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TestResult]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestResult](
	[Id] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[AssessmentId] [int] IDENTITY(1,1) NOT NULL,
	[PassedQuestions] [int] NOT NULL,
	[FailedQuestions] [int] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_TestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Topics]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[TopicId] [int] IDENTITY(1000,1) NOT NULL,
	[TopicName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Topics] PRIMARY KEY CLUSTERED 
(
	[TopicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 16-06-2019 22:50:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserName] [varchar](50) NOT NULL,
	[EmailID] [varchar](50) NULL,
	[Age] [int] NOT NULL,
	[PhoneNo] [varchar](50) NULL,
 CONSTRAINT [PK_UserDeatils] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Credentials] ([UserName], [Password], [UserType]) VALUES (N'jyotirmaya', N'banda', N'u')
INSERT [dbo].[Credentials] ([UserName], [Password], [UserType]) VALUES (N'saswot', N'qwerty', N'u')
INSERT [dbo].[UserDetails] ([UserName], [EmailID], [Age], [PhoneNo]) VALUES (N'jyotirmaya', N'jyoti@wipro.com', 22, N'1234567890')
ALTER TABLE [dbo].[AssessmentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSchedule_AssessmentSchedule] FOREIGN KEY([QuestionPaperId])
REFERENCES [dbo].[QuestionPaper] ([QuestionPaperId])
GO
ALTER TABLE [dbo].[AssessmentSchedule] CHECK CONSTRAINT [FK_AssessmentSchedule_AssessmentSchedule]
GO
ALTER TABLE [dbo].[QuestionPaperDetails]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPaperDetails_QuestionPaper] FOREIGN KEY([QuestionPaperId])
REFERENCES [dbo].[QuestionPaper] ([QuestionPaperId])
GO
ALTER TABLE [dbo].[QuestionPaperDetails] CHECK CONSTRAINT [FK_QuestionPaperDetails_QuestionPaper]
GO
ALTER TABLE [dbo].[QuestionPaperDetails]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPaperDetails_Questions] FOREIGN KEY([QuestionIds])
REFERENCES [dbo].[Questions] ([QuestionId])
GO
ALTER TABLE [dbo].[QuestionPaperDetails] CHECK CONSTRAINT [FK_QuestionPaperDetails_Questions]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Topics] FOREIGN KEY([TopicId])
REFERENCES [dbo].[Topics] ([TopicId])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Topics]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_AssessmentSchedule] FOREIGN KEY([AssessmentId])
REFERENCES [dbo].[AssessmentSchedule] ([AssessmentId])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_AssessmentSchedule]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_Credentials] FOREIGN KEY([UserName])
REFERENCES [dbo].[Credentials] ([UserName])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_Credentials]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_UserDetails] FOREIGN KEY([UserName])
REFERENCES [dbo].[UserDetails] ([UserName])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_UserDetails]
GO
USE [master]
GO
ALTER DATABASE [OnlineExaminationSystem] SET  READ_WRITE 
GO
