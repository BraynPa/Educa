using Microsoft.EntityFrameworkCore;
using Educa.BD;
using Educa.Models;
namespace Educa.Repository
{
    public interface IDatosRepository
    {
        public void RegistrarPrimerCuestionario(string a, string b, string c, string d, string e, string f, string nombre);
        public void RegistroTablasUsuario(string user);
        public string ObtenerNombreCurso(int id);
        public string ObtenerNombreTema(int id);
        public string ObtenerNombreSubtema(int id);
        public string ObtenerNombreLeccion(int id);
        public int NumeroCursos();
        public int NumeroTemas(int id);
        public int NumeroSubtemas(int id);
        public int NumeroLecciones(int id);
        public int NumeroCursosEnProgreso(string user);
        public int NumeroTemasEnProgreso(string user, int id);
        public int NumerosubtemasEnProgreso(string user, int id);
        public int NumeroLeccionesEnProgreso(string user, int id);
        List<UsuarioCurso> CursosU(string user);
        List<UsuarioTema> TemasU(string user, int id);
        List<UsuarioSubtema> SubtemasU(string user, int id);
        List<UsuarioLeccion> LeccionesU(string user, int id);
        List<UsuarioLibro> LibrosU(string user);

    }
    public class DatosRepository : IDatosRepository
    {
        private EducaContext _context;
        private IUsuarioRepository _usuario;
        public DatosRepository(EducaContext context, IUsuarioRepository _usuario)
        {
            _context = context;
            this._usuario = _usuario;
        }
        public void RegistrarPrimerCuestionario(string a, string b, string c, string d, string e, string f, string nombre)
        {
            int Id = _usuario.EncontrarIdUsuario(nombre);
            List<string> Respuestas = new List<string>() {
                a, b, c,d,e,f};
            var preguntas = _context._cuestionarioPregunta.Where(o => o.IdCuestionario == 1).ToList();
            for (int i = 0; i < 6; i++)
            {
                UsuarioCuPregunta user = new UsuarioCuPregunta();
                user.IdCuestionarioPregunta = preguntas[i].Id;
                user.IdUsuario = Id;
                user.Respuesta = Respuestas[i];
                _context._usuarioCuPregunta.Add(user);
                _context.SaveChanges();
            }
        }
        public void RegistroTablasUsuario(string user)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            var cursos = _context._curso.ToList();
            var temas = _context._tema.ToList();
            var subtemas = _context._subtema.ToList();
            var lecciones = _context._leccion.ToList();
            //var pagLecciones = _context._pagLeccion.ToList();
            //var ejercicios = _context._ejercicio.ToList();
            var libros = _context._libro.ToList();
            DateTime fecha = DateTime.Now;
            //string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES")) + ", " + fecha.ToString("yyyy", new System.Globalization.CultureInfo("es-ES"));
            //FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            for (int i = 0; i < cursos.Count; i++)
            {
                UsuarioCurso curso = new UsuarioCurso();
                curso.IdCurso = cursos[i].Id;
                curso.IdUsuario = Id;
                curso.EstadoCurso = "No iniciado";
                curso.NotaPrueba = 0;
                curso.PorcentajeAvance = 0;
                curso.UltFechaModif = fecha;
                _context._usuarioCurso.Add(curso);
                _context.SaveChanges();
            }
            for (int i = 0; i < temas.Count; i++)
            {
                UsuarioTema tema = new UsuarioTema();
                tema.IdUsuario = Id;
                tema.IdTema = temas[i].Id;
                tema.EstadoTema = "No iniciado";
                tema.NotaPrueba = 0;
                tema.PuntosTema = 0;
                tema.PorcentajeAvance = 0;
                tema.UltFechaModif = fecha;
                _context._usuarioTema.Add(tema);
                _context.SaveChanges();
            }
            for (int i = 0; i < subtemas.Count; i++)
            {
                UsuarioSubtema subtema = new UsuarioSubtema();
                subtema.IdUsuario = Id;
                subtema.IdSubtema = subtemas[i].Id;
                subtema.EstadoSubtema = "No iniciado";
                subtema.NotaPrueba = 0;
                subtema.PuntosSubtema = 0;
                subtema.PorcentajeAvance = 0;
                subtema.UltFechaModif = fecha;
                _context._usuarioSubtema.Add(subtema);
                _context.SaveChanges();
            }
            for (int i = 0; i < lecciones.Count; i++)
            {
                UsuarioLeccion leccion = new UsuarioLeccion();
                leccion.IdUsuario = Id;
                leccion.IdLeccion = lecciones[i].Id;
                leccion.EstadoLeccion = "No iniciado";
                leccion.NotaLeccion = 0;
                leccion.PuntosLeccion = 0;
                leccion.PorcentajeAvance = 0;
                leccion.UltFechaModif = fecha;
                _context._usuarioLeccion.Add(leccion);
                _context.SaveChanges();
            }
            /*for (int i = 0; i < pagLecciones.Count; i++)
            {
                UsuarioLeccionPag usuarioLeccionPag = new UsuarioLeccionPag();
                usuarioLeccionPag.IdUsuario = Id;
                usuarioLeccionPag.IdPagLeccion = pagLecciones[i].Id;
                usuarioLeccionPag.Estado = "Incompleto";
                _context._usuarioLeccionPag.Add(usuarioLeccionPag);
                _context.SaveChanges();
            }*/
            /*for (int i = 0; i < ejercicios.Count; i++)
            {  
                UsuarioEjercicio ejercicio = new UsuarioEjercicio();
                ejercicio.IdUsuario = Id;
                ejercicio.IdEjercicio = ejercicios[i].Id;
                ejercicio.EstadoUsuarioEjercicio = "Incompleto";
                ejercicio.NotaUsuarioEjercicio = 0;
                _context._usuarioEjercicio.Add(ejercicio);
                _context.SaveChanges();
            }*/
            for (int i = 0; i < libros.Count; i++)
            {
                UsuarioLibro usuarioLibro = new UsuarioLibro();
                usuarioLibro.IdUsuario = Id;
                usuarioLibro.IdLibro = libros[i].Id;
                usuarioLibro.EstadoUsuarioLibro = "Incompleto";
                _context._usuarioLibro.Add(usuarioLibro);
                _context.SaveChanges();
            }
        }
        public string ObtenerNombreCurso(int id)
        {
            var curso = _context._curso.Where(o => o.Id == id).FirstOrDefault();
            return curso.NombreCurso;
        }
        public string ObtenerNombreTema(int id)
        {
            var tema = _context._tema.Where(o => o.Id == id).FirstOrDefault();
            return tema.TituloTema;
        }
        public string ObtenerNombreSubtema(int id)
        {
            var subtema = _context._subtema.Where(o => o.Id == id).FirstOrDefault();
            return subtema.TituloSubtema;
        }
        public string ObtenerNombreLeccion(int id)
        {
            var leccion = _context._leccion.Where(o => o.Id == id).FirstOrDefault();
            return leccion.TituloLeccion;
        }
        public int NumeroCursos()
        {
            int num = _context._curso.ToList().Count();
            return num;
        }
        public int NumeroTemas(int id)
        {
            int num = _context._tema.Where(s => s.IdCurso == id).ToList().Count();
            return num;
        }
        public int NumeroSubtemas(int id)
        {
            int num = _context._subtema.Where(s => s.IdTema == id).ToList().Count();
            return num;
        }
        public int NumeroLecciones(int id)
        {
            int num = _context._leccion.Where(s => s.IdSubtema == id).ToList().Count();
            return num;
        }
        public int NumeroCursosEnProgreso(string user)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            int num = _context._usuarioCurso.Where(o => o.IdUsuario == Id && o.EstadoCurso == "En progreso").ToList().Count();
            return num;
        }
        public int NumeroTemasEnProgreso(string user, int id)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            int num = _context._usuarioTema.Where(o => o.IdUsuario == Id && o.EstadoTema == "En progreso" && o.Temas.IdCurso == id).ToList().Count();
            return num;
        }
        public int NumerosubtemasEnProgreso(string user, int id)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            int num = _context._usuarioSubtema.Where(o => o.IdUsuario == Id && o.EstadoSubtema == "En progreso" && o.Subtemas.IdTema == id).ToList().Count();
            return num;
        }
        public int NumeroLeccionesEnProgreso(string user, int id)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            int num = _context._usuarioLeccion.Where(o => o.IdUsuario == Id && o.EstadoLeccion == "En progreso" && o.Lecciones.IdSubtema == id).ToList().Count();
            return num;
        }
        public List<UsuarioCurso> CursosU(string user)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            return _context._usuarioCurso.Where(s => s.IdUsuario == Id).Include(s => s.Cursos.Colores).ToList();
        }
        public List<UsuarioTema> TemasU(string user, int id)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            return _context._usuarioTema.Where(s => s.IdUsuario == Id && s.Temas.IdCurso == id).Include(s => s.Temas.Colores).ToList();
        }
        public List<UsuarioSubtema> SubtemasU(string user, int id)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            return _context._usuarioSubtema.Where(s => s.IdUsuario == Id && s.Subtemas.IdTema == id).Include(s => s.Subtemas.Colores).ToList();
        }
        public List<UsuarioLeccion> LeccionesU(string user, int id)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            return _context._usuarioLeccion.Where(s => s.IdUsuario == Id && s.Lecciones.IdSubtema == id).Include(s => s.Lecciones.Colores).ToList();
        }
        public List<UsuarioLibro> LibrosU(string user)
        {
            int Id = _usuario.EncontrarIdUsuario(user);
            return _context._usuarioLibro.Where(s => s.IdUsuario == Id).Include(s => s.Libros).ToList();
        }
        
    }
}
