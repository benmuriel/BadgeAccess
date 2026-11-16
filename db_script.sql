USE [master]
GO
/****** Object:  Database [BadgeAccess]    Script Date: 11/16/26 9:02:12AM ******/
CREATE DATABASE [BadgeAccess]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BadgeAccess', FILENAME = N'/var/opt/mssql/data/BadgeAccess.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BadgeAccess_log', FILENAME = N'/var/opt/mssql/data/BadgeAccess_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BadgeAccess].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BadgeAccess] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BadgeAccess] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BadgeAccess] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BadgeAccess] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BadgeAccess] SET ARITHABORT OFF 
GO
ALTER DATABASE [BadgeAccess] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BadgeAccess] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BadgeAccess] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BadgeAccess] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BadgeAccess] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BadgeAccess] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BadgeAccess] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BadgeAccess] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BadgeAccess] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BadgeAccess] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BadgeAccess] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BadgeAccess] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BadgeAccess] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BadgeAccess] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BadgeAccess] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BadgeAccess] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BadgeAccess] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BadgeAccess] SET RECOVERY FULL 
GO
ALTER DATABASE [BadgeAccess] SET  MULTI_USER 
GO
ALTER DATABASE [BadgeAccess] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BadgeAccess] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BadgeAccess] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BadgeAccess] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BadgeAccess] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BadgeAccess', N'ON'
GO
ALTER DATABASE [BadgeAccess] SET QUERY_STORE = ON
GO
ALTER DATABASE [BadgeAccess] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [BadgeAccess]
GO
ALTER DATABASE SCOPED CONFIGURATION SET ACCELERATED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ASYNC_STATS_UPDATE_WAIT_AT_LOW_PRIORITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ADAPTIVE_JOINS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET BATCH_MODE_ON_ROWSTORE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET CE_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DEFERRED_COMPILATION_TV = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DOP_FEEDBACK = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET DW_COMPATIBILITY_LEVEL = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_ONLINE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ELEVATE_RESUMABLE = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET EXEC_QUERY_STATS_FOR_SCALAR_FUNCTIONS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET FORCE_SHOWPLAN_RUNTIME_PARAMETER_COLLECTION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET GLOBAL_TEMPORARY_TABLE_AUTO_DROP = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET INTERLEAVED_EXECUTION_TVF = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ISOLATE_SECURITY_POLICY_CARDINALITY = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LAST_QUERY_PLAN_STATS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEDGER_DIGEST_STORAGE_ENDPOINT = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LIGHTWEIGHT_QUERY_PROFILING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MEMORY_GRANT_FEEDBACK_PERCENTILE_GRANT = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MEMORY_GRANT_FEEDBACK_PERSISTENCE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZED_PLAN_FORCING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SENSITIVE_PLAN_OPTIMIZATION = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PAUSED_RESUMABLE_INDEX_ABORT_DURATION_MINUTES = 1440;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET ROW_MODE_MEMORY_GRANT_FEEDBACK = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET TSQL_SCALAR_UDF_INLINING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET VERBOSE_TRUNCATION_WARNINGS = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_PROCEDURE_EXECUTION_STATISTICS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET XTP_QUERY_EXECUTION_STATISTICS = OFF;
GO
USE [BadgeAccess]
GO
/****** Object:  Table [dbo].[Agents]    Script Date: 11/16/26 9:02:12AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](255) NOT NULL,
	[Role] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[DepartmentId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_group_permissions]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_group_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_permission]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[content_type_id] [int] NOT NULL,
	[codename] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[password] [nvarchar](128) NOT NULL,
	[last_login] [datetimeoffset](7) NULL,
	[is_superuser] [bit] NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[first_name] [nvarchar](150) NOT NULL,
	[last_name] [nvarchar](150) NOT NULL,
	[email] [nvarchar](254) NOT NULL,
	[is_staff] [bit] NOT NULL,
	[is_active] [bit] NOT NULL,
	[date_joined] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_groups]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_groups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[group_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[auth_user_user_permissions]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auth_user_user_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[permission_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BadgeCategories]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BadgeCategories](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Type] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Badges]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Badges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BadgeNumber] [varchar](20) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[PersonId] [int] NULL,
	[IssueDate] [datetime2](7) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_admin_log]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_admin_log](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[action_time] [datetimeoffset](7) NOT NULL,
	[object_id] [nvarchar](max) NULL,
	[object_repr] [nvarchar](200) NOT NULL,
	[action_flag] [smallint] NOT NULL,
	[change_message] [nvarchar](max) NOT NULL,
	[content_type_id] [int] NULL,
	[user_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_content_type]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_content_type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[app_label] [nvarchar](100) NOT NULL,
	[model] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_migrations]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_migrations](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[app] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[applied] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[django_session]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[django_session](
	[session_key] [nvarchar](40) NOT NULL,
	[session_data] [nvarchar](max) NOT NULL,
	[expire_date] [datetimeoffset](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventBadgeCategories]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventBadgeCategories](
	[EventId] [int] NULL,
	[CategoryId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Description] [varchar](2500) NULL,
	[CreatedAtDate] [datetime2](7) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Place] [varchar](255) NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerLists]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerLists](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[EventId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [varchar](255) NOT NULL,
	[FirstName] [varchar](255) NULL,
	[ForeName] [varchar](255) NULL,
	[Gender] [char](1) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Provenance] [varchar](255) NULL,
	[Role] [varchar](255) NULL,
	[TypePieceId] [int] NULL,
	[PartnerListId] [int] NULL,
	[NumPiece] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePieces]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePieces](
	[Id] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitors]    Script Date: 11/16/26 9:02:13AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[BadgeId] [int] NOT NULL,
	[CreatedAtDate] [datetime2](7) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NULL,
	[VisitedPerson] [varchar](255) NULL,
	[VisitedPersonRole] [varchar](255) NULL,
	[Purpose] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[auth_permission] ON 

INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (1, N'Can add log entry', 1, N'add_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (2, N'Can change log entry', 1, N'change_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (3, N'Can delete log entry', 1, N'delete_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (4, N'Can view log entry', 1, N'view_logentry')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (5, N'Can add permission', 3, N'add_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (6, N'Can change permission', 3, N'change_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (7, N'Can delete permission', 3, N'delete_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (8, N'Can view permission', 3, N'view_permission')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (9, N'Can add group', 2, N'add_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (10, N'Can change group', 2, N'change_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (11, N'Can delete group', 2, N'delete_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (12, N'Can view group', 2, N'view_group')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (13, N'Can add user', 4, N'add_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (14, N'Can change user', 4, N'change_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (15, N'Can delete user', 4, N'delete_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (16, N'Can view user', 4, N'view_user')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (17, N'Can add content type', 5, N'add_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (18, N'Can change content type', 5, N'change_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (19, N'Can delete content type', 5, N'delete_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (20, N'Can view content type', 5, N'view_contenttype')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (21, N'Can add session', 6, N'add_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (22, N'Can change session', 6, N'change_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (23, N'Can delete session', 6, N'delete_session')
INSERT [dbo].[auth_permission] ([id], [name], [content_type_id], [codename]) VALUES (24, N'Can view session', 6, N'view_session')
SET IDENTITY_INSERT [dbo].[auth_permission] OFF
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (1, N'Cabinet du Gouverneur', N'generic')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (2, N'Cabinet Ministeriel', N'generic')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (3, N'Administration', N'generic')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (4, N'Stagiaire ', N'generic')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (5, N'Prestataire', N'generic')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (6, N'Participant', N'special')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (7, N'Service', N'special')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (8, N'Expert', N'special')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (9, N'Delegate', N'special')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (10, N'VIP', N'special')
INSERT [dbo].[BadgeCategories] ([Id], [Name], [Type]) VALUES (11, N'VVIP', N'special')
SET IDENTITY_INSERT [dbo].[Badges] ON 

INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (1, N'1#001', 1, NULL, CAST(N'2026-11-11T05:47:01.4633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (2, N'1#002', 1, NULL, CAST(N'2026-11-11T05:47:01.4666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (3, N'1#003', 1, NULL, CAST(N'2026-11-11T05:47:01.4666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (4, N'1#004', 1, NULL, CAST(N'2026-11-11T05:47:01.4666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (5, N'1#005', 1, NULL, CAST(N'2026-11-11T05:47:01.4700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (6, N'1#006', 1, NULL, CAST(N'2026-11-11T05:47:01.4700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (7, N'1#007', 1, NULL, CAST(N'2026-11-11T05:47:01.4700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (8, N'1#008', 1, NULL, CAST(N'2026-11-11T05:47:01.4700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (9, N'1#009', 1, NULL, CAST(N'2026-11-11T05:47:01.4700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (10, N'1#010', 1, NULL, CAST(N'2026-11-11T05:47:01.4700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (11, N'1#011', 1, NULL, CAST(N'2026-11-11T05:47:01.4733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (12, N'1#012', 1, NULL, CAST(N'2026-11-11T05:47:01.4733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (13, N'1#013', 1, NULL, CAST(N'2026-11-11T05:47:01.4733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (14, N'1#014', 1, NULL, CAST(N'2026-11-11T05:47:01.4733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (15, N'1#015', 1, NULL, CAST(N'2026-11-11T05:47:01.4766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (16, N'1#016', 1, NULL, CAST(N'2026-11-11T05:47:01.4766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (17, N'1#017', 1, NULL, CAST(N'2026-11-11T05:47:01.4766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (18, N'1#018', 1, NULL, CAST(N'2026-11-11T05:47:01.4766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (19, N'1#019', 1, NULL, CAST(N'2026-11-11T05:47:01.4800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (20, N'1#020', 1, NULL, CAST(N'2026-11-11T05:47:01.4800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (21, N'1#021', 1, NULL, CAST(N'2026-11-11T05:47:01.4800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (22, N'1#022', 1, NULL, CAST(N'2026-11-11T05:47:01.4800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (23, N'1#023', 1, NULL, CAST(N'2026-11-11T05:47:01.4800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (24, N'1#024', 1, NULL, CAST(N'2026-11-11T05:47:01.4800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (25, N'1#025', 1, NULL, CAST(N'2026-11-11T05:47:01.4833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (26, N'1#026', 1, NULL, CAST(N'2026-11-11T05:47:01.4833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (27, N'1#027', 1, NULL, CAST(N'2026-11-11T05:47:01.4833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (28, N'1#028', 1, NULL, CAST(N'2026-11-11T05:47:01.4866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (29, N'1#029', 1, NULL, CAST(N'2026-11-11T05:47:01.4866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (30, N'1#030', 1, NULL, CAST(N'2026-11-11T05:47:01.4866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (31, N'1#031', 1, NULL, CAST(N'2026-11-11T05:47:01.4900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (32, N'1#032', 1, NULL, CAST(N'2026-11-11T05:47:01.4900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (33, N'1#033', 1, NULL, CAST(N'2026-11-11T05:47:01.4900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (34, N'1#034', 1, NULL, CAST(N'2026-11-11T05:47:01.4900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (35, N'1#035', 1, NULL, CAST(N'2026-11-11T05:47:01.4900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.4900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (36, N'1#036', 1, NULL, CAST(N'2026-11-11T05:47:01.4933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (37, N'1#037', 1, NULL, CAST(N'2026-11-11T05:47:01.4933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (38, N'1#038', 1, NULL, CAST(N'2026-11-11T05:47:01.4933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (39, N'1#039', 1, NULL, CAST(N'2026-11-11T05:47:01.4933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.4933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (40, N'1#040', 1, NULL, CAST(N'2026-11-11T05:47:01.4966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (41, N'1#041', 1, NULL, CAST(N'2026-11-11T05:47:01.4966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (42, N'1#042', 1, NULL, CAST(N'2026-11-11T05:47:01.4966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (43, N'1#043', 1, NULL, CAST(N'2026-11-11T05:47:01.4966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.4966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (44, N'1#044', 1, NULL, CAST(N'2026-11-11T05:47:01.5000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (45, N'1#045', 1, NULL, CAST(N'2026-11-11T05:47:01.5000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (46, N'1#046', 1, NULL, CAST(N'2026-11-11T05:47:01.5000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (47, N'1#047', 1, NULL, CAST(N'2026-11-11T05:47:01.5000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (48, N'1#048', 1, NULL, CAST(N'2026-11-11T05:47:01.5000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (49, N'1#049', 1, NULL, CAST(N'2026-11-11T05:47:01.5000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (50, N'1#050', 1, NULL, CAST(N'2026-11-11T05:47:01.5033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (51, N'1#051', 1, NULL, CAST(N'2026-11-11T05:47:01.5033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (52, N'1#052', 1, NULL, CAST(N'2026-11-11T05:47:01.5033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (53, N'1#053', 1, NULL, CAST(N'2026-11-11T05:47:01.5033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (54, N'1#054', 1, NULL, CAST(N'2026-11-11T05:47:01.5066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (55, N'1#055', 1, NULL, CAST(N'2026-11-11T05:47:01.5066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (56, N'1#056', 1, NULL, CAST(N'2026-11-11T05:47:01.5066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (57, N'1#057', 1, NULL, CAST(N'2026-11-11T05:47:01.5066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (58, N'1#058', 1, NULL, CAST(N'2026-11-11T05:47:01.5066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (59, N'1#059', 1, NULL, CAST(N'2026-11-11T05:47:01.5100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (60, N'1#060', 1, NULL, CAST(N'2026-11-11T05:47:01.5100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (61, N'1#061', 1, NULL, CAST(N'2026-11-11T05:47:01.5100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (62, N'1#062', 1, NULL, CAST(N'2026-11-11T05:47:01.5100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (63, N'1#063', 1, NULL, CAST(N'2026-11-11T05:47:01.5100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (64, N'1#064', 1, NULL, CAST(N'2026-11-11T05:47:01.5100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (65, N'1#065', 1, NULL, CAST(N'2026-11-11T05:47:01.5133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (66, N'1#066', 1, NULL, CAST(N'2026-11-11T05:47:01.5133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (67, N'1#067', 1, NULL, CAST(N'2026-11-11T05:47:01.5133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (68, N'1#068', 1, NULL, CAST(N'2026-11-11T05:47:01.5133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (69, N'1#069', 1, NULL, CAST(N'2026-11-11T05:47:01.5166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (70, N'1#070', 1, NULL, CAST(N'2026-11-11T05:47:01.5166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (71, N'1#071', 1, NULL, CAST(N'2026-11-11T05:47:01.5166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (72, N'1#072', 1, NULL, CAST(N'2026-11-11T05:47:01.5166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (73, N'1#073', 1, NULL, CAST(N'2026-11-11T05:47:01.5166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (74, N'1#074', 1, NULL, CAST(N'2026-11-11T05:47:01.5200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (75, N'1#075', 1, NULL, CAST(N'2026-11-11T05:47:01.5200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (76, N'1#076', 1, NULL, CAST(N'2026-11-11T05:47:01.5200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (77, N'1#077', 1, NULL, CAST(N'2026-11-11T05:47:01.5200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (78, N'1#078', 1, NULL, CAST(N'2026-11-11T05:47:01.5200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (79, N'1#079', 1, NULL, CAST(N'2026-11-11T05:47:01.5233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (80, N'1#080', 1, NULL, CAST(N'2026-11-11T05:47:01.5233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (81, N'1#081', 1, NULL, CAST(N'2026-11-11T05:47:01.5233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (82, N'1#082', 1, NULL, CAST(N'2026-11-11T05:47:01.5266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (83, N'1#083', 1, NULL, CAST(N'2026-11-11T05:47:01.5266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (84, N'1#084', 1, NULL, CAST(N'2026-11-11T05:47:01.5266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (85, N'1#085', 1, NULL, CAST(N'2026-11-11T05:47:01.5266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (86, N'1#086', 1, NULL, CAST(N'2026-11-11T05:47:01.5266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (87, N'1#087', 1, NULL, CAST(N'2026-11-11T05:47:01.5300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (88, N'1#088', 1, NULL, CAST(N'2026-11-11T05:47:01.5300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (89, N'1#089', 1, NULL, CAST(N'2026-11-11T05:47:01.5300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (90, N'1#090', 1, NULL, CAST(N'2026-11-11T05:47:01.5300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (91, N'1#091', 1, NULL, CAST(N'2026-11-11T05:47:01.5300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (92, N'1#092', 1, NULL, CAST(N'2026-11-11T05:47:01.5300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (93, N'1#093', 1, NULL, CAST(N'2026-11-11T05:47:01.5333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (94, N'1#094', 1, NULL, CAST(N'2026-11-11T05:47:01.5333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (95, N'1#095', 1, NULL, CAST(N'2026-11-11T05:47:01.5333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (96, N'1#096', 1, NULL, CAST(N'2026-11-11T05:47:01.5333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (97, N'1#097', 1, NULL, CAST(N'2026-11-11T05:47:01.5333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (98, N'1#098', 1, NULL, CAST(N'2026-11-11T05:47:01.5366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (99, N'1#099', 1, NULL, CAST(N'2026-11-11T05:47:01.5366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5366667' AS DateTime2), 1)
GO
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (100, N'1#100', 1, NULL, CAST(N'2026-11-11T05:47:01.5366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (101, N'2#001', 2, NULL, CAST(N'2026-11-11T05:47:01.5400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (102, N'2#002', 2, NULL, CAST(N'2026-11-11T05:47:01.5400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (103, N'2#003', 2, NULL, CAST(N'2026-11-11T05:47:01.5400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (104, N'2#004', 2, NULL, CAST(N'2026-11-11T05:47:01.5400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (105, N'2#005', 2, NULL, CAST(N'2026-11-11T05:47:01.5400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (106, N'2#006', 2, NULL, CAST(N'2026-11-11T05:47:01.5400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (107, N'2#007', 2, NULL, CAST(N'2026-11-11T05:47:01.5400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (108, N'2#008', 2, NULL, CAST(N'2026-11-11T05:47:01.5433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (109, N'2#009', 2, NULL, CAST(N'2026-11-11T05:47:01.5433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (110, N'2#010', 2, NULL, CAST(N'2026-11-11T05:47:01.5433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (111, N'2#011', 2, NULL, CAST(N'2026-11-11T05:47:01.5433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (112, N'2#012', 2, NULL, CAST(N'2026-11-11T05:47:01.5466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (113, N'2#013', 2, NULL, CAST(N'2026-11-11T05:47:01.5466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (114, N'2#014', 2, NULL, CAST(N'2026-11-11T05:47:01.5466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (115, N'2#015', 2, NULL, CAST(N'2026-11-11T05:47:01.5466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (116, N'2#016', 2, NULL, CAST(N'2026-11-11T05:47:01.5500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (117, N'2#017', 2, NULL, CAST(N'2026-11-11T05:47:01.5500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (118, N'2#018', 2, NULL, CAST(N'2026-11-11T05:47:01.5500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (119, N'2#019', 2, NULL, CAST(N'2026-11-11T05:47:01.5500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (120, N'2#020', 2, NULL, CAST(N'2026-11-11T05:47:01.5500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (121, N'2#021', 2, NULL, CAST(N'2026-11-11T05:47:01.5500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (122, N'2#022', 2, NULL, CAST(N'2026-11-11T05:47:01.5533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (123, N'2#023', 2, NULL, CAST(N'2026-11-11T05:47:01.5533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (124, N'2#024', 2, NULL, CAST(N'2026-11-11T05:47:01.5533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (125, N'2#025', 2, NULL, CAST(N'2026-11-11T05:47:01.5533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (126, N'2#026', 2, NULL, CAST(N'2026-11-11T05:47:01.5566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (127, N'2#027', 2, NULL, CAST(N'2026-11-11T05:47:01.5566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (128, N'2#028', 2, NULL, CAST(N'2026-11-11T05:47:01.5566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (129, N'2#029', 2, NULL, CAST(N'2026-11-11T05:47:01.5566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (130, N'2#030', 2, NULL, CAST(N'2026-11-11T05:47:01.5566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (131, N'2#031', 2, NULL, CAST(N'2026-11-11T05:47:01.5566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (132, N'2#032', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (133, N'2#033', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (134, N'2#034', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (135, N'2#035', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (136, N'2#036', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (137, N'2#037', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (138, N'2#038', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (139, N'2#039', 2, NULL, CAST(N'2026-11-11T05:47:01.5600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (140, N'2#040', 2, NULL, CAST(N'2026-11-11T05:47:01.5633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (141, N'2#041', 2, NULL, CAST(N'2026-11-11T05:47:01.5633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (142, N'2#042', 2, NULL, CAST(N'2026-11-11T05:47:01.5633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (143, N'2#043', 2, NULL, CAST(N'2026-11-11T05:47:01.5633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (144, N'2#044', 2, NULL, CAST(N'2026-11-11T05:47:01.5633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (145, N'2#045', 2, NULL, CAST(N'2026-11-11T05:47:01.5633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (146, N'2#046', 2, NULL, CAST(N'2026-11-11T05:47:01.5633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (147, N'2#047', 2, NULL, CAST(N'2026-11-11T05:47:01.5666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (148, N'2#048', 2, NULL, CAST(N'2026-11-11T05:47:01.5666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (149, N'2#049', 2, NULL, CAST(N'2026-11-11T05:47:01.5666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (150, N'2#050', 2, NULL, CAST(N'2026-11-11T05:47:01.5666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (151, N'2#051', 2, NULL, CAST(N'2026-11-11T05:47:01.5666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (152, N'2#052', 2, NULL, CAST(N'2026-11-11T05:47:01.5700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (153, N'2#053', 2, NULL, CAST(N'2026-11-11T05:47:01.5700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (154, N'2#054', 2, NULL, CAST(N'2026-11-11T05:47:01.5700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (155, N'2#055', 2, NULL, CAST(N'2026-11-11T05:47:01.5700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (156, N'2#056', 2, NULL, CAST(N'2026-11-11T05:47:01.5700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (157, N'2#057', 2, NULL, CAST(N'2026-11-11T05:47:01.5700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (158, N'2#058', 2, NULL, CAST(N'2026-11-11T05:47:01.5733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (159, N'2#059', 2, NULL, CAST(N'2026-11-11T05:47:01.5733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (160, N'2#060', 2, NULL, CAST(N'2026-11-11T05:47:01.5733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (161, N'2#061', 2, NULL, CAST(N'2026-11-11T05:47:01.5733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (162, N'2#062', 2, NULL, CAST(N'2026-11-11T05:47:01.5733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (163, N'2#063', 2, NULL, CAST(N'2026-11-11T05:47:01.5766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (164, N'2#064', 2, NULL, CAST(N'2026-11-11T05:47:01.5766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (165, N'2#065', 2, NULL, CAST(N'2026-11-11T05:47:01.5766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (166, N'2#066', 2, NULL, CAST(N'2026-11-11T05:47:01.5766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (167, N'2#067', 2, NULL, CAST(N'2026-11-11T05:47:01.5766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (168, N'2#068', 2, NULL, CAST(N'2026-11-11T05:47:01.5766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (169, N'2#069', 2, NULL, CAST(N'2026-11-11T05:47:01.5766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (170, N'2#070', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (171, N'2#071', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (172, N'2#072', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (173, N'2#073', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (174, N'2#074', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (175, N'2#075', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (176, N'2#076', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (177, N'2#077', 2, NULL, CAST(N'2026-11-11T05:47:01.5800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (178, N'2#078', 2, NULL, CAST(N'2026-11-11T05:47:01.5833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (179, N'2#079', 2, NULL, CAST(N'2026-11-11T05:47:01.5833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (180, N'2#080', 2, NULL, CAST(N'2026-11-11T05:47:01.5833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (181, N'2#081', 2, NULL, CAST(N'2026-11-11T05:47:01.5833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (182, N'2#082', 2, NULL, CAST(N'2026-11-11T05:47:01.5866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (183, N'2#083', 2, NULL, CAST(N'2026-11-11T05:47:01.5866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (184, N'2#084', 2, NULL, CAST(N'2026-11-11T05:47:01.5866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (185, N'2#085', 2, NULL, CAST(N'2026-11-11T05:47:01.5866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (186, N'2#086', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (187, N'2#087', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (188, N'2#088', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (189, N'2#089', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (190, N'2#090', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (191, N'2#091', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (192, N'2#092', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (193, N'2#093', 2, NULL, CAST(N'2026-11-11T05:47:01.5900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.5900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (194, N'2#094', 2, NULL, CAST(N'2026-11-11T05:47:01.5933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (195, N'2#095', 2, NULL, CAST(N'2026-11-11T05:47:01.5933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (196, N'2#096', 2, NULL, CAST(N'2026-11-11T05:47:01.5933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (197, N'2#097', 2, NULL, CAST(N'2026-11-11T05:47:01.5933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.5933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (198, N'2#098', 2, NULL, CAST(N'2026-11-11T05:47:01.5966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (199, N'2#099', 2, NULL, CAST(N'2026-11-11T05:47:01.5966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.5966667' AS DateTime2), 1)
GO
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (200, N'2#100', 2, NULL, CAST(N'2026-11-11T05:47:01.6000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (201, N'3#001', 3, NULL, CAST(N'2026-11-11T05:47:01.6000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (202, N'3#002', 3, NULL, CAST(N'2026-11-11T05:47:01.6000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (203, N'3#003', 3, NULL, CAST(N'2026-11-11T05:47:01.6000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (204, N'3#004', 3, NULL, CAST(N'2026-11-11T05:47:01.6000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (205, N'3#005', 3, NULL, CAST(N'2026-11-11T05:47:01.6000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (206, N'3#006', 3, NULL, CAST(N'2026-11-11T05:47:01.6033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (207, N'3#007', 3, NULL, CAST(N'2026-11-11T05:47:01.6033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (208, N'3#008', 3, NULL, CAST(N'2026-11-11T05:47:01.6033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (209, N'3#009', 3, NULL, CAST(N'2026-11-11T05:47:01.6033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (210, N'3#010', 3, NULL, CAST(N'2026-11-11T05:47:01.6033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (211, N'3#011', 3, NULL, CAST(N'2026-11-11T05:47:01.6066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (212, N'3#012', 3, NULL, CAST(N'2026-11-11T05:47:01.6066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (213, N'3#013', 3, NULL, CAST(N'2026-11-11T05:47:01.6066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (214, N'3#014', 3, NULL, CAST(N'2026-11-11T05:47:01.6066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (215, N'3#015', 3, NULL, CAST(N'2026-11-11T05:47:01.6066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (216, N'3#016', 3, NULL, CAST(N'2026-11-11T05:47:01.6100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (217, N'3#017', 3, NULL, CAST(N'2026-11-11T05:47:01.6100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (218, N'3#018', 3, NULL, CAST(N'2026-11-11T05:47:01.6100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (219, N'3#019', 3, NULL, CAST(N'2026-11-11T05:47:01.6100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (220, N'3#020', 3, NULL, CAST(N'2026-11-11T05:47:01.6100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (221, N'3#021', 3, NULL, CAST(N'2026-11-11T05:47:01.6100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (222, N'3#022', 3, NULL, CAST(N'2026-11-11T05:47:01.6100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (223, N'3#023', 3, NULL, CAST(N'2026-11-11T05:47:01.6133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (224, N'3#024', 3, NULL, CAST(N'2026-11-11T05:47:01.6133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (225, N'3#025', 3, NULL, CAST(N'2026-11-11T05:47:01.6133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (226, N'3#026', 3, NULL, CAST(N'2026-11-11T05:47:01.6133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (227, N'3#027', 3, NULL, CAST(N'2026-11-11T05:47:01.6133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (228, N'3#028', 3, NULL, CAST(N'2026-11-11T05:47:01.6133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (229, N'3#029', 3, NULL, CAST(N'2026-11-11T05:47:01.6166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (230, N'3#030', 3, NULL, CAST(N'2026-11-11T05:47:01.6166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (231, N'3#031', 3, NULL, CAST(N'2026-11-11T05:47:01.6166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (232, N'3#032', 3, NULL, CAST(N'2026-11-11T05:47:01.6166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (233, N'3#033', 3, NULL, CAST(N'2026-11-11T05:47:01.6166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (234, N'3#034', 3, NULL, CAST(N'2026-11-11T05:47:01.6200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (235, N'3#035', 3, NULL, CAST(N'2026-11-11T05:47:01.6200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (236, N'3#036', 3, NULL, CAST(N'2026-11-11T05:47:01.6200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (237, N'3#037', 3, NULL, CAST(N'2026-11-11T05:47:01.6200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (238, N'3#038', 3, NULL, CAST(N'2026-11-11T05:47:01.6200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (239, N'3#039', 3, NULL, CAST(N'2026-11-11T05:47:01.6233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (240, N'3#040', 3, NULL, CAST(N'2026-11-11T05:47:01.6233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (241, N'3#041', 3, NULL, CAST(N'2026-11-11T05:47:01.6233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (242, N'3#042', 3, NULL, CAST(N'2026-11-11T05:47:01.6233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (243, N'3#043', 3, NULL, CAST(N'2026-11-11T05:47:01.6233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (244, N'3#044', 3, NULL, CAST(N'2026-11-11T05:47:01.6266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (245, N'3#045', 3, NULL, CAST(N'2026-11-11T05:47:01.6266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (246, N'3#046', 3, NULL, CAST(N'2026-11-11T05:47:01.6266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (247, N'3#047', 3, NULL, CAST(N'2026-11-11T05:47:01.6266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (248, N'3#048', 3, NULL, CAST(N'2026-11-11T05:47:01.6266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (249, N'3#049', 3, NULL, CAST(N'2026-11-11T05:47:01.6266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (250, N'3#050', 3, NULL, CAST(N'2026-11-11T05:47:01.6300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (251, N'3#051', 3, NULL, CAST(N'2026-11-11T05:47:01.6300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (252, N'3#052', 3, NULL, CAST(N'2026-11-11T05:47:01.6300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (253, N'3#053', 3, NULL, CAST(N'2026-11-11T05:47:01.6300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (254, N'3#054', 3, NULL, CAST(N'2026-11-11T05:47:01.6300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (255, N'3#055', 3, NULL, CAST(N'2026-11-11T05:47:01.6300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (256, N'3#056', 3, NULL, CAST(N'2026-11-11T05:47:01.6300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (257, N'3#057', 3, NULL, CAST(N'2026-11-11T05:47:01.6333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (258, N'3#058', 3, NULL, CAST(N'2026-11-11T05:47:01.6333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (259, N'3#059', 3, NULL, CAST(N'2026-11-11T05:47:01.6333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (260, N'3#060', 3, NULL, CAST(N'2026-11-11T05:47:01.6333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (261, N'3#061', 3, NULL, CAST(N'2026-11-11T05:47:01.6333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (262, N'3#062', 3, NULL, CAST(N'2026-11-11T05:47:01.6333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (263, N'3#063', 3, NULL, CAST(N'2026-11-11T05:47:01.6366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (264, N'3#064', 3, NULL, CAST(N'2026-11-11T05:47:01.6366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (265, N'3#065', 3, NULL, CAST(N'2026-11-11T05:47:01.6366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (266, N'3#066', 3, NULL, CAST(N'2026-11-11T05:47:01.6366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (267, N'3#067', 3, NULL, CAST(N'2026-11-11T05:47:01.6366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (268, N'3#068', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (269, N'3#069', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (270, N'3#070', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (271, N'3#071', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (272, N'3#072', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (273, N'3#073', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (274, N'3#074', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (275, N'3#075', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (276, N'3#076', 3, NULL, CAST(N'2026-11-11T05:47:01.6400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (277, N'3#077', 3, NULL, CAST(N'2026-11-11T05:47:01.6433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (278, N'3#078', 3, NULL, CAST(N'2026-11-11T05:47:01.6433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (279, N'3#079', 3, NULL, CAST(N'2026-11-11T05:47:01.6433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (280, N'3#080', 3, NULL, CAST(N'2026-11-11T05:47:01.6433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (281, N'3#081', 3, NULL, CAST(N'2026-11-11T05:47:01.6433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (282, N'3#082', 3, NULL, CAST(N'2026-11-11T05:47:01.6433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (283, N'3#083', 3, NULL, CAST(N'2026-11-11T05:47:01.6466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (284, N'3#084', 3, NULL, CAST(N'2026-11-11T05:47:01.6466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (285, N'3#085', 3, NULL, CAST(N'2026-11-11T05:47:01.6466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (286, N'3#086', 3, NULL, CAST(N'2026-11-11T05:47:01.6466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (287, N'3#087', 3, NULL, CAST(N'2026-11-11T05:47:01.6466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (288, N'3#088', 3, NULL, CAST(N'2026-11-11T05:47:01.6466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (289, N'3#089', 3, NULL, CAST(N'2026-11-11T05:47:01.6466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (290, N'3#090', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (291, N'3#091', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (292, N'3#092', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (293, N'3#093', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (294, N'3#094', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (295, N'3#095', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (296, N'3#096', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (297, N'3#097', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (298, N'3#098', 3, NULL, CAST(N'2026-11-11T05:47:01.6500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (299, N'3#099', 3, NULL, CAST(N'2026-11-11T05:47:01.6533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6533333' AS DateTime2), 1)
GO
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (300, N'3#100', 3, NULL, CAST(N'2026-11-11T05:47:01.6533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (301, N'4#001', 4, NULL, CAST(N'2026-11-11T05:47:01.6533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (302, N'4#002', 4, NULL, CAST(N'2026-11-11T05:47:01.6533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (303, N'4#003', 4, NULL, CAST(N'2026-11-11T05:47:01.6533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (304, N'4#004', 4, NULL, CAST(N'2026-11-11T05:47:01.6533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (305, N'4#005', 4, NULL, CAST(N'2026-11-11T05:47:01.6533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (306, N'4#006', 4, NULL, CAST(N'2026-11-11T05:47:01.6566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (307, N'4#007', 4, NULL, CAST(N'2026-11-11T05:47:01.6566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (308, N'4#008', 4, NULL, CAST(N'2026-11-11T05:47:01.6566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (309, N'4#009', 4, NULL, CAST(N'2026-11-11T05:47:01.6566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (310, N'4#010', 4, NULL, CAST(N'2026-11-11T05:47:01.6566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (311, N'4#011', 4, NULL, CAST(N'2026-11-11T05:47:01.6600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (312, N'4#012', 4, NULL, CAST(N'2026-11-11T05:47:01.6600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (313, N'4#013', 4, NULL, CAST(N'2026-11-11T05:47:01.6600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (314, N'4#014', 4, NULL, CAST(N'2026-11-11T05:47:01.6600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (315, N'4#015', 4, NULL, CAST(N'2026-11-11T05:47:01.6633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (316, N'4#016', 4, NULL, CAST(N'2026-11-11T05:47:01.6633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (317, N'4#017', 4, NULL, CAST(N'2026-11-11T05:47:01.6633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (318, N'4#018', 4, NULL, CAST(N'2026-11-11T05:47:01.6633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (319, N'4#019', 4, NULL, CAST(N'2026-11-11T05:47:01.6633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (320, N'4#020', 4, NULL, CAST(N'2026-11-11T05:47:01.6633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (321, N'4#021', 4, NULL, CAST(N'2026-11-11T05:47:01.6666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (322, N'4#022', 4, NULL, CAST(N'2026-11-11T05:47:01.6666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (323, N'4#023', 4, NULL, CAST(N'2026-11-11T05:47:01.6666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (324, N'4#024', 4, NULL, CAST(N'2026-11-11T05:47:01.6666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (325, N'4#025', 4, NULL, CAST(N'2026-11-11T05:47:01.6666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (326, N'4#026', 4, NULL, CAST(N'2026-11-11T05:47:01.6666667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6666667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (327, N'4#027', 4, NULL, CAST(N'2026-11-11T05:47:01.6700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (328, N'4#028', 4, NULL, CAST(N'2026-11-11T05:47:01.6700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (329, N'4#029', 4, NULL, CAST(N'2026-11-11T05:47:01.6700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (330, N'4#030', 4, NULL, CAST(N'2026-11-11T05:47:01.6700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (331, N'4#031', 4, NULL, CAST(N'2026-11-11T05:47:01.6700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (332, N'4#032', 4, NULL, CAST(N'2026-11-11T05:47:01.6700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (333, N'4#033', 4, NULL, CAST(N'2026-11-11T05:47:01.6700000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6700000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (334, N'4#034', 4, NULL, CAST(N'2026-11-11T05:47:01.6733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (335, N'4#035', 4, NULL, CAST(N'2026-11-11T05:47:01.6733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (336, N'4#036', 4, NULL, CAST(N'2026-11-11T05:47:01.6733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (337, N'4#037', 4, NULL, CAST(N'2026-11-11T05:47:01.6733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (338, N'4#038', 4, NULL, CAST(N'2026-11-11T05:47:01.6733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (339, N'4#039', 4, NULL, CAST(N'2026-11-11T05:47:01.6733333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6733333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (340, N'4#040', 4, NULL, CAST(N'2026-11-11T05:47:01.6766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (341, N'4#041', 4, NULL, CAST(N'2026-11-11T05:47:01.6766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (342, N'4#042', 4, NULL, CAST(N'2026-11-11T05:47:01.6766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (343, N'4#043', 4, NULL, CAST(N'2026-11-11T05:47:01.6766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (344, N'4#044', 4, NULL, CAST(N'2026-11-11T05:47:01.6766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (345, N'4#045', 4, NULL, CAST(N'2026-11-11T05:47:01.6766667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6766667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (346, N'4#046', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (347, N'4#047', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (348, N'4#048', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (349, N'4#049', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (350, N'4#050', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (351, N'4#051', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (352, N'4#052', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (353, N'4#053', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (354, N'4#054', 4, NULL, CAST(N'2026-11-11T05:47:01.6800000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6800000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (355, N'4#055', 4, NULL, CAST(N'2026-11-11T05:47:01.6833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (356, N'4#056', 4, NULL, CAST(N'2026-11-11T05:47:01.6833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (357, N'4#057', 4, NULL, CAST(N'2026-11-11T05:47:01.6833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (358, N'4#058', 4, NULL, CAST(N'2026-11-11T05:47:01.6833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (359, N'4#059', 4, NULL, CAST(N'2026-11-11T05:47:01.6833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (360, N'4#060', 4, NULL, CAST(N'2026-11-11T05:47:01.6833333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6833333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (361, N'4#061', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (362, N'4#062', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (363, N'4#063', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (364, N'4#064', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (365, N'4#065', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (366, N'4#066', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (367, N'4#067', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (368, N'4#068', 4, NULL, CAST(N'2026-11-11T05:47:01.6866667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6866667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (369, N'4#069', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (370, N'4#070', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (371, N'4#071', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (372, N'4#072', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (373, N'4#073', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (374, N'4#074', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (375, N'4#075', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (376, N'4#076', 4, NULL, CAST(N'2026-11-11T05:47:01.6900000' AS DateTime2), CAST(N'2126-11-11T05:47:01.6900000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (377, N'4#077', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (378, N'4#078', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (379, N'4#079', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (380, N'4#080', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (381, N'4#081', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (382, N'4#082', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (383, N'4#083', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (384, N'4#084', 4, NULL, CAST(N'2026-11-11T05:47:01.6933333' AS DateTime2), CAST(N'2126-11-11T05:47:01.6933333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (385, N'4#085', 4, NULL, CAST(N'2026-11-11T05:47:01.6966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (386, N'4#086', 4, NULL, CAST(N'2026-11-11T05:47:01.6966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (387, N'4#087', 4, NULL, CAST(N'2026-11-11T05:47:01.6966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (388, N'4#088', 4, NULL, CAST(N'2026-11-11T05:47:01.6966667' AS DateTime2), CAST(N'2126-11-11T05:47:01.6966667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (389, N'4#089', 4, NULL, CAST(N'2026-11-11T05:47:01.7000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (390, N'4#090', 4, NULL, CAST(N'2026-11-11T05:47:01.7000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (391, N'4#091', 4, NULL, CAST(N'2026-11-11T05:47:01.7000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (392, N'4#092', 4, NULL, CAST(N'2026-11-11T05:47:01.7000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (393, N'4#093', 4, NULL, CAST(N'2026-11-11T05:47:01.7000000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7000000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (394, N'4#094', 4, NULL, CAST(N'2026-11-11T05:47:01.7033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (395, N'4#095', 4, NULL, CAST(N'2026-11-11T05:47:01.7033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (396, N'4#096', 4, NULL, CAST(N'2026-11-11T05:47:01.7033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (397, N'4#097', 4, NULL, CAST(N'2026-11-11T05:47:01.7033333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7033333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (398, N'4#098', 4, NULL, CAST(N'2026-11-11T05:47:01.7066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (399, N'4#099', 4, NULL, CAST(N'2026-11-11T05:47:01.7066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7066667' AS DateTime2), 1)
GO
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (400, N'4#100', 4, NULL, CAST(N'2026-11-11T05:47:01.7066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (401, N'5#001', 5, NULL, CAST(N'2026-11-11T05:47:01.7066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (402, N'5#002', 5, NULL, CAST(N'2026-11-11T05:47:01.7066667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7066667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (403, N'5#003', 5, NULL, CAST(N'2026-11-11T05:47:01.7100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (404, N'5#004', 5, NULL, CAST(N'2026-11-11T05:47:01.7100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (405, N'5#005', 5, NULL, CAST(N'2026-11-11T05:47:01.7100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (406, N'5#006', 5, NULL, CAST(N'2026-11-11T05:47:01.7100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (407, N'5#007', 5, NULL, CAST(N'2026-11-11T05:47:01.7100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (408, N'5#008', 5, NULL, CAST(N'2026-11-11T05:47:01.7100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (409, N'5#009', 5, NULL, CAST(N'2026-11-11T05:47:01.7100000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7100000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (410, N'5#010', 5, NULL, CAST(N'2026-11-11T05:47:01.7133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (411, N'5#011', 5, NULL, CAST(N'2026-11-11T05:47:01.7133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (412, N'5#012', 5, NULL, CAST(N'2026-11-11T05:47:01.7133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (413, N'5#013', 5, NULL, CAST(N'2026-11-11T05:47:01.7133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (414, N'5#014', 5, NULL, CAST(N'2026-11-11T05:47:01.7133333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7133333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (415, N'5#015', 5, NULL, CAST(N'2026-11-11T05:47:01.7166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (416, N'5#016', 5, NULL, CAST(N'2026-11-11T05:47:01.7166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (417, N'5#017', 5, NULL, CAST(N'2026-11-11T05:47:01.7166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (418, N'5#018', 5, NULL, CAST(N'2026-11-11T05:47:01.7166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (419, N'5#019', 5, NULL, CAST(N'2026-11-11T05:47:01.7166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (420, N'5#020', 5, NULL, CAST(N'2026-11-11T05:47:01.7166667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7166667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (421, N'5#021', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (422, N'5#022', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (423, N'5#023', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (424, N'5#024', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (425, N'5#025', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (426, N'5#026', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (427, N'5#027', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (428, N'5#028', 5, NULL, CAST(N'2026-11-11T05:47:01.7200000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7200000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (429, N'5#029', 5, NULL, CAST(N'2026-11-11T05:47:01.7233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (430, N'5#030', 5, NULL, CAST(N'2026-11-11T05:47:01.7233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (431, N'5#031', 5, NULL, CAST(N'2026-11-11T05:47:01.7233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (432, N'5#032', 5, NULL, CAST(N'2026-11-11T05:47:01.7233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (433, N'5#033', 5, NULL, CAST(N'2026-11-11T05:47:01.7233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (434, N'5#034', 5, NULL, CAST(N'2026-11-11T05:47:01.7233333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7233333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (435, N'5#035', 5, NULL, CAST(N'2026-11-11T05:47:01.7266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (436, N'5#036', 5, NULL, CAST(N'2026-11-11T05:47:01.7266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (437, N'5#037', 5, NULL, CAST(N'2026-11-11T05:47:01.7266667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7266667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (438, N'5#038', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (439, N'5#039', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (440, N'5#040', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (441, N'5#041', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (442, N'5#042', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (443, N'5#043', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (444, N'5#044', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (445, N'5#045', 5, NULL, CAST(N'2026-11-11T05:47:01.7300000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7300000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (446, N'5#046', 5, NULL, CAST(N'2026-11-11T05:47:01.7333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (447, N'5#047', 5, NULL, CAST(N'2026-11-11T05:47:01.7333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (448, N'5#048', 5, NULL, CAST(N'2026-11-11T05:47:01.7333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (449, N'5#049', 5, NULL, CAST(N'2026-11-11T05:47:01.7333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (450, N'5#050', 5, NULL, CAST(N'2026-11-11T05:47:01.7333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (451, N'5#051', 5, NULL, CAST(N'2026-11-11T05:47:01.7333333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7333333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (452, N'5#052', 5, NULL, CAST(N'2026-11-11T05:47:01.7366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (453, N'5#053', 5, NULL, CAST(N'2026-11-11T05:47:01.7366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (454, N'5#054', 5, NULL, CAST(N'2026-11-11T05:47:01.7366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (455, N'5#055', 5, NULL, CAST(N'2026-11-11T05:47:01.7366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (456, N'5#056', 5, NULL, CAST(N'2026-11-11T05:47:01.7366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (457, N'5#057', 5, NULL, CAST(N'2026-11-11T05:47:01.7366667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7366667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (458, N'5#058', 5, NULL, CAST(N'2026-11-11T05:47:01.7400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (459, N'5#059', 5, NULL, CAST(N'2026-11-11T05:47:01.7400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (460, N'5#060', 5, NULL, CAST(N'2026-11-11T05:47:01.7400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (461, N'5#061', 5, NULL, CAST(N'2026-11-11T05:47:01.7400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (462, N'5#062', 5, NULL, CAST(N'2026-11-11T05:47:01.7400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (463, N'5#063', 5, NULL, CAST(N'2026-11-11T05:47:01.7400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (464, N'5#064', 5, NULL, CAST(N'2026-11-11T05:47:01.7400000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7400000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (465, N'5#065', 5, NULL, CAST(N'2026-11-11T05:47:01.7433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (466, N'5#066', 5, NULL, CAST(N'2026-11-11T05:47:01.7433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (467, N'5#067', 5, NULL, CAST(N'2026-11-11T05:47:01.7433333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7433333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (468, N'5#068', 5, NULL, CAST(N'2026-11-11T05:47:01.7466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (469, N'5#069', 5, NULL, CAST(N'2026-11-11T05:47:01.7466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (470, N'5#070', 5, NULL, CAST(N'2026-11-11T05:47:01.7466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (471, N'5#071', 5, NULL, CAST(N'2026-11-11T05:47:01.7466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (472, N'5#072', 5, NULL, CAST(N'2026-11-11T05:47:01.7466667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7466667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (473, N'5#073', 5, NULL, CAST(N'2026-11-11T05:47:01.7500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (474, N'5#074', 5, NULL, CAST(N'2026-11-11T05:47:01.7500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (475, N'5#075', 5, NULL, CAST(N'2026-11-11T05:47:01.7500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (476, N'5#076', 5, NULL, CAST(N'2026-11-11T05:47:01.7500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (477, N'5#077', 5, NULL, CAST(N'2026-11-11T05:47:01.7500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (478, N'5#078', 5, NULL, CAST(N'2026-11-11T05:47:01.7500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (479, N'5#079', 5, NULL, CAST(N'2026-11-11T05:47:01.7500000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7500000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (480, N'5#080', 5, NULL, CAST(N'2026-11-11T05:47:01.7533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (481, N'5#081', 5, NULL, CAST(N'2026-11-11T05:47:01.7533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (482, N'5#082', 5, NULL, CAST(N'2026-11-11T05:47:01.7533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (483, N'5#083', 5, NULL, CAST(N'2026-11-11T05:47:01.7533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (484, N'5#084', 5, NULL, CAST(N'2026-11-11T05:47:01.7533333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7533333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (485, N'5#085', 5, NULL, CAST(N'2026-11-11T05:47:01.7566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (486, N'5#086', 5, NULL, CAST(N'2026-11-11T05:47:01.7566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (487, N'5#087', 5, NULL, CAST(N'2026-11-11T05:47:01.7566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (488, N'5#088', 5, NULL, CAST(N'2026-11-11T05:47:01.7566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (489, N'5#089', 5, NULL, CAST(N'2026-11-11T05:47:01.7566667' AS DateTime2), CAST(N'2126-11-11T05:47:01.7566667' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (490, N'5#090', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (491, N'5#091', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (492, N'5#092', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (493, N'5#093', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (494, N'5#094', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (495, N'5#095', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (496, N'5#096', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (497, N'5#097', 5, NULL, CAST(N'2026-11-11T05:47:01.7600000' AS DateTime2), CAST(N'2126-11-11T05:47:01.7600000' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (498, N'5#098', 5, NULL, CAST(N'2026-11-11T05:47:01.7633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7633333' AS DateTime2), 1)
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (499, N'5#099', 5, NULL, CAST(N'2026-11-11T05:47:01.7633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7633333' AS DateTime2), 1)
GO
INSERT [dbo].[Badges] ([Id], [BadgeNumber], [CategoryId], [PersonId], [IssueDate], [ExpiryDate], [IsActive]) VALUES (500, N'5#100', 5, NULL, CAST(N'2026-11-11T05:47:01.7633333' AS DateTime2), CAST(N'2126-11-11T05:47:01.7633333' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Badges] OFF
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (1, N'Cabinet du Gouverneur de Province')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (2, N'Ministere Provincial des Finances, Fonction Publique Provinciale, Emploi, Travail, Petites et Moyennes Entreprises et Artisanat')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (3, N'Ministere Provincial de l''Intérieur, Sécurité, Décentralisation, Affaires Coutumières, Droits Humains, Relations avec la Société Civile et Relations Intercommunautaires')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (4, N'Ministere Provincial des Mines, Hydrocarbures, Energie, Environnement et Développement Durable')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (5, N'Ministere Provincial des Infrastructures, Urbanisme, Habitat, Aménagement du Territoire et Affaires Foncières')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (6, N'Ministere Provincial de la Santé et Coordinations des Agences des Nations Unies et Partenaires du domaine de la Santé')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (7, N'Ministere Provincial de la Jeunesse, Éducation, Recherche Scientifique, Nouvelle Citoyenneté, Sports, Loisirs, Culture et Arts et Chargé de la Communication')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (8, N'Ministere Provincial de l''Agriculture, Pêche, Élevage, Alimentation et Développement Rural')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (9, N'Ministere Provincial du genre famille enfants')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (10, N'Ministere Provincial de l''Economie, Commerce, Transports et Tourisme')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (11, N'Ministere Provincial Plan, Budget, Coordination des Partenariats Publics - Privés et Relations avec l''Assemblée Provinciale')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (13, N'Protocole d''Etat')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (14, N'Presse du Gouvernorat')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (15, N'Secretariat Permanent')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (16, N'Secretariat Administratif')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (17, N'Secretariat Executif')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (18, N'Division Informatique')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (19, N'Service de Dispatch')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (20, N'Service de l''Intendance du Gouvernorat de Province')
INSERT [dbo].[Departments] ([Id], [Name]) VALUES (21, N'Service de la Police du Gouvernorat de Province')
SET IDENTITY_INSERT [dbo].[django_content_type] ON 

INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (1, N'admin', N'logentry')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (2, N'auth', N'group')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (3, N'auth', N'permission')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (4, N'auth', N'user')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (5, N'contenttypes', N'contenttype')
INSERT [dbo].[django_content_type] ([id], [app_label], [model]) VALUES (6, N'sessions', N'session')
SET IDENTITY_INSERT [dbo].[django_content_type] OFF
SET IDENTITY_INSERT [dbo].[django_migrations] ON 

INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (1, N'contenttypes', N'0001_initial', CAST(N'2026-11-11T14:36:41.3926680+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (2, N'auth', N'0001_initial', CAST(N'2026-11-11T14:36:41.4566100+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (3, N'admin', N'0001_initial', CAST(N'2026-11-11T14:36:41.4787850+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (4, N'admin', N'0002_logentry_remove_auto_add', CAST(N'2026-11-11T14:36:41.4879860+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (5, N'admin', N'0003_logentry_add_action_flag_choices', CAST(N'2026-11-11T14:36:41.5005510+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (6, N'contenttypes', N'0002_remove_content_type_name', CAST(N'2026-11-11T14:36:42.0805990+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (7, N'auth', N'0002_alter_permission_name_max_length', CAST(N'2026-11-11T14:36:42.0938650+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (8, N'auth', N'0003_alter_user_email_max_length', CAST(N'2026-11-11T14:36:42.1070100+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (9, N'auth', N'0004_alter_user_username_opts', CAST(N'2026-11-11T14:36:42.1193440+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (10, N'auth', N'0005_alter_user_last_login_null', CAST(N'2026-11-11T14:36:42.6575290+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (11, N'auth', N'0006_require_contenttypes_0002', CAST(N'2026-11-11T14:36:42.6646240+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (12, N'auth', N'0007_alter_validators_add_error_messages', CAST(N'2026-11-11T14:36:42.6758800+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (13, N'auth', N'0008_alter_user_username_max_length', CAST(N'2026-11-11T14:36:42.7405820+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (14, N'auth', N'0009_alter_user_last_name_max_length', CAST(N'2026-11-11T14:36:42.7553730+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (15, N'auth', N'0010_alter_group_name_max_length', CAST(N'2026-11-11T14:36:43.3527740+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (16, N'auth', N'0011_update_proxy_permissions', CAST(N'2026-11-11T14:36:43.3636010+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (17, N'auth', N'0012_alter_user_first_name_max_length', CAST(N'2026-11-11T14:36:43.3759780+00:00' AS DateTimeOffset))
INSERT [dbo].[django_migrations] ([id], [app], [name], [applied]) VALUES (18, N'sessions', N'0001_initial', CAST(N'2026-11-11T14:36:43.3885940+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[django_migrations] OFF
SET IDENTITY_INSERT [dbo].[Persons] ON 

INSERT [dbo].[Persons] ([Id], [LastName], [FirstName], [ForeName], [Gender], [PhoneNumber], [Provenance], [Role], [TypePieceId], [PartnerListId], [NumPiece]) VALUES (1, N'MWINKEU', N'MUPUNGA', N'Muriel', N'M', N'09565422', N'Grana', N'Agent', 3, NULL, N'3334343444')
INSERT [dbo].[Persons] ([Id], [LastName], [FirstName], [ForeName], [Gender], [PhoneNumber], [Provenance], [Role], [TypePieceId], [PartnerListId], [NumPiece]) VALUES (2, N'BANZA', N'MONGA', N'Carl', N'M', N'09565489', N'DRHKAT', N'Chef de bureau', 3, NULL, N'3121324243')
INSERT [dbo].[Persons] ([Id], [LastName], [FirstName], [ForeName], [Gender], [PhoneNumber], [Provenance], [Role], [TypePieceId], [PartnerListId], [NumPiece]) VALUES (3, N'BANZA', N'MONGA', N'Carl', N'M', N'09565489', N'DRHKAT', N'Chef de bureau', 3, NULL, N'3121324243')
INSERT [dbo].[Persons] ([Id], [LastName], [FirstName], [ForeName], [Gender], [PhoneNumber], [Provenance], [Role], [TypePieceId], [PartnerListId], [NumPiece]) VALUES (4, N'Trump', N'Donald', N'Junior', N'M', N'0974565776', N'USA', N'President', 5, NULL, N'009332344234')
SET IDENTITY_INSERT [dbo].[Persons] OFF
INSERT [dbo].[TypePieces] ([Id], [Name]) VALUES (1, N'Passport')
INSERT [dbo].[TypePieces] ([Id], [Name]) VALUES (2, N'Permis de conduire')
INSERT [dbo].[TypePieces] ([Id], [Name]) VALUES (3, N'Carte d''electeur')
INSERT [dbo].[TypePieces] ([Id], [Name]) VALUES (4, N'Carte d''identité nationale')
INSERT [dbo].[TypePieces] ([Id], [Name]) VALUES (5, N'Carte de service')
SET IDENTITY_INSERT [dbo].[Visitors] ON 

INSERT [dbo].[Visitors] ([Id], [PersonId], [BadgeId], [CreatedAtDate], [StartDate], [EndDate], [VisitedPerson], [VisitedPersonRole], [Purpose]) VALUES (1, 1, 1, CAST(N'2026-11-15T17:40:51.1645570' AS DateTime2), CAST(N'2026-11-15T17:32:00.0000000' AS DateTime2), CAST(N'2026-11-15T18:50:48.8004220' AS DateTime2), N'CD', N'Chef de division', N'Visite privée')
INSERT [dbo].[Visitors] ([Id], [PersonId], [BadgeId], [CreatedAtDate], [StartDate], [EndDate], [VisitedPerson], [VisitedPersonRole], [Purpose]) VALUES (2, 3, 2, CAST(N'2026-11-15T18:26:01.8976210' AS DateTime2), CAST(N'2026-11-15T18:23:00.0000000' AS DateTime2), CAST(N'2026-11-15T18:51:50.6377580' AS DateTime2), N'CD Mike', N'Chef de division Informatique', N'Visite de service')
INSERT [dbo].[Visitors] ([Id], [PersonId], [BadgeId], [CreatedAtDate], [StartDate], [EndDate], [VisitedPerson], [VisitedPersonRole], [Purpose]) VALUES (3, 4, 1, CAST(N'2026-11-15T19:00:47.4955890' AS DateTime2), CAST(N'2026-11-15T18:59:00.0000000' AS DateTime2), CAST(N'2026-11-15T19:08:01.9754030' AS DateTime2), N'Se KSM', N'Gouverneur de Province', N'Visite d''etat')
SET IDENTITY_INSERT [dbo].[Visitors] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_group_name_a6ea08ec_uniq]    Script Date: 11/16/26 9:02:13AM ******/
ALTER TABLE [dbo].[auth_group] ADD  CONSTRAINT [auth_group_name_a6ea08ec_uniq] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_b120cbf9]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_group_id_b120cbf9] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_group_id_permission_id_0cd325b0_uniq]    Script Date: 11/16/26 9:02:13AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_group_permissions_group_id_permission_id_0cd325b0_uniq] ON [dbo].[auth_group_permissions]
(
	[group_id] ASC,
	[permission_id] ASC
)
WHERE ([group_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_group_permissions_permission_id_84c5c92e]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [auth_group_permissions_permission_id_84c5c92e] ON [dbo].[auth_group_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_permission_content_type_id_2f476e4b]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [auth_permission_content_type_id_2f476e4b] ON [dbo].[auth_permission]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_permission_content_type_id_codename_01ab375a_uniq]    Script Date: 11/16/26 9:02:13AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_permission_content_type_id_codename_01ab375a_uniq] ON [dbo].[auth_permission]
(
	[content_type_id] ASC,
	[codename] ASC
)
WHERE ([content_type_id] IS NOT NULL AND [codename] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [auth_user_username_6821ab7c_uniq]    Script Date: 11/16/26 9:02:13AM ******/
ALTER TABLE [dbo].[auth_user] ADD  CONSTRAINT [auth_user_username_6821ab7c_uniq] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_group_id_97559544]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_group_id_97559544] ON [dbo].[auth_user_groups]
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_6a12ed8b]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [auth_user_groups_user_id_6a12ed8b] ON [dbo].[auth_user_groups]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_groups_user_id_group_id_94350c0c_uniq]    Script Date: 11/16/26 9:02:13AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_groups_user_id_group_id_94350c0c_uniq] ON [dbo].[auth_user_groups]
(
	[user_id] ASC,
	[group_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [group_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_permission_id_1fbb5f2c]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_permission_id_1fbb5f2c] ON [dbo].[auth_user_user_permissions]
(
	[permission_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_a95ead1b]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_a95ead1b] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq]    Script Date: 11/16/26 9:02:13AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [auth_user_user_permissions_user_id_permission_id_14a6b632_uniq] ON [dbo].[auth_user_user_permissions]
