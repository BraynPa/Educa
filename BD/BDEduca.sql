USE [master]
GO
/****** Object:  Database [BDEduca]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Cuestionario]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[CuestionarioPregunta]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Curso]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 26/05/2023 01:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ejercicio](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombreEjercicio] [varchar](255) NULL,
	[DescripcionEjercicio] [varchar](255) NULL,
	[LinkEjercicio] [varchar](255) NULL,
	[IdPagLeccion] [int] NULL,
 CONSTRAINT [PK_Ejercicio] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grado]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Leccion]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Libro]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[PagLeccion]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[PreguntaPrueba]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Prueba]    Script Date: 26/05/2023 01:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prueba](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NombrePrueba] [varchar](255) NULL,
 CONSTRAINT [PK_Prueba] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RecuperarPassword]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Subtema]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Tema]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioCuPregunta]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioCurso]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioEjercicio]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioLeccion]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioLeccionPag]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioLibro]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioLibroPregunta]    Script Date: 26/05/2023 01:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioLibroPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioLibro] [int] NULL,
	[IdPreguntaPrueba] [int] NULL,
	[ValorPregunta] [int] NULL,
 CONSTRAINT [PK_UsuarioLibroPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioSubtema]    Script Date: 26/05/2023 01:55:54 ******/
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
/****** Object:  Table [dbo].[UsuarioSubtemaPregunta]    Script Date: 26/05/2023 01:55:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioSubtemaPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioSubtema] [int] NULL,
	[IdPreguntaPrueba] [int] NULL,
	[ValorPregunta] [int] NULL,
 CONSTRAINT [PK_UsuarioSubtemaPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioTema]    Script Date: 26/05/2023 01:55:54 ******/
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
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar]) VALUES (19, N'Luis Perez Valdes', 12, N'San Ramon', N'Luisito', N'Luis1w234.', N'Ana valdes', N'bry1301@gmail.com', N'976122782', N'/Images/Home/Avatar1.png')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar]) VALUES (20, N'David Aaron', 10, N'San Ramon', N'D4Br4', N'741852963.123', N'Rosa', N'david.pajares25@gmail.com', N'937258524', N'/Images/Home/Avatar2.png')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar]) VALUES (21, N'David Aaron', 10, N'San Ramon', N'D4Br4', N'741852963.123', N'Rosa', N'david.pajares25@gmail.com', N'937258524', N'/Images/Home/Avatar3.png')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar]) VALUES (22, N'Brayan Pajares', 12, N'San Ramon', N'Brayancito', N'Bpaja.741', N'Rosa', N'bry1301@gmail.com', N'976122782', N'/Images/Home/Avatar4.png')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar]) VALUES (1003, N'Prueba', 12, N'San Ramon', N'Prueba', N'Prueba123.', N'CuPrueba', N'bry1301@gmail.com', N'976122782', N'/Images/Home/Avatar5.png')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar]) VALUES (1004, N'Marilin', 12, N'La recoleta', N'Mar', N'Mar123.', N'Rosa', N'bry1301@gmail.com', N'976122782', N'/Images/Home/Avatar6.png')
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar]) VALUES (1005, N'Borrar', 12, N'Borrar', N'Borrar', N'Borrar', N'Borrar', N'b@de.upn', N'987654321', N'/Images/Home/Avatar3.png')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioCuPregunta] ON 

INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (49, 19, 1, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (50, 19, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (51, 19, 3, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (52, 19, 4, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (53, 19, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (54, 19, 6, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (55, 20, 1, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (56, 20, 2, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (57, 20, 3, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (58, 20, 4, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (59, 20, 5, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (60, 20, 6, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (61, 22, 1, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (62, 22, 2, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (63, 22, 3, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (64, 22, 4, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (65, 22, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (66, 22, 6, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1002, 1003, 1, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1003, 1003, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1004, 1003, 3, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1005, 1003, 4, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1006, 1003, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1007, 1003, 6, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1008, 1004, 1, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1009, 1004, 2, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1010, 1004, 3, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1011, 1004, 4, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1012, 1004, 5, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1013, 1004, 6, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1014, 1005, 1, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1015, 1005, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1016, 1005, 3, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1017, 1005, 4, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1018, 1005, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1019, 1005, 6, N'No')
SET IDENTITY_INSERT [dbo].[UsuarioCuPregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioCurso] ON 

INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (3, 19, 1, N'No iniciado', 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (4, 20, 1, N'No iniciado', 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (5, 22, 1, N'No iniciado', 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1002, 1003, 1, N'No iniciado', 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1003, 1004, 1, N'No iniciado', 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1004, 1005, 1, N'No iniciado', 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioCurso] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioLeccion] ON 

INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (77, 19, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (78, 19, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (79, 19, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (80, 19, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (81, 19, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (82, 19, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (83, 19, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (84, 19, 8, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (85, 19, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (86, 19, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (87, 19, 11, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (88, 19, 12, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (89, 19, 13, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (90, 19, 14, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (91, 19, 15, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (92, 19, 16, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (93, 19, 17, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (94, 19, 18, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (95, 19, 19, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (96, 19, 20, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (97, 19, 21, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (98, 19, 22, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (99, 19, 23, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (100, 19, 24, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (101, 19, 25, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (102, 19, 26, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (103, 19, 27, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (104, 19, 28, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (105, 19, 29, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (106, 19, 30, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (107, 19, 31, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (108, 19, 32, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (109, 19, 33, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (110, 19, 34, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (111, 19, 35, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (112, 19, 36, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (113, 19, 37, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (114, 19, 38, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (115, 20, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (116, 20, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (117, 20, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (118, 20, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (119, 20, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (120, 20, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (121, 20, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (122, 20, 8, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (123, 20, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (124, 20, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (125, 20, 11, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (126, 20, 12, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (127, 20, 13, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (128, 20, 14, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (129, 20, 15, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (130, 20, 16, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (131, 20, 17, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (132, 20, 18, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (133, 20, 19, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (134, 20, 20, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (135, 20, 21, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (136, 20, 22, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (137, 20, 23, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (138, 20, 24, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (139, 20, 25, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (140, 20, 26, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (141, 20, 27, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (142, 20, 28, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (143, 20, 29, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (144, 20, 30, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (145, 20, 31, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (146, 20, 32, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (147, 20, 33, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (148, 20, 34, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (149, 20, 35, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (150, 20, 36, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (151, 20, 37, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (152, 20, 38, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (153, 22, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (154, 22, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (155, 22, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (156, 22, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (157, 22, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (158, 22, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (159, 22, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (160, 22, 8, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (161, 22, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (162, 22, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (163, 22, 11, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (164, 22, 12, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (165, 22, 13, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (166, 22, 14, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (167, 22, 15, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (168, 22, 16, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (169, 22, 17, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (170, 22, 18, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (171, 22, 19, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (172, 22, 20, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (173, 22, 21, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (174, 22, 22, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (175, 22, 23, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
GO
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (176, 22, 24, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (177, 22, 25, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (178, 22, 26, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (179, 22, 27, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (180, 22, 28, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (181, 22, 29, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (182, 22, 30, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (183, 22, 31, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (184, 22, 32, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (185, 22, 33, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (186, 22, 34, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (187, 22, 35, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (188, 22, 36, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (189, 22, 37, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (190, 22, 38, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1002, 1003, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1003, 1003, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1004, 1003, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1005, 1003, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1006, 1003, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1007, 1003, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1008, 1003, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1009, 1003, 8, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1010, 1003, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1011, 1003, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1012, 1003, 11, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1013, 1003, 12, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1014, 1003, 13, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1015, 1003, 14, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1016, 1003, 15, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1017, 1003, 16, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1018, 1003, 17, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1019, 1003, 18, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1020, 1003, 19, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1021, 1003, 20, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1022, 1003, 21, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1023, 1003, 22, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1024, 1003, 23, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1025, 1003, 24, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1026, 1003, 25, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1027, 1003, 26, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1028, 1003, 27, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1029, 1003, 28, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1030, 1003, 29, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1031, 1003, 30, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1032, 1003, 31, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1033, 1003, 32, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1034, 1003, 33, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1035, 1003, 34, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1036, 1003, 35, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1037, 1003, 36, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1038, 1003, 37, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1039, 1003, 38, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1040, 1004, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1041, 1004, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1042, 1004, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1043, 1004, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1044, 1004, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1045, 1004, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1046, 1004, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1047, 1004, 8, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1048, 1004, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1049, 1004, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1050, 1004, 11, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1051, 1004, 12, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1052, 1004, 13, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1053, 1004, 14, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1054, 1004, 15, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1055, 1004, 16, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1056, 1004, 17, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1057, 1004, 18, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1058, 1004, 19, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1059, 1004, 20, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1060, 1004, 21, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1061, 1004, 22, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1062, 1004, 23, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1063, 1004, 24, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1064, 1004, 25, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1065, 1004, 26, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1066, 1004, 27, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1067, 1004, 28, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1068, 1004, 29, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1069, 1004, 30, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1070, 1004, 31, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1071, 1004, 32, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1072, 1004, 33, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1073, 1004, 34, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1074, 1004, 35, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1075, 1004, 36, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1076, 1004, 37, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1077, 1004, 38, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1078, 1005, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1079, 1005, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1080, 1005, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1081, 1005, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1082, 1005, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1083, 1005, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1084, 1005, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1085, 1005, 8, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1086, 1005, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
GO
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1087, 1005, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1088, 1005, 11, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1089, 1005, 12, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1090, 1005, 13, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1091, 1005, 14, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1092, 1005, 15, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1093, 1005, 16, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1094, 1005, 17, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1095, 1005, 18, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1096, 1005, 19, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1097, 1005, 20, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1098, 1005, 21, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1099, 1005, 22, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1100, 1005, 23, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1101, 1005, 24, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1102, 1005, 25, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1103, 1005, 26, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1104, 1005, 27, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1105, 1005, 28, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1106, 1005, 29, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1107, 1005, 30, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1108, 1005, 31, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1109, 1005, 32, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1110, 1005, 33, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1111, 1005, 34, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1112, 1005, 35, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1113, 1005, 36, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1114, 1005, 37, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1115, 1005, 38, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioLeccion] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioLibro] ON 

INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (77, 19, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (78, 19, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (79, 19, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (80, 19, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (81, 20, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (82, 20, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (83, 20, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (84, 20, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (85, 22, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (86, 22, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (87, 22, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (88, 22, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1002, 1003, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1003, 1003, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1004, 1003, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1005, 1003, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1006, 1004, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1007, 1004, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1008, 1004, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1009, 1004, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1010, 1005, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1011, 1005, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1012, 1005, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1013, 1005, 4, N'Incompleto')
SET IDENTITY_INSERT [dbo].[UsuarioLibro] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioSubtema] ON 

INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (17, 19, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (18, 19, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (19, 19, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (20, 19, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (21, 19, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (22, 19, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (23, 19, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (24, 19, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (25, 20, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (26, 20, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (27, 20, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (28, 20, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (29, 20, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (30, 20, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (31, 20, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (32, 20, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (33, 22, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (34, 22, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (35, 22, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (36, 22, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (37, 22, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (38, 22, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (39, 22, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (40, 22, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1002, 1003, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1003, 1003, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1004, 1003, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1005, 1003, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1006, 1003, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1007, 1003, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1008, 1003, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1009, 1003, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1010, 1004, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1011, 1004, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1012, 1004, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1013, 1004, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1014, 1004, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1015, 1004, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1016, 1004, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1017, 1004, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1018, 1005, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1019, 1005, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1020, 1005, 4, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1021, 1005, 5, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1022, 1005, 6, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1023, 1005, 7, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1024, 1005, 9, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1025, 1005, 10, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioSubtema] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioTema] ON 

INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (7, 19, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (8, 19, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (9, 19, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T19:22:52.977' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (10, 20, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (11, 20, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (12, 20, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-12T21:39:04.183' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (13, 22, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (14, 22, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (15, 22, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-13T11:54:16.283' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1002, 1003, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1003, 1003, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1004, 1003, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T18:34:41.137' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1005, 1004, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1006, 1004, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1007, 1004, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-17T19:16:02.040' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1008, 1005, 1, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1009, 1005, 2, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1010, 1005, 3, N'No iniciado', 0, 0, 0, CAST(N'2023-05-25T01:42:34.397' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioTema] OFF
GO
USE [master]
GO
ALTER DATABASE [BDEduca] SET  READ_WRITE 
GO
