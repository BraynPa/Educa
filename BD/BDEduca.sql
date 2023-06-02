USE [master]
GO
/****** Object:  Database [BDEduca]    Script Date: 1/06/2023 09:47:42 ******/
CREATE DATABASE [BDEduca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDEduca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDEduca.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDEduca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\BDEduca_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BDEduca] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDEduca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDEduca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDEduca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDEduca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDEduca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDEduca] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDEduca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDEduca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDEduca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDEduca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDEduca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDEduca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDEduca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDEduca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDEduca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDEduca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDEduca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDEduca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDEduca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDEduca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDEduca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDEduca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDEduca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDEduca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BDEduca] SET  MULTI_USER 
GO
ALTER DATABASE [BDEduca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDEduca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDEduca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDEduca] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDEduca] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BDEduca] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BDEduca] SET QUERY_STORE = OFF
GO
USE [BDEduca]
GO
/****** Object:  Table [dbo].[Color]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ColorLight] [varchar](255) NULL,
	[ColorBlack] [varchar](255) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuestionario]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuestionario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCuestionario] [varchar](255) NULL,
	[DescripcionCuestionario] [varchar](255) NULL,
	[TipoCuestionario] [varchar](255) NULL,
 CONSTRAINT [PK_Cuestionario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuestionarioPregunta]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuestionarioPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [varchar](255) NULL,
	[IdCuestionario] [int] NULL,
 CONSTRAINT [PK_CuestionarioPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Curso]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreCurso] [varchar](255) NOT NULL,
	[IdGrado] [int] NOT NULL,
	[LinkImgCurso] [varchar](255) NULL,
	[IdColor] [int] NULL,
 CONSTRAINT [PK_Curso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejercicio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreEjercicio] [varchar](255) NULL,
	[DescripcionEjercicio] [varchar](255) NULL,
	[LinkEjercicio] [varchar](255) NULL,
	[IdLeccion] [int] NULL,
 CONSTRAINT [PK_Ejercicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grado]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grado](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumeroGrado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Grado] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Leccion]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Leccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TituloLeccion] [varchar](255) NULL,
	[DescripcionLeccion] [text] NULL,
	[LinkImgLeccion] [varchar](255) NULL,
	[TipoLeccion] [varchar](255) NULL,
	[IdColor] [int] NULL,
	[IdSubtema] [int] NULL,
 CONSTRAINT [PK_Leccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Libro]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Libro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TituloLibro] [varchar](255) NULL,
	[Autor] [varchar](255) NULL,
	[DescripcionLibro] [varchar](255) NULL,
	[EstadoLibro] [varchar](255) NULL,
	[LinkImgLibro] [varchar](255) NULL,
	[LinkPaginaLibro] [varchar](255) NULL,
	[IdLeccion] [int] NULL,
	[Color] [varchar](255) NULL,
 CONSTRAINT [PK_Libro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PagLeccion]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PagLeccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombrePagLeccion] [varchar](255) NULL,
	[LinkPagLeccion] [varchar](255) NULL,
	[DescripcionPagLeccion] [text] NULL,
	[IdLeccion] [int] NULL,
 CONSTRAINT [PK_PagLeccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PreguntaPrueba]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PreguntaPrueba](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PreguntaP] [varchar](255) NULL,
	[Respuesta] [varchar](255) NULL,
	[IdPrueba] [int] NULL,
 CONSTRAINT [PK_PreguntaPrueba] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prueba]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prueba](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombrePrueba] [varchar](255) NULL,
	[IdSubtema] [int] NULL,
	[LinkPrueba] [varchar](255) NULL,
	[Tipo] [int] NULL,
 CONSTRAINT [PK_Prueba] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecuperarPassword]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RecuperarPassword](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pin] [varchar](10) NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_RecuperarPassword] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subtema]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subtema](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TituloSubtema] [varchar](250) NOT NULL,
	[DescripcionSubtema] [text] NULL,
	[LinkImgSubtema] [varchar](250) NULL,
	[TipoSubtema] [varchar](250) NULL,
	[IdColor] [int] NOT NULL,
	[IdTema] [int] NOT NULL,
 CONSTRAINT [PK_Subtema] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tema]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tema](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TituloTema] [varchar](250) NOT NULL,
	[DescripcionTema] [text] NULL,
	[IdCurso] [int] NULL,
	[IdColor] [int] NULL,
	[LinkImgTema] [varchar](255) NULL,
 CONSTRAINT [PK_Tema] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](255) NOT NULL,
	[Age] [int] NULL,
	[Escuela] [varchar](255) NULL,
	[User] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[NombreTutor] [varchar](255) NULL,
	[EmailTutor] [varchar](255) NOT NULL,
	[CelularTutor] [varchar](255) NULL,
	[Avatar] [varchar](255) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioCuPregunta]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioCuPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdCuestionarioPregunta] [int] NULL,
	[Respuesta] [varchar](255) NULL,
 CONSTRAINT [PK_UsuarioCuPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioCurso]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioCurso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdCurso] [int] NULL,
	[EstadoCurso] [varchar](255) NULL,
	[NotaPrueba] [int] NULL,
	[PorcentajeAvance] [int] NULL,
	[UltFechaModif] [datetime] NULL,
 CONSTRAINT [PK_UsuarioCurso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioEjercicio]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioEjercicio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdEjercicio] [int] NULL,
	[EstadoUsuarioEjercicio] [varchar](255) NULL,
	[NotaUsuarioEjercicio] [int] NULL,
 CONSTRAINT [PK_UsuarioEjercicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioLeccion]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioLeccion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdLeccion] [int] NULL,
	[EstadoLeccion] [varchar](255) NULL,
	[NotaLeccion] [int] NULL,
	[PuntosLeccion] [int] NULL,
	[PorcentajeAvance] [int] NULL,
	[UltFechaModif] [datetime] NULL,
 CONSTRAINT [PK_UsuarioLeccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioLeccionPag]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioLeccionPag](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdPagLeccion] [int] NULL,
	[Estado] [varchar](255) NULL,
 CONSTRAINT [PK_UsuarioLeccionPag] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioLibro]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioLibro](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdLibro] [int] NULL,
	[EstadoUsuarioLibro] [varchar](255) NOT NULL,
 CONSTRAINT [PK_UsuarioLibro] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioLibroPregunta]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioLibroPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioLibro] [int] NULL,
	[IdPrueba] [int] NULL,
 CONSTRAINT [PK_UsuarioLibroPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioSubtema]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioSubtema](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdSubtema] [int] NULL,
	[EstadoSubtema] [varchar](255) NULL,
	[NotaPrueba] [int] NULL,
	[PuntosSubtema] [int] NULL,
	[PorcentajeAvance] [int] NULL,
	[UltFechaModif] [datetime] NULL,
 CONSTRAINT [PK_UsuarioSubtema] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioSubtemaPregunta]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioSubtemaPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioSubtema] [int] NULL,
	[IdPrueba] [int] NULL,
	[Estado] [varchar](255) NULL,
 CONSTRAINT [PK_UsuarioSubtemaPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioTema]    Script Date: 1/06/2023 09:47:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioTema](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NULL,
	[IdTema] [int] NULL,
	[EstadoTema] [varchar](255) NULL,
	[NotaPrueba] [int] NULL,
	[PuntosTema] [int] NULL,
	[PorcentajeAvance] [int] NULL,
	[UltFechaModif] [datetime] NULL,
 CONSTRAINT [PK_UsuarioTema] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Color] ON 

INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1, N'#fee4cb', N'#ff942e')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (2, N'#e9e7fd', N'#4f3ff0')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (3, N'#dbf6fd', N'#096c86')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (4, N'#ffd3e2', N'#df3670')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (5, N'#c8f7dc', N'#34c471')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (6, N'#d5deff', N'#4067f9')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (7, N'#fde798', N'#f9d240')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1002, N'#befff1e8', N'#40f9d2')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1003, N'#a1adf3', N'#2A2F4F')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1004, N'#BBE1FA', N'#1B262C')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1005, N'#BBDED6', N'#61C0BF')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1006, N'#F4EEFF', N'#F4EEFF')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1007, N'#FFEAD2', N'#424874')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1008, N'#F4EBC1', N'#D89216')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1009, N'#DDDDDD', N'#393E46')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1010, N'#94D0CC', N'#082032')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1011, N'#F4C7AB', N'#C84B31')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1012, N'#F3F1F5', N'#0F0E0E')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1013, N'#FFB3B3', N'#950101')
INSERT [dbo].[Color] ([Id], [ColorLight], [ColorBlack]) VALUES (1014, N'#DDFFBB', N'#4E9F3D')
SET IDENTITY_INSERT [dbo].[Color] OFF
GO
SET IDENTITY_INSERT [dbo].[Cuestionario] ON 

INSERT [dbo].[Cuestionario] ([Id], [NombreCuestionario], [DescripcionCuestionario], [TipoCuestionario]) VALUES (1, N'CuestionarioInicial', N'Cuestionario que se realiza al registrarse ', N'First')
SET IDENTITY_INSERT [dbo].[Cuestionario] OFF
GO
SET IDENTITY_INSERT [dbo].[CuestionarioPregunta] ON 

INSERT [dbo].[CuestionarioPregunta] ([Id], [Pregunta], [IdCuestionario]) VALUES (1, N'¿Puede identificar las vocales?', 1)
INSERT [dbo].[CuestionarioPregunta] ([Id], [Pregunta], [IdCuestionario]) VALUES (2, N'¿Puedes identificar el abecedario?', 1)
INSERT [dbo].[CuestionarioPregunta] ([Id], [Pregunta], [IdCuestionario]) VALUES (3, N'¿Puedes identificar la letra “b” y “v”?', 1)
INSERT [dbo].[CuestionarioPregunta] ([Id], [Pregunta], [IdCuestionario]) VALUES (4, N'¿Puedes identificar el título de un texto?', 1)
INSERT [dbo].[CuestionarioPregunta] ([Id], [Pregunta], [IdCuestionario]) VALUES (5, N'¿Puedes identificar el personaje principal de un texto?', 1)
INSERT [dbo].[CuestionarioPregunta] ([Id], [Pregunta], [IdCuestionario]) VALUES (6, N'¿Puedes identificar la moraleja de un texto?', 1)
SET IDENTITY_INSERT [dbo].[CuestionarioPregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[Curso] ON 

INSERT [dbo].[Curso] ([Id], [NombreCurso], [IdGrado], [LinkImgCurso], [IdColor]) VALUES (1, N'Comunicación', 1, N'https://i.pinimg.com/originals/f2/f6/b6/f2f6b650867f1d4cd1a85e6d8c7d874e.png', 1)
SET IDENTITY_INSERT [dbo].[Curso] OFF
GO
SET IDENTITY_INSERT [dbo].[Ejercicio] ON 

INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (1, N'Leccion1Ej1', N'Leccion1Ej1', N'Leccion1Ej1', 1)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (2, N'Leccion1Ej2', N'Leccion1Ej2', N'Leccion1Ej3', 1)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (3, N'Leccion1Ej3', N'Leccion1Ej3', N'Leccion1Ej3', 1)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (4, N'Leccion2Ej1', N'Leccion2Ej1', N'Leccion2Ej1', 2)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (5, N'Leccion3Ej1', N'Leccion3Ej1', N'Leccion3Ej1', 3)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (6, N'Leccion3Ej2', N'Leccion3Ej2', N'Leccion3Ej2', 3)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (7, N'Leccion3Ej3', N'Leccion3Ej3', N'Leccion3Ej3', 3)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (8, N'Leccion3Ej4', N'Leccion3Ej4', N'Leccion3Ej4', 3)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (9, N'Leccion3Ej5', N'Leccion3Ej5', N'Leccion3Ej5', 3)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (10, N'Leccion3Ej6', N'Leccion3Ej6', N'Leccion3Ej6', 3)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (11, N'Leccion4Ej1', N'Leccion4Ej1', N'Leccion4Ej1', 4)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (12, N'Leccion4Ej2', N'Leccion4Ej2', N'Leccion4Ej2', 4)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (13, N'Leccion5Ej1', N'Leccion5Ej1', N'Leccion5Ej1', 5)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (14, N'Leccion5Ej2', N'Leccion5Ej2', N'Leccion5Ej2', 5)
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (15, N'Leccion6Ej1', N'Leccion6Ej1', N'Leccion6Ej1', 6)
SET IDENTITY_INSERT [dbo].[Ejercicio] OFF
GO
SET IDENTITY_INSERT [dbo].[Grado] ON 

INSERT [dbo].[Grado] ([Id], [NumeroGrado]) VALUES (1, N'Primero')
SET IDENTITY_INSERT [dbo].[Grado] OFF
GO
SET IDENTITY_INSERT [dbo].[Leccion] ON 

INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (1, N'Números', N'La enseñanza de los números en primaria se enfoca en familiarizar a los niños con los números.', N'/Images/Leccion/Le1.png', N'Forma y Sonido', 1012, 1)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (2, N'Vocales', N'En el alfabeto español, las vocales son cinco: "a", "e", "i", "o" y "u". Los niños aprenden a reconocer y distinguir estas letras.', N'/Images/Leccion/Le2.png', N'Forma y Sonido', 4, 1)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (3, N'Consonantes', N'El alfabeto español consta de 21 consonantes: "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "ñ", "p", "q", "r", "s", "t", "v", "w", "x" e "y". Cada consonante tiene un sonido propio, y los niños aprenden a asociar la letra con su sonido correspondiente.', N'/Images/Leccion/Le3.png', N'Forma y Sonido', 2, 1)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (4, N'Mayúsculas', N'Las mayúsculas, también conocidas como letras capitales, son una forma especial de escritura que se utiliza para representar el inicio de una oración, nombres propios y otros casos específicos en el lenguaje escrito. Durante el aprendizaje de la lectura y la escritura en primaria, se les enseña a los niños a reconocer, identificar y utilizar las letras mayúsculas correctamente.', N'/Images/Leccion/Le4.png', N'Identificar', 3, 2)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (5, N'Minúsculas', N'Las minúsculas son las letras más comunes y utilizadas en el alfabeto. Durante el aprendizaje de la lectura y la escritura en primaria, se les enseña a los niños a reconocer, identificar y utilizar las letras minúsculas correctamente.', N'/Images/Leccion/Le5.png', N'Identificar', 5, 2)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (6, N'Familia', N'Identificar los miembros de la familia.', N'/Images/Leccion/Le6.png', N'Identificar', 6, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (7, N'Animales', N'Identificar los animales.', N'/Images/Leccion/Le7.png', N'Identificar', 7, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (8, N'Naturaleza', N'Identificar los miembros de la naturaleza.', N'/Images/Leccion/Le8.png', N'Identificar', 1002, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (9, N'Alimentos', N'Identificar los alimentos.', N'/Images/Leccion/Le9.png', N'Identificar', 1003, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (10, N'Objetos', N'Identificar los objetos.', N'/Images/Leccion/Le10.png', N'Identificar', 1004, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (11, N'Emociones', N'Identificar las emociones.', N'/Images/Leccion/Le11.png', N'Identificar', 1005, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (12, N'Partes del cuerpo', N'Identificar las partes del cuerpo.', N'/Images/Leccion/Le12.png', N'Identificar', 1006, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (13, N'Sustantivos', N'Durante el aprendizaje de los sustantivos, se les presenta a los niños ejemplos de sustantivos comunes que pueden ser fácilmente identificables en su entorno. Se les enseña a reconocer los sustantivos en oraciones y textos simples, y a diferenciarlos de otros tipos de palabras, como los verbos o los adjetivos.', N'/Images/Leccion/Le13.png', N'Identificar', 1007, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (14, N'Verbos', N'Durante el aprendizaje de los verbos, se les presentan a los niños ejemplos de verbos comunes que representan acciones que pueden realizar o presenciar en su entorno. Se les enseña a identificar los verbos en oraciones y textos simples, y a diferenciarlos de otros tipos de palabras, como los sustantivos o los adjetivos.', N'/Images/Leccion/Le14.png', N'Identificar', 1008, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (15, N'Adjetivos', N'Durante el aprendizaje de los adjetivos, se les presentan a los niños ejemplos de adjetivos que describen características de personas, animales y objetos. Se les enseña a identificar los adjetivos en oraciones y textos simples, y a diferenciarlos de otros tipos de palabras, como los sustantivos o los verbos.', N'/Images/Leccion/Le15.png', N'Identificar', 1009, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (16, N'Pronombres', N'Los pronombres son palabras que se utilizan en lugar de los nombres para referirse a personas, animales, cosas o ideas. En el primer grado de primaria, se enseña a los niños a reconocer y utilizar los pronombres de manera adecuada en el lenguaje.', N'/Images/Leccion/Le16.png', N'Identificar', 1010, 4)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (17, N'Monosílabas', N'El aprendizaje de las monosílabas se realiza a través de actividades interactivas y juegos lúdicos que ayudan a los niños a identificar y recordar estas palabras. Se les presentan ejemplos visuales y se fomenta la repetición y pronunciación correcta de las monosílabas.', N'/Images/Leccion/Le17.png', N'Formar', 1011, 5)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (18, N'Bisílabas', N'Las bisílabas son palabras que constan de dos sílabas. En el primer grado de primaria, se enseña a los niños a reconocer y utilizar bisílabas como parte de su desarrollo en la lectoescritura.', N'/Images/Leccion/Le18.png', N'Formar', 1012, 5)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (19, N'Trisílabas', N'Las trisílabas son palabras que constan de tres sílabas. En el primer grado de primaria, se introduce a los niños en el reconocimiento y uso de trisílabas como parte de su proceso de aprendizaje de la lectoescritura.', N'/Images/Leccion/Le19.png', N'Formar', 1013, 5)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (20, N'Saludos y preguntas', N'
Saludos y preguntas son fundamentales para enseñar a los niños de primer grado, ya que les ayudan a desarrollar habilidades sociales y comunicativas.', N'/Images/Leccion/Le20.png', N'Identificar', 1014, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (21, N'Gustos y preferencias', N'Enseñar gustos y preferencias a niños de primer grado es importante para fomentar su autoexpresión y desarrollo de habilidades comunicativas. ', N'/Images/Leccion/Le21.png', N'Identificar', 3, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (22, N'Necesidades y requerimientos', N'Enseñar a los niños de primer grado sobre necesidades y requerimientos básicos es fundamental para que comprendan cómo cuidar de sí mismos y de los demás.', N'/Images/Leccion/Le22.png', N'Identificar', 4, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (23, N'Datos personales', N'Enseñar a los niños de primer grado sobre la presentación y los datos personales es importante para ayudarles a desarrollar habilidades sociales y promover su autoconocimiento.', N'/Images/Leccion/Le23.png', N'Presentación', 5, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (24, N'Objetos y lugares', N'Enseñar a los niños de primer grado sobre la descripción de objetos y lugares es fundamental para desarrollar su vocabulario, capacidad de observación y habilidades de comunicación. ', N'/Images/Leccion/Le24.png', N'Descripción', 6, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (25, N'Animales', N'Enseñar a los niños de primer grado sobre la descripción de animales es una forma divertida y educativa de desarrollar su vocabulario, capacidad de observación y conocimiento del mundo natural.', N'/Images/Leccion/Le25.png', N'Descripción', 7, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (26, N'Rutina diaria', N'Enseñar a los niños de primer grado sobre las rutinas diarias es importante para ayudarles a desarrollar habilidades de organización, secuenciación y autonomía. ', N'/Images/Leccion/Le26.png', N'Descripción', 1002, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (27, N'Invitaciones y planes', N'Enseñar a los niños de primer grado sobre invitaciones y planes les permite desarrollar habilidades sociales, de comunicación y de organización. ', N'/Images/Leccion/Le27.png', N'Identificar', 1003, 6)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (28, N'Introducción', N'Explicación de qué son las palabras que riman', N'/Images/Leccion/Le28.png', N'Primer paso', 1004, 7)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (29, N'Identificación', N'Identificar palabras que riman en una lista dada.', N'/Images/Leccion/Le29.png', N'Segundo paso', 1005, 7)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (30, N'Discriminación', N'Diferenciar entre palabras que riman y palabras que no riman.', N'/Images/Leccion/Le30.png', N'Tercer paso', 1006, 7)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (31, N'Tomas', N'Historia1', N'/Images/Leccion/Le31.png', N'Comprensión', 1007, 9)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (32, N'El pollito aventurero', N'Historia2', N'/Images/Leccion/Le32.png', N'Comprensión', 1009, 9)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (33, N'El árbol de manzanas ', N'Historia3', N'/Images/Leccion/Le33.png', N'Comprensión', 1011, 9)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (34, N'El conejito y la zanahoria ', N'Historia4', N'/Images/Leccion/Le34.png', N'Comprensión', 4, 9)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (35, N'Simón dice', N'Sigue secuencia de colores, fomenta la memoria.', N'/Images/Leccion/Le35.png', N'Colores', 1012, 10)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (36, N'Ordenar', N'Ordenar actividades diarias', N'/Images/Leccion/Le36.png', N'Actividades', 2, 10)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (37, N'"Sí o No"', N'SI o no', N'/Images/Leccion/Le37.png', N'Actividades', 3, 10)
INSERT [dbo].[Leccion] ([Id], [TituloLeccion], [DescripcionLeccion], [LinkImgLeccion], [TipoLeccion], [IdColor], [IdSubtema]) VALUES (38, N'Memoria', N'Fomentar memoria de cosas aprendidas', N'/Images/Leccion/Le38.png', N'Identificar', 7, 10)
SET IDENTITY_INSERT [dbo].[Leccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Libro] ON 

INSERT [dbo].[Libro] ([Id], [TituloLibro], [Autor], [DescripcionLibro], [EstadoLibro], [LinkImgLibro], [LinkPaginaLibro], [IdLeccion], [Color]) VALUES (1, N'Tomas', N'Educa', N'El conejito es muy travieso. ', N'Incompleto', N'/Images/Subtema/HistoriasSencillas/Historia1/PortadaH1.png', N'/historia/preHistoria?libro=tomas', 31, N' ')
INSERT [dbo].[Libro] ([Id], [TituloLibro], [Autor], [DescripcionLibro], [EstadoLibro], [LinkImgLibro], [LinkPaginaLibro], [IdLeccion], [Color]) VALUES (2, N'El pollito aventurero', N'Educa', N'Pepito siempre quería explorar y descubrir cosas nuevas.', N'Incompleto', N'/Images/Subtema/HistoriasSencillas/Historia2/PortadaH2.png', N'/historia/preHistoria?libro=elPollitoAventurero', 32, N'book-blue')
INSERT [dbo].[Libro] ([Id], [TituloLibro], [Autor], [DescripcionLibro], [EstadoLibro], [LinkImgLibro], [LinkPaginaLibro], [IdLeccion], [Color]) VALUES (3, N'El árbol de manzanas', N'Educa', N'Una casa donde había un árbol que daba manzanas muy deliciosas.', N'Incompleto', N'/Images/Subtema/HistoriasSencillas/Historia3/PortadaH3.png', N'/historia/preHistoria?libro=arbolManzanas', 33, N'book-pink')
INSERT [dbo].[Libro] ([Id], [TituloLibro], [Autor], [DescripcionLibro], [EstadoLibro], [LinkImgLibro], [LinkPaginaLibro], [IdLeccion], [Color]) VALUES (4, N'El conejito y la zanahoria ', N'Educa', N'El conejito estaba muy hambriento y buscaba algo para comer. ', N'Incompleto', N'/Images/Subtema/HistoriasSencillas/Historia4/PortadaH4.png', N'/historia/preHistoria?libro=conejitoZanahoria ', 34, N'book-yellow')
SET IDENTITY_INSERT [dbo].[Libro] OFF
GO
SET IDENTITY_INSERT [dbo].[PagLeccion] ON 

INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (1, N'Leccion1Pag1', N'Leccion1Pag1', N'Leccion1Pag1', 1)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (2, N'Leccion1Pag2', N'Leccion1Pag2', N'Leccion1Pag2', 1)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (3, N'Leccion1Pag3', N'Leccion1Pag3', N'Leccion1Pag3', 1)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (4, N'Leccion2Pag1', N'Leccion2Pag1', N'Leccion2Pag1', 2)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (5, N'Leccion2Pag2', N'Leccion2Pag2', N'Leccion2Pag2', 2)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (6, N'Leccion3Pag1', N'Leccion3Pag1', N'Leccion3Pag1', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (7, N'Leccion3Pag2', N'Leccion3Pag2', N'Leccion3Pag2', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (8, N'Leccion3Pag3', N'Leccion3Pag3', N'Leccion3Pag3', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (9, N'Leccion3Pag4', N'Leccion3Pag4', N'Leccion3Pag4', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (10, N'Leccion3Pag5', N'Leccion3Pag5', N'Leccion3Pag5', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (11, N'Leccion3Pag6', N'Leccion3Pag6', N'Leccion3Pag6', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (12, N'Leccion3Pag7', N'Leccion3Pag7', N'Leccion3Pag7', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (13, N'Leccion3Pag8', N'Leccion3Pag8', N'Leccion3Pag8', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (14, N'Leccion3Pag9', N'Leccion3Pag9', N'Leccion3Pag9', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (15, N'Leccion3Pag10', N'Leccion3Pag10', N'Leccion3Pag10', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (16, N'Leccion3Pag11', N'Leccion3Pag11', N'Leccion3Pag11', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (17, N'Leccion3Pag12', N'Leccion3Pag12', N'Leccion3Pag12', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (18, N'Leccion3Pag13', N'Leccion3Pag13', N'Leccion3Pag13', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (19, N'Leccion3Pag14', N'Leccion3Pag14', N'Leccion3Pag14', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (20, N'Leccion3Pag15', N'Leccion3Pag15', N'Leccion3Pag15', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (21, N'Leccion3Pag16', N'Leccion3Pag16', N'Leccion3Pag16', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (22, N'Leccion3Pag17', N'Leccion3Pag17', N'Leccion3Pag17', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (23, N'Leccion3Pag18', N'Leccion3Pag18', N'Leccion3Pag18', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (24, N'Leccion3Pag19', N'Leccion3Pag19', N'Leccion3Pag19', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (25, N'Leccion3Pag20', N'Leccion3Pag20', N'Leccion3Pag20', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (26, N'Leccion3Pag21', N'Leccion3Pag21', N'Leccion3Pag21', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (27, N'Leccion3Pag22', N'Leccion3Pag22', N'Leccion3Pag22', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (28, N'Leccion3Pag23', N'Leccion3Pag23', N'Leccion3Pag23', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (29, N'Leccion3Pag24', N'Leccion3Pag24', N'Leccion3Pag24', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (30, N'Leccion3Pag25', N'Leccion3Pag25', N'Leccion3Pag25', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (31, N'Leccion3Pag26', N'Leccion3Pag26', N'Leccion3Pag26', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (32, N'Leccion3Pag27', N'Leccion3Pag27', N'Leccion3Pag27', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (33, N'Leccion3Pag28', N'Leccion3Pag28', N'Leccion3Pag28', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (34, N'Leccion3Pag29', N'Leccion3Pag29', N'Leccion3Pag29', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (35, N'Leccion3Pag30', N'Leccion3Pag30', N'Leccion3Pag30', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (36, N'Leccion3Pag31', N'Leccion3Pag31', N'Leccion3Pag31', 3)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (37, N'Leccion4Pag1', N'Leccion4Pag1', N'Leccion4Pag1', 4)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (38, N'Leccion4Pag2', N'Leccion4Pag2', N'Leccion4Pag2', 4)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (39, N'Leccion4Pag3', N'Leccion4Pag3', N'Leccion4Pag3', 4)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (40, N'Leccion5Pag1', N'Leccion5Pag1', N'Leccion5Pag1', 5)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (41, N'Leccion5Pag2', N'Leccion5Pag2', N'Leccion5Pag2', 5)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (42, N'Leccion6Pag1', N'Leccion6Pag1', N'Leccion6Pag1', 6)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (43, N'Leccion7Pag1', N'Leccion7Pag1', N'Leccion7Pag1', 7)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (44, N'Leccion7Pag2', N'Leccion7Pag2', N'Leccion7Pag2', 7)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (45, N'Leccion7Pag3', N'Leccion7Pag3', N'Leccion7Pag3', 7)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (46, N'Leccion7Pag4', N'Leccion7Pag4', N'Leccion7Pag4', 7)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (47, N'Leccion7Pag5', N'Leccion7Pag5', N'Leccion7Pag5', 7)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (48, N'Leccion7Pag6', N'Leccion7Pag6', N'Leccion7Pag6', 7)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (49, N'Leccion7Pag7', N'Leccion7Pag7', N'Leccion7Pag7', 7)
SET IDENTITY_INSERT [dbo].[PagLeccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Prueba] ON 

INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (1, N'Escritura', 1, N'/paginas/Subtema1Exam1', 1)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (2, N'Sonidos', 1, N'/paginas/Subtema1Exam2', 1)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (3, N'IdentificaMayusMin', 2, N'/paginas/Subtema2Exam1', 1)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (4, N'CompresionLectora', 1, N'/Historia/Prueba1', 2)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (5, N'CompresionLectora', 2, N'/Historia/Prueba2', 2)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (6, N'CompresionLectora', 3, N'/Historia/Prueba3', 2)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (7, N'CompresionLectora', 4, N'/Historia/Prueba4', 2)
SET IDENTITY_INSERT [dbo].[Prueba] OFF
GO
SET IDENTITY_INSERT [dbo].[Subtema] ON 

INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (1, N'Letras – Números ', N'El tema de letras y números es fundamental para el aprendizaje temprano de los niños, ya que les permite familiarizarse con el alfabeto, los números y su relación. El reconocimiento de letras y números es la base para el aprendizaje de la lectura, escritura y las habilidades matemáticas básicas.', N'https://images.vexels.com/media/users/3/189789/isolated/preview/78f2f422b7b634a10e2847020605a900-icono-de-bloques-de-letras.png', N'Forma y Sonido', 7, 1)
INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (2, N'Mayúsculas - Minúsculas', N'El reconocimiento de mayúsculas y minúsculas es un aspecto fundamental del aprendizaje temprano de la lectura y la escritura. Los niños aprenden a distinguir entre letras mayúsculas y minúsculas, a identificarlas. Además,  es importante para la ortografía y la gramática, y es un requisito básico para la escritura de oraciones y párrafos bien estructurados.', N'https://cdn-icons-png.flaticon.com/512/68/68216.png', N'Identificar', 1013, 1)
INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (4, N'Palabras Sencillas', N'Las palabras sencillas son aquellas que se caracterizan por su estructura simple y su fácil comprensión. Se utilizan comúnmente en el lenguaje cotidiano y suelen estar compuestas por pocas letras y sílabas. ', N'https://cdn-icons-png.flaticon.com/512/3721/3721746.png', N'Identificar', 1009, 1)
INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (5, N'Palabras a partir de silabas', N'
Las palabras a partir de sílabas son aquellas que se forman al unir dos o más sílabas. A través de este proceso, se pueden crear nuevas palabras que no existen como términos independientes. Las palabras a partir de sílabas son una parte fundamental del proceso de aprendizaje del lenguaje, ya que permiten a los niños identificar y segmentar los sonidos que componen una palabra. ', N'https://cdn-icons-png.flaticon.com/512/861/861039.png', N'Formar', 1010, 1)
INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (6, N'Frases Sencillas', N'Se utilizan para enseñarles a los más pequeños cómo comunicarse y expresarse de manera clara. Estas frases suelen estar compuestas por palabras sencillas y cotidianas que los niños pueden entender fácilmente y suelen tener una estructura gramatical básica y sencilla.', N'https://cdn-icons-png.flaticon.com/512/861/861039.png', N'Formar', 3, 1)
INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (7, N'Palabras que Rimen', N'Las palabras que rimen son aquellas que tienen una coincidencia en la pronunciación del sonido final a partir de la última vocal acentuada. Es decir, las palabras que tienen una similitud en su sonido final y que se utilizan para crear rimas y hacer más creativas las composiciones literarias, como poemas, canciones, entre otros. ', N'https://cdn-icons-png.flaticon.com/512/3025/3025237.png', N'Identificar', 1008, 1)
INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (9, N'Historias Sencillas', N'Las historias sencillas son relatos cortos y fáciles de entender que se caracterizan por tener una estructura simple y un lenguaje claro y accesible para los niños. Estas historias suelen tener tramas sencillas, personajes identificables y un mensaje claro y positivo que promueve valores y enseñanzas. ', N'https://cdn-icons-png.flaticon.com/512/2201/2201580.png', N'Comprensión', 1012, 2)
INSERT [dbo].[Subtema] ([Id], [TituloSubtema], [DescripcionSubtema], [LinkImgSubtema], [TipoSubtema], [IdColor], [IdTema]) VALUES (10, N'Instrucciones Simples', N'Las instrucciones simples son una serie de pasos o acciones claras y fáciles de seguir que se dan para llevar a cabo una tarea específica. Estas instrucciones suelen estar compuestas por frases cortas y directas que indican cómo realizar la tarea de manera sencilla y eficaz. ', N'https://cdn-icons-png.flaticon.com/512/2618/2618630.png', N'Comprensión', 2, 3)
SET IDENTITY_INSERT [dbo].[Subtema] OFF
GO
SET IDENTITY_INSERT [dbo].[Tema] ON 

INSERT [dbo].[Tema] ([Id], [TituloTema], [DescripcionTema], [IdCurso], [IdColor], [LinkImgTema]) VALUES (1, N'Comprensión de palabras y frases', N'Es la habilidad de entender el significado de las palabras y frases utilizadas en la comunicación oral y escrita. Es importante para procesar y entender la información en una conversación o en un texto, y está relacionada con la memoria y la capacidad de concentración.', 1, 4, N'/Images/Tema/Tema1.png')
INSERT [dbo].[Tema] ([Id], [TituloTema], [DescripcionTema], [IdCurso], [IdColor], [LinkImgTema]) VALUES (2, N'Comprensión lectora', N' Es la habilidad de entender lo que se lee, no sólo las palabras, sino también su significado y cómo se relacionan con el contexto general del texto. Es una habilidad esencial para aprender y acceder a información importante.', 1, 1010, N'/Images/Tema/Tema2.png')
INSERT [dbo].[Tema] ([Id], [TituloTema], [DescripcionTema], [IdCurso], [IdColor], [LinkImgTema]) VALUES (3, N'Comprensión auditiva', N'Se refiere a su capacidad para entender y procesar la información que escuchan. Es una habilidad fundamental para el desarrollo del lenguaje y la comunicación efectiva.', 1, 1012, N'/Images/Tema/Tema3.png')
SET IDENTITY_INSERT [dbo].[Tema] OFF
GO
USE [master]
GO
ALTER DATABASE [BDEduca] SET  READ_WRITE 
GO
