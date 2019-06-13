USE [master]
GO
/****** Object:  Database [OnlineExamSystem]    Script Date: 6/13/2019 6:14:27 PM ******/
CREATE DATABASE [OnlineExamSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OnlineExamSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineExamSystem.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'OnlineExamSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\OnlineExamSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [OnlineExamSystem] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OnlineExamSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OnlineExamSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OnlineExamSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OnlineExamSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [OnlineExamSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OnlineExamSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [OnlineExamSystem] SET  MULTI_USER 
GO
ALTER DATABASE [OnlineExamSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OnlineExamSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OnlineExamSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OnlineExamSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [OnlineExamSystem] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'OnlineExamSystem', N'ON'
GO
USE [OnlineExamSystem]
GO
/****** Object:  Table [dbo].[AssessmentSchedule]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssessmentSchedule](
	[AssessmentID] [int] IDENTITY(1,1000) NOT NULL,
	[AssessmentName] [varchar](50) NOT NULL,
	[AssessmentDate] [date] NOT NULL,
	[QuestionPaperID] [int] NOT NULL,
	[Duration] [time](7) NOT NULL,
	[TotalMarks] [int] NOT NULL,
 CONSTRAINT [PK_AssessmentSchedule] PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Credentials]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Credentials](
	[UserID] [varchar](20) NOT NULL,
	[Password] [varchar](10) NOT NULL,
	[UserType] [char](1) NOT NULL,
 CONSTRAINT [PK_Credentials] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionPaper]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionPaper](
	[QuestionPaperID] [int] IDENTITY(1,1000) NOT NULL,
	[QuestionPaperName] [varchar](50) NOT NULL,
	[TotalQuestions] [int] NOT NULL,
	[TotalMarks] [int] NOT NULL,
 CONSTRAINT [PK_QuestionPaper] PRIMARY KEY CLUSTERED 
(
	[QuestionPaperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionPaperDetails]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuestionPaperDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionPaperID] [int] NULL,
	[QuestionID] [int] NULL,
 CONSTRAINT [PK_QuestionPaperDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Questions]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NULL,
	[QDescription] [varchar](50) NOT NULL,
	[Option1] [varchar](50) NOT NULL,
	[Option2] [varchar](50) NOT NULL,
	[Option3] [varchar](50) NOT NULL,
	[Option4] [varchar](50) NOT NULL,
	[CorrectAnswer] [int] NOT NULL,
	[DifficultyLevel] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResult]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[AssesmentID] [int] NOT NULL,
	[PassedQuestions] [int] NOT NULL,
	[FailedQuestions] [int] NOT NULL,
	[Score] [int] NOT NULL,
 CONSTRAINT [PK_TestResult] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Topic](
	[TopicID] [int] IDENTITY(1,1000) NOT NULL,
	[TopicName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 6/13/2019 6:14:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UserID] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Age] [int] NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[PhoneNo] [int] NOT NULL,
	[EmailID] [varchar](30) NOT NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[AssessmentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentSchedule_QuestionPaper] FOREIGN KEY([QuestionPaperID])
REFERENCES [dbo].[QuestionPaper] ([QuestionPaperID])
GO
ALTER TABLE [dbo].[AssessmentSchedule] CHECK CONSTRAINT [FK_AssessmentSchedule_QuestionPaper]
GO
ALTER TABLE [dbo].[QuestionPaperDetails]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPaperDetails_QuestionPaper] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
GO
ALTER TABLE [dbo].[QuestionPaperDetails] CHECK CONSTRAINT [FK_QuestionPaperDetails_QuestionPaper]
GO
ALTER TABLE [dbo].[QuestionPaperDetails]  WITH CHECK ADD  CONSTRAINT [FK_QuestionPaperDetails_QuestionPaper1] FOREIGN KEY([QuestionPaperID])
REFERENCES [dbo].[QuestionPaper] ([QuestionPaperID])
GO
ALTER TABLE [dbo].[QuestionPaperDetails] CHECK CONSTRAINT [FK_QuestionPaperDetails_QuestionPaper1]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Topic] ([TopicID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Topic]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_AssessmentSchedule] FOREIGN KEY([AssesmentID])
REFERENCES [dbo].[AssessmentSchedule] ([AssessmentID])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_AssessmentSchedule]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_Credentials] FOREIGN KEY([UserID])
REFERENCES [dbo].[Credentials] ([UserID])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_Credentials]
GO
ALTER TABLE [dbo].[TestResult]  WITH CHECK ADD  CONSTRAINT [FK_TestResult_TestResult] FOREIGN KEY([UserID])
REFERENCES [dbo].[UserDetails] ([UserID])
GO
ALTER TABLE [dbo].[TestResult] CHECK CONSTRAINT [FK_TestResult_TestResult]
GO
USE [master]
GO
ALTER DATABASE [OnlineExamSystem] SET  READ_WRITE 
GO
