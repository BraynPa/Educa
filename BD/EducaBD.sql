USE [master]
GO
/****** Object:  Database [BDEduca]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Color]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Cuestionario]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[CuestionarioPregunta]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Curso]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Ejercicio]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Grado]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Leccion]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Libro]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[PagLeccion]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[PreguntaPrueba]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Prueba]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[RecuperarPassword]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Subtema]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Tema]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 29/06/2023 03:19:12 ******/
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
	[Fecha] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioCuPregunta]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioCurso]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioEjercicio]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioLeccion]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioLeccionPag]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioLibro]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioLibroPregunta]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioSubtema]    Script Date: 29/06/2023 03:19:12 ******/
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
/****** Object:  Table [dbo].[UsuarioSubtemaPregunta]    Script Date: 29/06/2023 03:19:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsuarioSubtemaPregunta](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuarioSubtema] [int] NULL,
	[IdPrueba] [int] NULL,
	[Estado] [varchar](255) NULL,
	[Nota] [int] NULL,
 CONSTRAINT [PK_UsuarioSubtemaPregunta] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsuarioTema]    Script Date: 29/06/2023 03:19:12 ******/
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
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (2, N'Leccion1Ej2', N'Leccion1Ej2', N'Leccion1Ej2', 1)
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
INSERT [dbo].[Ejercicio] ([Id], [NombreEjercicio], [DescripcionEjercicio], [LinkEjercicio], [IdLeccion]) VALUES (16, N'Leccion7Ej1', N'Leccion7Ej1', N'Leccion7Ej1', 7)
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
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (48, N'Leccion8Pag1', N'Leccion8Pag1', N'Leccion8Pag1', 8)
INSERT [dbo].[PagLeccion] ([Id], [NombrePagLeccion], [LinkPagLeccion], [DescripcionPagLeccion], [IdLeccion]) VALUES (49, N'Leccion8Pag2', N'Leccion8Pag2', N'Leccion8Pag2', 8)
SET IDENTITY_INSERT [dbo].[PagLeccion] OFF
GO
SET IDENTITY_INSERT [dbo].[Prueba] ON 

INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (1, N'Examen 1', 1, N'/paginas/Subtema1Exam1', 1)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (2, N'Examen 2', 1, N'/paginas/Subtema1Exam2', 1)
INSERT [dbo].[Prueba] ([Id], [NombrePrueba], [IdSubtema], [LinkPrueba], [Tipo]) VALUES (3, N'Examen 1', 2, N'/paginas/Subtema2Exam1', 1)
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
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar], [Fecha]) VALUES (1007, N'Luis Perez Valdes', 12, N'San Ramon', N'Luisito', N'Luis1w234.', N'Pedro Perez Vasquez', N'demo12@gmail.com', N'987654321', N'/Images/Home/Avatar5.png', CAST(N'2023-05-01T10:15:49.043' AS DateTime))
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar], [Fecha]) VALUES (1008, N'Paty Herrera Vasquez', 11, N'La recoleta', N'Paquita', N'Paquita.123', N'Rosa Vasquez Tapia', N'Tapia@gmail.com', N'932165487', N'/Images/Home/Avatar6.png', CAST(N'2023-05-01T11:15:49.980' AS DateTime))
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar], [Fecha]) VALUES (1009, N'Ana Gabriela Casas Paredes', 11, N'Santa Teresita', N'Anita', N'Anita.123', N'Pedro  Casas Vasquez', N'Todo345@gmail.com', N'987456123', N'/Images/Home/Avatar1.png', CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar], [Fecha]) VALUES (1010, N'Juan Perz', 12, N'San Ramon', N'Juan123', N'Juan123.', N'Martha Perez', N'123@de.upn', N'987654321', N'/Images/Home/Avatar2.png', CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar], [Fecha]) VALUES (1014, N'Pedro Hugo Alva', 12, N'San Ramon', N'Oscar Alva', N'borrar123', N'Martha Perez', N'234@de.upn', N'987654321', N'/Images/Home/Avatar5.png', CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[Usuario] ([Id], [NombreUsuario], [Age], [Escuela], [User], [Password], [NombreTutor], [EmailTutor], [CelularTutor], [Avatar], [Fecha]) VALUES (2015, N'JulitoPerez', 14, N'San Ramon', N'Julitolove', N'Julito123.', N'Juan perez vega', N'cat234@gmail.com', N'976122782', N'/Images/Home/Avatar1.png', CAST(N'2023-06-18T21:30:26.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioCuPregunta] ON 

INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1020, 1007, 1, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1021, 1007, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1022, 1007, 3, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1023, 1007, 4, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1024, 1007, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1025, 1007, 6, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1026, 1008, 1, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1027, 1008, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1028, 1008, 3, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1029, 1008, 4, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1030, 1008, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1031, 1008, 6, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1032, 1009, 1, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1033, 1009, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1034, 1009, 3, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1035, 1009, 4, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1036, 1009, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1037, 1009, 6, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1038, 1010, 1, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1039, 1010, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1040, 1010, 3, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1041, 1010, 4, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1042, 1010, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1043, 1010, 6, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1044, 1014, 1, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1045, 1014, 2, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1046, 1014, 3, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1047, 1014, 4, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1048, 1014, 5, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (1049, 1014, 6, N'No')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (2044, 2015, 1, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (2045, 2015, 2, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (2046, 2015, 3, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (2047, 2015, 4, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (2048, 2015, 5, N'Si')
INSERT [dbo].[UsuarioCuPregunta] ([Id], [IdUsuario], [IdCuestionarioPregunta], [Respuesta]) VALUES (2049, 2015, 6, N'No')
SET IDENTITY_INSERT [dbo].[UsuarioCuPregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioCurso] ON 

INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1005, 1007, 1, N'Habilitado', 0, 1, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1006, 1008, 1, N'Habilitado', 0, 7, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1007, 1009, 1, N'Habilitado', 0, 12, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1008, 1010, 1, N'Habilitado', 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (1009, 1014, 1, N'Habilitado', 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioCurso] ([Id], [IdUsuario], [IdCurso], [EstadoCurso], [NotaPrueba], [PorcentajeAvance], [UltFechaModif]) VALUES (2009, 2015, 1, N'Habilitado', 0, 2, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioCurso] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioEjercicio] ON 

INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1, 1007, 1, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (2, 1007, 2, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (3, 1007, 3, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (4, 1007, 4, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (5, 1007, 5, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (6, 1007, 6, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (7, 1007, 7, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (8, 1007, 8, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (9, 1007, 9, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (10, 1007, 10, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (11, 1007, 11, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (12, 1007, 12, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (13, 1007, 13, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (14, 1007, 14, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (15, 1007, 15, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (16, 1008, 1, N'Completo', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (17, 1008, 2, N'Completo', 6)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (18, 1008, 3, N'Completo', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (19, 1008, 4, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (20, 1008, 5, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (21, 1008, 6, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (22, 1008, 7, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (23, 1008, 8, N'Completo', 4)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (24, 1008, 9, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (25, 1008, 10, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (26, 1008, 11, N'Completo', 3)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (27, 1008, 12, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (28, 1008, 13, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (29, 1008, 14, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (30, 1008, 15, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (31, 1009, 1, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (32, 1009, 2, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (33, 1009, 3, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (34, 1009, 4, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (35, 1009, 5, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (36, 1009, 6, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (37, 1009, 7, N'Completo', 4)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (38, 1009, 8, N'Completo', 4)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (39, 1009, 9, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (40, 1009, 10, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (41, 1009, 11, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (42, 1009, 12, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (43, 1009, 13, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (44, 1009, 14, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (45, 1009, 15, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (46, 1010, 1, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (47, 1010, 2, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (48, 1010, 3, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (49, 1010, 4, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (50, 1010, 5, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (51, 1010, 6, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (52, 1010, 7, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (53, 1010, 8, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (54, 1010, 9, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (55, 1010, 10, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (56, 1010, 11, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (57, 1010, 12, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (58, 1010, 13, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (59, 1010, 14, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (60, 1010, 15, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (61, 1014, 1, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (62, 1014, 2, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (63, 1014, 3, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (64, 1014, 4, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (65, 1014, 5, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (66, 1014, 6, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (67, 1014, 7, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (68, 1014, 8, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (69, 1014, 9, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (70, 1014, 10, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (71, 1014, 11, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (72, 1014, 12, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (73, 1014, 13, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (74, 1014, 14, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (75, 1014, 15, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1061, 1007, 16, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1062, 1008, 16, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1063, 1009, 16, N'Completo', 4)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1064, 1010, 16, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1065, 1014, 16, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1066, 2015, 1, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1067, 2015, 2, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1068, 2015, 3, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1069, 2015, 4, N'Completo', 5)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1070, 2015, 5, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1071, 2015, 6, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1072, 2015, 7, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1073, 2015, 8, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1074, 2015, 9, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1075, 2015, 10, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1076, 2015, 11, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1077, 2015, 12, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1078, 2015, 13, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1079, 2015, 14, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1080, 2015, 15, N'Incompleto', 0)
INSERT [dbo].[UsuarioEjercicio] ([Id], [IdUsuario], [IdEjercicio], [EstadoUsuarioEjercicio], [NotaUsuarioEjercicio]) VALUES (1081, 2015, 16, N'Incompleto', 0)
SET IDENTITY_INSERT [dbo].[UsuarioEjercicio] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioLeccion] ON 

INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1116, 1007, 1, N'Terminado', 20, 15, 100, CAST(N'2023-06-01T15:26:22.610' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1117, 1007, 2, N'Habilitado', 0, 0, 66, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1118, 1007, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1119, 1007, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1120, 1007, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1121, 1007, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1122, 1007, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1123, 1007, 8, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1124, 1007, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1125, 1007, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1126, 1007, 11, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1127, 1007, 12, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1128, 1007, 13, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1129, 1007, 14, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1130, 1007, 15, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1131, 1007, 16, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1132, 1007, 17, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1133, 1007, 18, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1134, 1007, 19, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1135, 1007, 20, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1136, 1007, 21, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1137, 1007, 22, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1138, 1007, 23, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1139, 1007, 24, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1140, 1007, 25, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1141, 1007, 26, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1142, 1007, 27, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1143, 1007, 28, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1144, 1007, 29, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1145, 1007, 30, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1146, 1007, 31, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1147, 1007, 32, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1148, 1007, 33, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1149, 1007, 34, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1150, 1007, 35, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1151, 1007, 36, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1152, 1007, 37, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1153, 1007, 38, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1154, 1008, 1, N'Terminado', 6, 5, 100, CAST(N'2023-06-01T15:33:47.380' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1155, 1008, 2, N'Terminado', 20, 5, 100, CAST(N'2023-06-01T23:05:56.817' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1156, 1008, 3, N'Terminado', 19, 29, 100, CAST(N'2023-06-02T11:50:21.790' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1157, 1008, 4, N'Terminado', 6, 3, 100, CAST(N'2023-06-02T11:54:12.513' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1158, 1008, 5, N'Habilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1159, 1008, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1160, 1008, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1161, 1008, 8, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1162, 1008, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1163, 1008, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1164, 1008, 11, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1165, 1008, 12, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1166, 1008, 13, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1167, 1008, 14, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1168, 1008, 15, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1169, 1008, 16, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1170, 1008, 17, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1171, 1008, 18, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1172, 1008, 19, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1173, 1008, 20, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1174, 1008, 21, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1175, 1008, 22, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1176, 1008, 23, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1177, 1008, 24, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1178, 1008, 25, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1179, 1008, 26, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1180, 1008, 27, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1181, 1008, 28, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1182, 1008, 29, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1183, 1008, 30, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1184, 1008, 31, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1185, 1008, 32, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1186, 1008, 33, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1187, 1008, 34, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1188, 1008, 35, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1189, 1008, 36, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1190, 1008, 37, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1191, 1008, 38, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1192, 1009, 1, N'Terminado', 20, 15, 100, CAST(N'2023-06-01T15:53:51.090' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1193, 1009, 2, N'Terminado', 20, 5, 100, CAST(N'2023-06-01T21:13:15.540' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1194, 1009, 3, N'Terminado', 18, 28, 100, CAST(N'2023-06-01T22:27:14.967' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1195, 1009, 4, N'Terminado', 10, 5, 100, CAST(N'2023-06-01T22:57:01.580' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1196, 1009, 5, N'Terminado', 20, 10, 100, CAST(N'2023-06-01T23:00:01.683' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1197, 1009, 6, N'Terminado', 20, 5, 100, CAST(N'2023-06-14T22:00:40.810' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1198, 1009, 7, N'Terminado', 16, 4, 100, CAST(N'2023-06-14T22:14:58.047' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1199, 1009, 8, N'Habilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1200, 1009, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1201, 1009, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1202, 1009, 11, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1203, 1009, 12, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1204, 1009, 13, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1205, 1009, 14, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1206, 1009, 15, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1207, 1009, 16, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1208, 1009, 17, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1209, 1009, 18, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1210, 1009, 19, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1211, 1009, 20, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1212, 1009, 21, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1213, 1009, 22, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1214, 1009, 23, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
GO
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1215, 1009, 24, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1216, 1009, 25, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1217, 1009, 26, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1218, 1009, 27, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1219, 1009, 28, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1220, 1009, 29, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1221, 1009, 30, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1222, 1009, 31, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1223, 1009, 32, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1224, 1009, 33, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1225, 1009, 34, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1226, 1009, 35, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1227, 1009, 36, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1228, 1009, 37, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1229, 1009, 38, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1230, 1010, 1, N'Habilitado', 0, 0, 16, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1231, 1010, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1232, 1010, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1233, 1010, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1234, 1010, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1235, 1010, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1236, 1010, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1237, 1010, 8, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1238, 1010, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1239, 1010, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1240, 1010, 11, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1241, 1010, 12, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1242, 1010, 13, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1243, 1010, 14, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1244, 1010, 15, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1245, 1010, 16, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1246, 1010, 17, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1247, 1010, 18, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1248, 1010, 19, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1249, 1010, 20, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1250, 1010, 21, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1251, 1010, 22, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1252, 1010, 23, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1253, 1010, 24, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1254, 1010, 25, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1255, 1010, 26, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1256, 1010, 27, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1257, 1010, 28, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1258, 1010, 29, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1259, 1010, 30, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1260, 1010, 31, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1261, 1010, 32, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1262, 1010, 33, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1263, 1010, 34, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1264, 1010, 35, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1265, 1010, 36, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1266, 1010, 37, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1267, 1010, 38, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1268, 1014, 1, N'Habilitado', 0, 0, 33, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1269, 1014, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1270, 1014, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1271, 1014, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1272, 1014, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1273, 1014, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1274, 1014, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1275, 1014, 8, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1276, 1014, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1277, 1014, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1278, 1014, 11, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1279, 1014, 12, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1280, 1014, 13, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1281, 1014, 14, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1282, 1014, 15, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1283, 1014, 16, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1284, 1014, 17, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1285, 1014, 18, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1286, 1014, 19, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1287, 1014, 20, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1288, 1014, 21, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1289, 1014, 22, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1290, 1014, 23, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1291, 1014, 24, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1292, 1014, 25, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1293, 1014, 26, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1294, 1014, 27, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1295, 1014, 28, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1296, 1014, 29, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1297, 1014, 30, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1298, 1014, 31, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1299, 1014, 32, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1300, 1014, 33, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1301, 1014, 34, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1302, 1014, 35, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1303, 1014, 36, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1304, 1014, 37, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (1305, 1014, 38, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2268, 2015, 1, N'Terminado', 20, 15, 100, CAST(N'2023-06-18T23:31:57.553' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2269, 2015, 2, N'Terminado', 20, 5, 100, CAST(N'2023-06-18T23:32:32.837' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2270, 2015, 3, N'Habilitado', 0, 0, 21, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2271, 2015, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2272, 2015, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2273, 2015, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2274, 2015, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2275, 2015, 8, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2276, 2015, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
GO
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2277, 2015, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2278, 2015, 11, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2279, 2015, 12, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2280, 2015, 13, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2281, 2015, 14, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2282, 2015, 15, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2283, 2015, 16, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2284, 2015, 17, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2285, 2015, 18, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2286, 2015, 19, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2287, 2015, 20, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2288, 2015, 21, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2289, 2015, 22, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2290, 2015, 23, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2291, 2015, 24, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2292, 2015, 25, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2293, 2015, 26, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2294, 2015, 27, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2295, 2015, 28, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2296, 2015, 29, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2297, 2015, 30, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2298, 2015, 31, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2299, 2015, 32, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2300, 2015, 33, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2301, 2015, 34, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2302, 2015, 35, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2303, 2015, 36, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2304, 2015, 37, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioLeccion] ([Id], [IdUsuario], [IdLeccion], [EstadoLeccion], [NotaLeccion], [PuntosLeccion], [PorcentajeAvance], [UltFechaModif]) VALUES (2305, 2015, 38, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioLeccion] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioLeccionPag] ON 

INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1, 1007, 1, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (2, 1007, 2, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (3, 1007, 3, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (4, 1007, 4, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (5, 1007, 5, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (6, 1007, 6, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (7, 1007, 7, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (8, 1007, 8, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (9, 1007, 9, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (10, 1007, 10, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (11, 1007, 11, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (12, 1007, 12, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (13, 1007, 13, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (14, 1007, 14, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (15, 1007, 15, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (16, 1007, 16, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (17, 1007, 17, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (18, 1007, 18, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (19, 1007, 19, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (20, 1007, 20, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (21, 1007, 21, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (22, 1007, 22, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (23, 1007, 23, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (24, 1007, 24, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (25, 1007, 25, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (26, 1007, 26, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (27, 1007, 27, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (28, 1007, 28, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (29, 1007, 29, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (30, 1007, 30, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (31, 1007, 31, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (32, 1007, 32, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (33, 1007, 33, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (34, 1007, 34, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (35, 1007, 35, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (36, 1007, 36, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (37, 1007, 37, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (38, 1007, 38, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (39, 1007, 39, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (40, 1007, 40, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (41, 1007, 41, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (42, 1007, 42, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (43, 1007, 43, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (44, 1007, 44, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (45, 1007, 45, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (46, 1007, 46, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (47, 1007, 47, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (48, 1007, 48, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (49, 1007, 49, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (50, 1008, 1, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (51, 1008, 2, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (52, 1008, 3, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (53, 1008, 4, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (54, 1008, 5, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (55, 1008, 6, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (56, 1008, 7, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (57, 1008, 8, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (58, 1008, 9, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (59, 1008, 10, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (60, 1008, 11, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (61, 1008, 12, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (62, 1008, 13, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (63, 1008, 14, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (64, 1008, 15, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (65, 1008, 16, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (66, 1008, 17, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (67, 1008, 18, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (68, 1008, 19, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (69, 1008, 20, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (70, 1008, 21, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (71, 1008, 22, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (72, 1008, 23, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (73, 1008, 24, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (74, 1008, 25, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (75, 1008, 26, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (76, 1008, 27, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (77, 1008, 28, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (78, 1008, 29, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (79, 1008, 30, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (80, 1008, 31, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (81, 1008, 32, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (82, 1008, 33, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (83, 1008, 34, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (84, 1008, 35, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (85, 1008, 36, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (86, 1008, 37, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (87, 1008, 38, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (88, 1008, 39, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (89, 1008, 40, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (90, 1008, 41, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (91, 1008, 42, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (92, 1008, 43, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (93, 1008, 44, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (94, 1008, 45, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (95, 1008, 46, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (96, 1008, 47, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (97, 1008, 48, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (98, 1008, 49, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (99, 1009, 1, N'Completo')
GO
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (100, 1009, 2, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (101, 1009, 3, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (102, 1009, 4, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (103, 1009, 5, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (104, 1009, 6, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (105, 1009, 7, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (106, 1009, 8, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (107, 1009, 9, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (108, 1009, 10, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (109, 1009, 11, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (110, 1009, 12, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (111, 1009, 13, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (112, 1009, 14, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (113, 1009, 15, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (114, 1009, 16, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (115, 1009, 17, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (116, 1009, 18, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (117, 1009, 19, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (118, 1009, 20, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (119, 1009, 21, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (120, 1009, 22, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (121, 1009, 23, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (122, 1009, 24, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (123, 1009, 25, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (124, 1009, 26, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (125, 1009, 27, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (126, 1009, 28, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (127, 1009, 29, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (128, 1009, 30, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (129, 1009, 31, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (130, 1009, 32, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (131, 1009, 33, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (132, 1009, 34, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (133, 1009, 35, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (134, 1009, 36, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (135, 1009, 37, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (136, 1009, 38, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (137, 1009, 39, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (138, 1009, 40, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (139, 1009, 41, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (140, 1009, 42, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (141, 1009, 43, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (142, 1009, 44, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (143, 1009, 45, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (144, 1009, 46, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (145, 1009, 47, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (146, 1009, 48, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (147, 1009, 49, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (148, 1010, 1, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (149, 1010, 2, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (150, 1010, 3, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (151, 1010, 4, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (152, 1010, 5, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (153, 1010, 6, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (154, 1010, 7, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (155, 1010, 8, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (156, 1010, 9, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (157, 1010, 10, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (158, 1010, 11, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (159, 1010, 12, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (160, 1010, 13, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (161, 1010, 14, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (162, 1010, 15, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (163, 1010, 16, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (164, 1010, 17, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (165, 1010, 18, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (166, 1010, 19, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (167, 1010, 20, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (168, 1010, 21, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (169, 1010, 22, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (170, 1010, 23, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (171, 1010, 24, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (172, 1010, 25, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (173, 1010, 26, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (174, 1010, 27, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (175, 1010, 28, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (176, 1010, 29, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (177, 1010, 30, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (178, 1010, 31, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (179, 1010, 32, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (180, 1010, 33, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (181, 1010, 34, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (182, 1010, 35, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (183, 1010, 36, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (184, 1010, 37, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (185, 1010, 38, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (186, 1010, 39, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (187, 1010, 40, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (188, 1010, 41, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (189, 1010, 42, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (190, 1010, 43, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (191, 1010, 44, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (192, 1010, 45, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (193, 1010, 46, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (194, 1010, 47, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (195, 1010, 48, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (196, 1010, 49, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (197, 1014, 1, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (198, 1014, 2, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (199, 1014, 3, N'Incompleto')
GO
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (200, 1014, 4, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (201, 1014, 5, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (202, 1014, 6, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (203, 1014, 7, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (204, 1014, 8, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (205, 1014, 9, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (206, 1014, 10, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (207, 1014, 11, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (208, 1014, 12, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (209, 1014, 13, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (210, 1014, 14, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (211, 1014, 15, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (212, 1014, 16, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (213, 1014, 17, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (214, 1014, 18, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (215, 1014, 19, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (216, 1014, 20, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (217, 1014, 21, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (218, 1014, 22, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (219, 1014, 23, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (220, 1014, 24, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (221, 1014, 25, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (222, 1014, 26, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (223, 1014, 27, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (224, 1014, 28, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (225, 1014, 29, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (226, 1014, 30, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (227, 1014, 31, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (228, 1014, 32, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (229, 1014, 33, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (230, 1014, 34, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (231, 1014, 35, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (232, 1014, 36, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (233, 1014, 37, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (234, 1014, 38, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (235, 1014, 39, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (236, 1014, 40, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (237, 1014, 41, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (238, 1014, 42, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (239, 1014, 43, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (240, 1014, 44, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (241, 1014, 45, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (242, 1014, 46, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (243, 1014, 47, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (244, 1014, 48, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (245, 1014, 49, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1197, 2015, 1, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1198, 2015, 2, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1199, 2015, 3, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1200, 2015, 4, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1201, 2015, 5, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1202, 2015, 6, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1203, 2015, 7, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1204, 2015, 8, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1205, 2015, 9, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1206, 2015, 10, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1207, 2015, 11, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1208, 2015, 12, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1209, 2015, 13, N'Completo')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1210, 2015, 14, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1211, 2015, 15, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1212, 2015, 16, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1213, 2015, 17, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1214, 2015, 18, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1215, 2015, 19, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1216, 2015, 20, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1217, 2015, 21, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1218, 2015, 22, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1219, 2015, 23, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1220, 2015, 24, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1221, 2015, 25, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1222, 2015, 26, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1223, 2015, 27, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1224, 2015, 28, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1225, 2015, 29, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1226, 2015, 30, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1227, 2015, 31, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1228, 2015, 32, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1229, 2015, 33, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1230, 2015, 34, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1231, 2015, 35, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1232, 2015, 36, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1233, 2015, 37, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1234, 2015, 38, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1235, 2015, 39, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1236, 2015, 40, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1237, 2015, 41, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1238, 2015, 42, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1239, 2015, 43, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1240, 2015, 44, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1241, 2015, 45, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1242, 2015, 46, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1243, 2015, 47, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1244, 2015, 48, N'Incompleto')
INSERT [dbo].[UsuarioLeccionPag] ([Id], [IdUsuario], [IdPagLeccion], [Estado]) VALUES (1245, 2015, 49, N'Incompleto')
SET IDENTITY_INSERT [dbo].[UsuarioLeccionPag] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioLibro] ON 

INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1014, 1007, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1015, 1007, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1016, 1007, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1017, 1007, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1018, 1008, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1019, 1008, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1020, 1008, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1021, 1008, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1022, 1009, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1023, 1009, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1024, 1009, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1025, 1009, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1026, 1010, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1027, 1010, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1028, 1010, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1029, 1010, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1030, 1014, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1031, 1014, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1032, 1014, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (1033, 1014, 4, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (2030, 2015, 1, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (2031, 2015, 2, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (2032, 2015, 3, N'Incompleto')
INSERT [dbo].[UsuarioLibro] ([Id], [IdUsuario], [IdLibro], [EstadoUsuarioLibro]) VALUES (2033, 2015, 4, N'Incompleto')
SET IDENTITY_INSERT [dbo].[UsuarioLibro] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioLibroPregunta] ON 

INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (1, 1014, 4)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (2, 1015, 5)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (3, 1016, 6)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (4, 1017, 7)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (5, 1018, 4)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (6, 1019, 5)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (7, 1020, 6)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (8, 1021, 7)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (9, 1022, 4)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (10, 1023, 5)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (11, 1024, 6)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (12, 1025, 7)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (13, 1026, 4)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (14, 1027, 5)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (15, 1028, 6)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (16, 1029, 7)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (17, 1030, 4)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (18, 1031, 5)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (19, 1032, 6)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (20, 1033, 7)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (1017, 2030, 4)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (1018, 2031, 5)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (1019, 2032, 6)
INSERT [dbo].[UsuarioLibroPregunta] ([Id], [IdUsuarioLibro], [IdPrueba]) VALUES (1020, 2033, 7)
SET IDENTITY_INSERT [dbo].[UsuarioLibroPregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioSubtema] ON 

INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1026, 1007, 1, N'Habilitado', 0, 0, 33, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1027, 1007, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1028, 1007, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1029, 1007, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1030, 1007, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1031, 1007, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1032, 1007, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1033, 1007, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1034, 1008, 1, N'TerminadoTodo', 17, 0, 100, CAST(N'2023-06-02T11:51:55.447' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1035, 1008, 2, N'Habilitado', 0, 0, 33, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1036, 1008, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1037, 1008, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1038, 1008, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1039, 1008, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1040, 1008, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1041, 1008, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1042, 1009, 1, N'TerminadoTodo', 20, 0, 100, CAST(N'2023-06-01T22:32:13.117' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1043, 1009, 2, N'TerminadoTodo', 18, 0, 100, CAST(N'2023-06-01T23:01:30.017' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1044, 1009, 4, N'Habilitado', 0, 0, 18, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1045, 1009, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1046, 1009, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1047, 1009, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1048, 1009, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1049, 1009, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1050, 1010, 1, N'Habilitado', 0, 0, 3, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1051, 1010, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1052, 1010, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1053, 1010, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1054, 1010, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1055, 1010, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1056, 1010, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1057, 1010, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1058, 1014, 1, N'Habilitado', 0, 0, 6, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1059, 1014, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1060, 1014, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1061, 1014, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1062, 1014, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1063, 1014, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1064, 1014, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (1065, 1014, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2058, 2015, 1, N'Habilitado', 0, 0, 44, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2059, 2015, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2060, 2015, 4, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2061, 2015, 5, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2062, 2015, 6, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2063, 2015, 7, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2064, 2015, 9, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioSubtema] ([Id], [IdUsuario], [IdSubtema], [EstadoSubtema], [NotaPrueba], [PuntosSubtema], [PorcentajeAvance], [UltFechaModif]) VALUES (2065, 2015, 10, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioSubtema] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioSubtemaPregunta] ON 

INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (1, 1026, 1, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (2, 1026, 2, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (3, 1027, 3, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (4, 1034, 1, N'Terminado', 18)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (5, 1034, 2, N'Terminado', 16)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (6, 1035, 3, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (7, 1042, 1, N'Terminado', 20)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (8, 1042, 2, N'Terminado', 20)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (9, 1043, 3, N'Terminado', 18)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (10, 1050, 1, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (11, 1050, 2, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (12, 1051, 3, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (13, 1058, 1, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (14, 1058, 2, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (15, 1059, 3, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (1013, 2058, 1, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (1014, 2058, 2, N'Inhabilitado', 0)
INSERT [dbo].[UsuarioSubtemaPregunta] ([Id], [IdUsuarioSubtema], [IdPrueba], [Estado], [Nota]) VALUES (1015, 2059, 3, N'Inhabilitado', 0)
SET IDENTITY_INSERT [dbo].[UsuarioSubtemaPregunta] OFF
GO
SET IDENTITY_INSERT [dbo].[UsuarioTema] ON 

INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1011, 1007, 1, N'Habilitado', 0, 0, 5, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1012, 1007, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1013, 1007, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T10:15:49.043' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1014, 1008, 1, N'Habilitado', 0, 0, 22, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1015, 1008, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1016, 1008, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T11:15:49.980' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1017, 1009, 1, N'Habilitado', 0, 0, 36, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1018, 1009, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1019, 1009, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-01T15:47:41.850' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1020, 1010, 1, N'Habilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1021, 1010, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1022, 1010, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-02T11:28:01.437' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1023, 1014, 1, N'Habilitado', 0, 0, 1, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1024, 1014, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (1025, 1014, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-11T18:26:28.217' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (2023, 2015, 1, N'Habilitado', 0, 0, 7, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (2024, 2015, 2, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
INSERT [dbo].[UsuarioTema] ([Id], [IdUsuario], [IdTema], [EstadoTema], [NotaPrueba], [PuntosTema], [PorcentajeAvance], [UltFechaModif]) VALUES (2025, 2015, 3, N'Inhabilitado', 0, 0, 0, CAST(N'2023-06-18T23:29:22.293' AS DateTime))
SET IDENTITY_INSERT [dbo].[UsuarioTema] OFF
GO
USE [master]
GO
ALTER DATABASE [BDEduca] SET  READ_WRITE 
GO