(
	[user_id] ASC,
	[permission_id] ASC
)
WHERE ([user_id] IS NOT NULL AND [permission_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_content_type_id_c4bce8eb]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_content_type_id_c4bce8eb] ON [dbo].[django_admin_log]
(
	[content_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_admin_log_user_id_c564eba6]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [django_admin_log_user_id_c564eba6] ON [dbo].[django_admin_log]
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [django_content_type_app_label_model_76bd3d3b_uniq]    Script Date: 11/16/26 9:02:13AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [django_content_type_app_label_model_76bd3d3b_uniq] ON [dbo].[django_content_type]
(
	[app_label] ASC,
	[model] ASC
)
WHERE ([app_label] IS NOT NULL AND [model] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [django_session_expire_date_a5c62663]    Script Date: 11/16/26 9:02:13AM ******/
CREATE NONCLUSTERED INDEX [django_session_expire_date_a5c62663] ON [dbo].[django_session]
(
	[expire_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Agents] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Badges] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Events] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Agents]  WITH CHECK ADD FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_group_id_b120cbf9_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_group_permissions]  WITH CHECK ADD  CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_group_permissions] CHECK CONSTRAINT [auth_group_permissions_permission_id_84c5c92e_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_permission]  WITH CHECK ADD  CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[auth_permission] CHECK CONSTRAINT [auth_permission_content_type_id_2f476e4b_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id] FOREIGN KEY([group_id])
