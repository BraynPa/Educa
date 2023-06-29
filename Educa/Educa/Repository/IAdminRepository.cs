using Educa.BD;
using Educa.Models;
using Microsoft.EntityFrameworkCore;
namespace Educa.Repository
{
    public interface IAdminRepository
    {
        public Boolean EsAdmin(String username, String password);
        public int NumeroUsuariosTotal();
        public int NumeroUsuariosMesActual();
        public int NumeroUsuariosHoy();
        public int usuarioCursosPorcentaje();
        public int usuarioCursosNota();
        public string NombreCuestionario(int id);
        public List<Usuario> usuarios();
        public List<UsuarioTema> usuarioCursos();
        public List<Grado> grados();
        public List<Curso> cursos();
        public List<Tema> temas();
        public List<Subtema> subTemas();
        public List<Leccion> lecciones();
        public List<PagLeccion> pagLecciones();
        public List<Ejercicio> ejercicios();
        public List<Libro> libros();
        public List<Prueba> examenes();
        public List<Cuestionario> cuestionarios();
        public List<CuestionarioPregunta> cuestionarioPreguntas();
        public List<Subtema> subTemasOnly();
        public List<Libro> librosOnly();
    }
    public class AdminRepository : IAdminRepository
    {
        private EducaContext _context;
        public AdminRepository(EducaContext context)
        {
            _context = context;
        }
        public Boolean EsAdmin(String username, String password)
        {
            if(username == "AdminEduca" && password == "Educa contra.123*")
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public List<Usuario> usuarios()
        {
            var Usuarios = _context._usuario.OrderByDescending(z => z.Id).ToList();
            return Usuarios;
        }
        public List<UsuarioTema> usuarioCursos()
        {
            var UsuariosCursos = _context._usuarioTema.Where(o => o.IdTema == 1).ToList();
            return UsuariosCursos;
        }
        public int usuarioCursosPorcentaje()
        {
            var UsuariosCursos = _context._usuarioTema.Where(o => o.EstadoTema == "Habilitado").ToList();
            int porcentaje = 0;
            foreach (var o in UsuariosCursos)
            {
                porcentaje += o.PorcentajeAvance;
            }
            porcentaje = porcentaje / UsuariosCursos.Count();
            return porcentaje;
        }
        public int usuarioCursosNota()
        {
            if(_context._usuarioCurso.Where(o => o.EstadoCurso == "Terminado").ToList().Count == 0)
            {
                return -100;
            }
            var UsuariosCursos = _context._usuarioCurso.Where(o => o.EstadoCurso == "Terminado").ToList();
            int Nota = 0;
            foreach (var o in UsuariosCursos)
            {
                Nota += o.NotaPrueba;
            }
            Nota = Nota / UsuariosCursos.Count();
            return Nota;
        }
        public int NumeroUsuariosTotal()
        {
            int Usuarios = _context._usuarioCurso.ToList().Count();
            return Usuarios;
        }
        public List<Grado> grados()
        {
            var Grados = _context._grado.ToList();
            return Grados;
        }
        public List<Curso> cursos()
        {
            var Cursos = _context._curso.Include(o => o.Grados).Include(y => y.Colores).ToList();
            return Cursos;
        }
        public List<Tema> temas()
        {
            var Temas = _context._tema.Include(o => o.Cursos).Include(y => y.Colores).ToList();
            for (int i = 0; i < Temas.Count; i++)
            {
                if (string.IsNullOrEmpty(Temas[i].DescripcionTema) || Temas[i].DescripcionTema.Length < 66)
                {
                }
                else
                {
                    Temas[i].DescripcionTema = Temas[i].DescripcionTema.Substring(0, 66) + "..."; 
                }
            }
            return Temas;
        }
        public List<Subtema> subTemas()
        {
            var Subtemas = _context._subtema.Include(o => o.Temas).Include(y => y.Colores).ToList();
            for (int i = 0; i < Subtemas.Count; i++)
            {
                if (string.IsNullOrEmpty(Subtemas[i].DescripcionSubtema) || Subtemas[i].DescripcionSubtema.Length < 66)
                {
                }
                else
                {
                    Subtemas[i].DescripcionSubtema = Subtemas[i].DescripcionSubtema.Substring(0, 66) + "...";
                }
            }
            return Subtemas;
        }
        public List<Leccion> lecciones()
        {
            var Lecciones = _context._leccion.Include(o => o.Subtemas).Include(y => y.Colores).ToList();
            for (int i = 0; i < Lecciones.Count; i++)
            {
                if (string.IsNullOrEmpty(Lecciones[i].DescripcionLeccion) || Lecciones[i].DescripcionLeccion.Length < 66)
                {
                }
                else
                {
                    Lecciones[i].DescripcionLeccion = Lecciones[i].DescripcionLeccion.Substring(0, 66) + "...";
                }
            }
            return Lecciones;
        }
        public List<PagLeccion> pagLecciones()
        {
            var PagLecciones = _context._pagLeccion.Include(o => o.Lecciones).ToList();
            for (int i = 0; i < PagLecciones.Count; i++)
            {
                if (string.IsNullOrEmpty(PagLecciones[i].DescripcionPagLeccion) || PagLecciones[i].DescripcionPagLeccion.Length < 66)
                {
                }
                else
                {
                    PagLecciones[i].DescripcionPagLeccion = PagLecciones[i].DescripcionPagLeccion.Substring(0, 66) + "...";
                }
            }
            return PagLecciones;
        }
        
        public List<Ejercicio> ejercicios()
        {
            var Ejercicios = _context._ejercicio.Include(o => o.Lecciones).ToList();
            for (int i = 0; i < Ejercicios.Count; i++)
            {
                if (string.IsNullOrEmpty(Ejercicios[i].DescripcionEjercicio) || Ejercicios[i].DescripcionEjercicio.Length < 66)
                {
                }
                else
                {
                    Ejercicios[i].DescripcionEjercicio = Ejercicios[i].DescripcionEjercicio.Substring(0, 66) + "...";
                }
            }
            return Ejercicios;
        }
        public List<Libro> libros()
        {
            var Libros = _context._libro.ToList();
            for (int i = 0; i < Libros.Count; i++)
            {
                if (string.IsNullOrEmpty(Libros[i].DescripcionLibro) || Libros[i].DescripcionLibro.Length < 60)
                {
                }
                else
                {
                    Libros[i].DescripcionLibro = Libros[i].DescripcionLibro.Substring(0, 60) + "...";
                }
            }
            return Libros;
        }
        public List<Prueba> examenes()
        {
            var Pruebas = _context._prueba.ToList();
            return Pruebas;
        }
        public List<Cuestionario> cuestionarios()
        {
            var Cuestionarios = _context._cuestionario.ToList();
            for (int i = 0; i < Cuestionarios.Count; i++)
            {
                if (string.IsNullOrEmpty(Cuestionarios[i].DescripcionCuestionario) || Cuestionarios[i].DescripcionCuestionario.Length < 66)
                {
                }
                else
                {
                    Cuestionarios[i].DescripcionCuestionario = Cuestionarios[i].DescripcionCuestionario.Substring(0, 66) + "...";
                }
            }
            return Cuestionarios;
        }
        public List<CuestionarioPregunta> cuestionarioPreguntas()
        {
            var CuestionarioPreguntas = _context._cuestionarioPregunta.ToList();
            return CuestionarioPreguntas;
        }
        public List<Subtema> subTemasOnly()
        {
            var Subtemas = _context._subtema.ToList();
            return Subtemas;
        }
        public List<Libro> librosOnly()
        {
            var Libros = _context._libro.ToList();
            return Libros;
        }
        public int NumeroUsuariosMesActual()
        {
            var Usuarios = _context._usuario.ToList();
            int total = 0;
            DateTime fecha = DateTime.Now;
            string MesActual = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES"));
            for(int i = 0; i < Usuarios.Count; i++)
            {
                if(Usuarios[i].Fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) == MesActual)
                {
                    total++;
                }
            }
            return total;
        }
        public int NumeroUsuariosHoy()
        {
            var Usuarios = _context._usuario.ToList();
            int total = 0;
            DateTime fecha = DateTime.Now;
            string MesActual = fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            for (int i = 0; i < Usuarios.Count; i++)
            {
                if (Usuarios[i].Fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES")) == MesActual)
                {
                    total++;
                }
            }
            return total;
        }
        public string NombreCuestionario(int id)
        {
            var cuestionario = _context._cuestionario.FirstOrDefault(o => o.Id == id);
            string nombre = cuestionario.NombreCuestionario;
            return nombre;
        }

    }
}
