using Moq;
using Educa.Models;
using Educa.BD;
using Educa.Repository;
using Educa.Service;
using Educa.Test.Helper;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Educa.Test.TestRepos
{
    [TestFixture]
    public class DatosRepositoryTest
    {
        IQueryable<Usuario>? dataUser;
        IQueryable<UsuarioCuPregunta>? dataUCuPregunta;
        IQueryable<CuestionarioPregunta>? dataCuPregunta;
        IQueryable<Cuestionario>? dataCuestionario;
        IQueryable<Curso>? dataCurso;
        IQueryable<Tema>? dataTema;
        IQueryable<Subtema> dataSubtema;
        IQueryable<Leccion>? dataLeccion;
        IQueryable<PagLeccion>? dataPagLeccion;
        IQueryable<Ejercicio>? dataEjercicio;
        IQueryable<UsuarioCurso>? dataUCursos;
        IQueryable<UsuarioLeccionPag> dataULeccionPags;
        IQueryable<UsuarioLeccion> dataULeccion;
        IQueryable<UsuarioEjercicio>? dataUEjercicio;
        IQueryable<UsuarioSubtemaPregunta>? dataUSubtemaPregunta;
        IQueryable<UsuarioSubtema>? dataUsuarioSubtema;
        [SetUp]
        public void setup()
        {
            DateTime fecha = DateTime.Now;
            dataUser = new List<Usuario>
            {
                new() { Id = 1, NombreUsuario = "Luis Perez Valdes", Age = 12, Escuela = "San Ramon", User = "Luisito", Password = "Luis1w234.", NombreTutor = "Pedro Perez Vasquez", EmailTutor = "bry1301@gmail.com", CelularTutor = "987654321", Avatar = "/Images/Home/Avatar5.png"}
            }.AsQueryable();
            dataCuestionario = new List<Cuestionario>
            {
                new() {Id= 1, NombreCuestionario ="CuestionarioInicial", DescripcionCuestionario="Cuestionario que se realiza al registrarse ", TipoCuestionario="First"}
            }.AsQueryable();
            dataCuPregunta = new List<CuestionarioPregunta>
            {
                new(){Id = 1, Pregunta ="¿Puede identificar las vocales?", IdCuestionario = 1},
                new(){Id = 2, Pregunta ="¿Puedes identificar el abecedario?", IdCuestionario = 1},
                new(){Id = 3, Pregunta ="¿Puedes identificar la letra “b” y “v”?", IdCuestionario = 1},
                new(){Id = 4, Pregunta ="¿Puedes identificar el título de un texto?", IdCuestionario = 1},
                new(){Id = 5, Pregunta ="¿Puedes identificar el personaje principal de un texto?", IdCuestionario = 1},
                new(){Id = 6, Pregunta ="¿Puedes identificar la moraleja de un texto?", IdCuestionario = 1}
            }.AsQueryable();
            dataUCuPregunta = new List<UsuarioCuPregunta>
            {
                new(){Id = 1, IdUsuario = 1, IdCuestionarioPregunta=1,Respuesta = "No"},
                new(){Id = 1, IdUsuario = 1, IdCuestionarioPregunta=2,Respuesta = "No"},
                new(){Id = 1, IdUsuario = 1, IdCuestionarioPregunta=3,Respuesta = "No"},
                new(){Id = 1, IdUsuario = 1, IdCuestionarioPregunta=4,Respuesta = "No"},
                new(){Id = 1, IdUsuario = 1, IdCuestionarioPregunta=5,Respuesta = "No"},
                new(){Id = 1, IdUsuario = 1, IdCuestionarioPregunta=6,Respuesta = "No"}
            }.AsQueryable();
            dataLeccion = new List<Leccion>
            {
                new(){Id =1, TituloLeccion = "Números", LinkImgLeccion="/Images/Leccion/Le1.png", TipoLeccion = "Forma y Spnido", IdColor = 1, IdSubtema = 1}
            }.AsQueryable();
            dataPagLeccion = new List<PagLeccion>
            {
                new(){Id=1, NombrePagLeccion = "Leccion1Pag1", LinkPagLeccion = "Leccion1Pag1", DescripcionPagLeccion = "Leccion1Pag1", IdLeccion = 1},
                new(){Id=2, NombrePagLeccion = "Leccion1Pag2", LinkPagLeccion = "Leccion1Pag2", DescripcionPagLeccion = "Leccion1Pag2", IdLeccion = 1},
                new(){Id=3, NombrePagLeccion = "Leccion1Pag3", LinkPagLeccion = "Leccion1Pag3", DescripcionPagLeccion = "Leccion1Pag3", IdLeccion = 1}
            }.AsQueryable();
            dataEjercicio = new List<Ejercicio>
            {
                new (){ Id =1, NombreEjercicio="Leccion1Ej1", DescripcionEjercicio="Leccion1Ej1", LinkEjercicio="Leccion1Ej1", IdLeccion = 1},
                new (){ Id =2, NombreEjercicio="Leccion1Ej2", DescripcionEjercicio="Leccion1Ej2", LinkEjercicio="Leccion1Ej2", IdLeccion = 1},
                new (){ Id =3, NombreEjercicio="Leccion1Ej3", DescripcionEjercicio="Leccion1Ej3", LinkEjercicio="Leccion1Ej3", IdLeccion = 1},
            }.AsQueryable();
            dataULeccionPags = new List<UsuarioLeccionPag>
            {
                new (){ Id = 1, IdUsuario = 1, IdPagLeccion = 1, Estado="Completo"},
                new (){ Id = 1, IdUsuario = 1, IdPagLeccion = 2, Estado="Completo"},
                new (){ Id = 1, IdUsuario = 1, IdPagLeccion = 3, Estado="Incompleto"},
            }.AsQueryable();
            dataUEjercicio = new List<UsuarioEjercicio>
            {
                new (){ Id = 1, IdUsuario = 1, IdEjercicio = 1, EstadoUsuarioEjercicio="Completo", NotaUsuarioEjercicio=5},
                new (){ Id = 1, IdUsuario = 1, IdEjercicio = 2, EstadoUsuarioEjercicio="Completo", NotaUsuarioEjercicio=5},
                new (){ Id = 1, IdUsuario = 1, IdEjercicio = 3, EstadoUsuarioEjercicio="Incompleto", NotaUsuarioEjercicio=5},
            }.AsQueryable();
            dataUsuarioSubtema = new List<UsuarioSubtema>
            {
                new(){Id= 1, IdUsuario = 1, IdSubtema = 1, EstadoSubtema = "TerminadoTodo", NotaPrueba = 17, PuntosSubtema = 0, PorcentajeAvance = 100, UltFechaModif = fecha },
                new(){Id= 2, IdUsuario = 1, IdSubtema = 2, EstadoSubtema = "TerminadoContenido", NotaPrueba = 0, PuntosSubtema = 0, PorcentajeAvance = 70, UltFechaModif = fecha },
                new(){Id= 3, IdUsuario = 1, IdSubtema = 3, EstadoSubtema = "Habilitado", NotaPrueba = 0, PuntosSubtema = 0, PorcentajeAvance = 30, UltFechaModif = fecha },
                new(){Id= 4, IdUsuario = 1, IdSubtema = 4, EstadoSubtema = "Inhabilitado", NotaPrueba = 0, PuntosSubtema = 0, PorcentajeAvance = 0, UltFechaModif = fecha }
            }.AsQueryable();
            dataUSubtemaPregunta = new List<UsuarioSubtemaPregunta>
            {
                new(){Id = 1, IdUsuarioSubtema = 1, IdPrueba = 1, Estado = "Terminado", Nota=17},
                new(){Id = 2, IdUsuarioSubtema = 2, IdPrueba = 2, Estado = "Habilitado", Nota=0},
                new(){Id = 3, IdUsuarioSubtema = 3, IdPrueba = 3, Estado = "Inhabilitado", Nota=0},
                new(){Id = 4, IdUsuarioSubtema = 4, IdPrueba = 4, Estado = "Inhabilitado", Nota=0}
            }.AsQueryable();
            dataULeccion = new List<UsuarioLeccion>
            {
                new(){Id = 1, IdUsuario = 1, IdLeccion = 1, EstadoLeccion = "Terminado", NotaLeccion = 20, PuntosLeccion = 15 , PorcentajeAvance = 100 , UltFechaModif = fecha},
                new(){Id = 2, IdUsuario = 1, IdLeccion = 2, EstadoLeccion = "Habilitado", NotaLeccion = 0, PuntosLeccion = 0 , PorcentajeAvance = 30 , UltFechaModif = fecha},
                new(){Id = 3, IdUsuario = 1, IdLeccion = 3, EstadoLeccion = "Inhabilitado", NotaLeccion = 0, PuntosLeccion = 0 , PorcentajeAvance = 0 , UltFechaModif = fecha}
            }.AsQueryable();
            dataCurso = new List<Curso>
            {
                new(){Id = 1, NombreCurso = "Comunicación", IdGrado = 1, LinkImgCurso= "", IdColor = 1 }
            }.AsQueryable();
            dataTema = new List<Tema>
            {
                new(){Id = 1, TituloTema="Comprensión de palabras y frases", DescripcionTema="", IdCurso = 1, IdColor = 1, LinkImgTema =""},
                new(){Id = 2, TituloTema="Comprensión lectora", DescripcionTema="", IdCurso = 1, IdColor = 1, LinkImgTema =""},
                new(){Id = 3, TituloTema="Comprensión auditiva", DescripcionTema="", IdCurso = 1, IdColor = 1, LinkImgTema =""}
            }.AsQueryable();
            dataSubtema = new List<Subtema>
            {
                new(){Id=1, TituloSubtema= "Letras – Números", DescripcionSubtema = "", LinkImgSubtema ="", TipoSubtema ="Forma", IdColor= 1,IdTema = 1},
                new(){Id=2, TituloSubtema= "Mayúsculas - Minúsculas", DescripcionSubtema = "", LinkImgSubtema ="", TipoSubtema ="Forma", IdColor= 1,IdTema = 1},
                new(){Id=3, TituloSubtema= "Palabras que Rimen", DescripcionSubtema = "", LinkImgSubtema ="", TipoSubtema ="Forma", IdColor= 1,IdTema = 1},
                new(){Id=4, TituloSubtema= "Historias Sencillas", DescripcionSubtema = "", LinkImgSubtema ="", TipoSubtema ="Forma", IdColor= 1,IdTema = 2},
                new(){Id=5, TituloSubtema= "Instrucciones Simples", DescripcionSubtema = "", LinkImgSubtema ="", TipoSubtema ="Forma", IdColor= 1,IdTema = 3},
            }.AsQueryable();
            dataUCursos = new List<UsuarioCurso>
            {
                new(){Id=1,IdUsuario = 1 , IdCurso = 1, EstadoCurso = "Habilitado", NotaPrueba = 0, PorcentajeAvance = 2, UltFechaModif = fecha}
            }.AsQueryable();
        }

        [Test]
        public void PagCompletaFalseTest()
        {
            var mockDbSetUPagLeccion = new MockDBSet<UsuarioLeccionPag>(dataULeccionPags);
            var mockDbSetPagLeccion = new MockDBSet<PagLeccion>(dataPagLeccion);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioLeccionPag).Returns(mockDbSetUPagLeccion.Object);
            mockDB.Setup(y => y._pagLeccion).Returns(mockDbSetPagLeccion.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.PagCompleta("Leccion1Pag3", 1);
            Assert.AreEqual(false, rpta);
        }
        [Test]
        public void PagCompletaTrueTest()
        {
            var mockDbSetUPagLeccion = new MockDBSet<UsuarioLeccionPag>(dataULeccionPags);
            var mockDbSetPagLeccion = new MockDBSet<PagLeccion>(dataPagLeccion);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioLeccionPag).Returns(mockDbSetUPagLeccion.Object);
            mockDB.Setup(y => y._pagLeccion).Returns(mockDbSetPagLeccion.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.PagCompleta("Leccion1Pag2", 1);
            Assert.AreEqual(true, rpta);
        }
        [Test]
        public void NombrePagCompletadoTest()
        {
            var mockDbSetUPagLeccion = new MockDBSet<UsuarioLeccionPag>(dataULeccionPags);
            var mockDbSetPagLeccion = new MockDBSet<PagLeccion>(dataPagLeccion);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioLeccionPag).Returns(mockDbSetUPagLeccion.Object);
            mockDB.Setup(y => y._pagLeccion).Returns(mockDbSetPagLeccion.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            repo.PagCompletado("Leccion1Pag3", 1);
        }
        [Test]
        public void EjCompletaFalseTest()
        {
            var mockDbSetUEjercicio = new MockDBSet<UsuarioEjercicio>(dataUEjercicio);
            var mockDbSetEjercicios = new MockDBSet<Ejercicio>(dataEjercicio);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioEjercicio).Returns(mockDbSetUEjercicio.Object);
            mockDB.Setup(y => y._ejercicio).Returns(mockDbSetEjercicios.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.EjCompleta("Leccion1Ej3", 1);
            Assert.AreEqual(false, rpta);
        }
        [Test]
        public void EjCompletaTrueTest()
        {
            var mockDbSetUEjercicio = new MockDBSet<UsuarioEjercicio>(dataUEjercicio);
            var mockDbSetEjercicios = new MockDBSet<Ejercicio>(dataEjercicio);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioEjercicio).Returns(mockDbSetUEjercicio.Object);
            mockDB.Setup(y => y._ejercicio).Returns(mockDbSetEjercicios.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.EjCompleta("Leccion1Ej2", 1);
            Assert.AreEqual(true, rpta);
        }
        [Test]
        public void EjCompletadoTest()
        {
            var mockDbSetUEjercicio = new MockDBSet<UsuarioEjercicio>(dataUEjercicio);
            var mockDbSetEjercicios = new MockDBSet<Ejercicio>(dataEjercicio);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioEjercicio).Returns(mockDbSetUEjercicio.Object);
            mockDB.Setup(y => y._ejercicio).Returns(mockDbSetEjercicios.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            repo.EjercicioCompletado("Leccion1Ej3", 1, 5);
        }
        /*[Test]
        public void ExamCompletoTrue()
        {
            var mockDbSetUUSubtemaPregunta = new MockDBSet<UsuarioSubtemaPregunta>(dataUSubtemaPregunta);
            var mockDbSetUSubtemas = new MockDBSet<UsuarioSubtema>(dataUsuarioSubtema);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioSubtemaPregunta).Returns(mockDbSetUUSubtemaPregunta.Object);
            mockDB.Setup(y => y._usuarioSubtema).Returns(mockDbSetUSubtemas.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.ExamCompleto(1, 1);
            Assert.AreEqual(true, rpta);
        }*/
        [Test]
        public void ActualizarEstadoSiguienteLeccionTest()
        {
            var mockDbSetULeccion = new MockDBSet<UsuarioLeccion>(dataULeccion);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioLeccion).Returns(mockDbSetULeccion.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            repo.ActualizarEstadoSiguienteLeccion(1, 2);
        }
        [Test]
        public void ActualizarEstadoSiguienteSubtemaTest()
        {
            var mockDbSetUSubtema = new MockDBSet<UsuarioSubtema>(dataUsuarioSubtema);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioSubtema).Returns(mockDbSetUSubtema.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            repo.ActualizarEstadoSiguienteSubtema(1, 4);
        }
        [Test]
        public void ActualizarEstadoSubtemaActualTest()
        {
            var mockDbSetUSubtema = new MockDBSet<UsuarioSubtema>(dataUsuarioSubtema);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioSubtema).Returns(mockDbSetUSubtema.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            repo.ActualizarEstadoSubtemaActual(1, 3);
        }
        [Test]
        public void ObtenerNombreCursoTest()
        {
            var mockDbCurso = new MockDBSet<Curso>(dataCurso);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._curso).Returns(mockDbCurso.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.ObtenerNombreCurso(1);
            Assert.AreEqual("Comunicación", rpta);
        }
        [Test]
        public void ObtenerNombreTemaTest()
        {
            var mockDbTema = new MockDBSet<Tema>(dataTema);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._tema).Returns(mockDbTema.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.ObtenerNombreTema(1);
            Assert.AreEqual("Comprensión de palabras y frases", rpta);
        }
        [Test]
        public void ObtenerNombreSubtemaTest()
        {
            var mockDbSubtema = new MockDBSet<Subtema>(dataSubtema);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._subtema).Returns(mockDbSubtema.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.ObtenerNombreSubtema(1);
            Assert.AreEqual("Letras – Números", rpta);
        }
        [Test]
        public void ObtenerNombreLeccionTest()
        {
            var mockDbLeccion = new MockDBSet<Leccion>(dataLeccion);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._leccion).Returns(mockDbLeccion.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.ObtenerNombreLeccion(1);
            Assert.AreEqual("Números", rpta);
        }
        [Test]
        public void ObtenerNumeroCursoTest()
        {
            var mockDbCurso = new MockDBSet<Curso>(dataCurso);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._curso).Returns(mockDbCurso.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.NumeroCursos();
            Assert.AreEqual(1, rpta);
        }
        [Test]
        public void ObtenerNumeroTemaTest()
        {
            var mockDbTema = new MockDBSet<Tema>(dataTema);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._tema).Returns(mockDbTema.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.NumeroTemas(1);
            Assert.AreEqual(3, rpta);
        }
        [Test]
        public void ObtenerNumeroSubtemaTest()
        {
            var mockDbSubtema = new MockDBSet<Subtema>(dataSubtema);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._subtema).Returns(mockDbSubtema.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.NumeroSubtemas(3);
            Assert.AreEqual(1, rpta);
        }
        [Test]
        public void ObtenerNumeroLeccionTest()
        {
            var mockDbLeccion = new MockDBSet<Leccion>(dataLeccion);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._leccion).Returns(mockDbLeccion.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.NumeroLecciones(1);
            Assert.AreEqual(1, rpta);
        }
        [Test]
        public void ObtenerNumeroCursosEnProgresoTest()
        {
            var mockDbUCursos = new MockDBSet<UsuarioCurso>(dataUCursos);
            var mockDB = new Mock<EducaContext>();
            mockDB.Setup(o => o._usuarioCurso).Returns(mockDbUCursos.Object);
            var repo = new DatosRepository(mockDB.Object, null);
            var rpta = repo.NumeroCursosEnProgreso(1);
            Assert.AreEqual(0, rpta);
        }
    }
}