REFERENCES [dbo].[auth_group] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_group_id_97559544_fk_auth_group_id]
GO
ALTER TABLE [dbo].[auth_user_groups]  WITH CHECK ADD  CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_groups] CHECK CONSTRAINT [auth_user_groups_user_id_6a12ed8b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id] FOREIGN KEY([permission_id])
REFERENCES [dbo].[auth_permission] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_permission_id_1fbb5f2c_fk_auth_permission_id]
GO
ALTER TABLE [dbo].[auth_user_user_permissions]  WITH CHECK ADD  CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[auth_user_user_permissions] CHECK CONSTRAINT [auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id]
GO
ALTER TABLE [dbo].[Badges]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[BadgeCategories] ([Id])
GO
ALTER TABLE [dbo].[Badges]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id] FOREIGN KEY([content_type_id])
REFERENCES [dbo].[django_content_type] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_content_type_id_c4bce8eb_fk_django_content_type_id]
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id] FOREIGN KEY([user_id])
REFERENCES [dbo].[auth_user] ([id])
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_user_id_c564eba6_fk_auth_user_id]
GO
ALTER TABLE [dbo].[EventBadgeCategories]  WITH CHECK ADD FOREIGN KEY([CategoryId])
REFERENCES [dbo].[BadgeCategories] ([Id])
GO
ALTER TABLE [dbo].[EventBadgeCategories]  WITH CHECK ADD FOREIGN KEY([EventId])
REFERENCES [dbo].[BadgeCategories] ([Id])
GO
ALTER TABLE [dbo].[PartnerLists]  WITH CHECK ADD FOREIGN KEY([EventId])
REFERENCES [dbo].[BadgeCategories] ([Id])
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD FOREIGN KEY([PartnerListId])
REFERENCES [dbo].[PartnerLists] ([Id])
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD FOREIGN KEY([TypePieceId])
REFERENCES [dbo].[TypePieces] ([Id])
GO
ALTER TABLE [dbo].[Visitors]  WITH CHECK ADD FOREIGN KEY([BadgeId])
REFERENCES [dbo].[Badges] ([Id])
GO
ALTER TABLE [dbo].[Visitors]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[django_admin_log]  WITH CHECK ADD  CONSTRAINT [django_admin_log_action_flag_a8637d59_check] CHECK  (([action_flag]>=(0)))
GO
ALTER TABLE [dbo].[django_admin_log] CHECK CONSTRAINT [django_admin_log_action_flag_a8637d59_check]
GO
USE [master]
GO
ALTER DATABASE [BadgeAccess] SET  READ_WRITE 
GO
