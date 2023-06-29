using Educa.Models;
using Educa.Repository;
using Educa.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Educa.Controllers
{
    [Authorize]
    public class HomeController : Controller
    {
        private readonly IUsuarioRepository _context;
        private readonly ICookieAuthService _cookieAuthService;
        private readonly IDatosRepository _repository;
        private readonly IValidacionesRepository _valido;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, IUsuarioRepository _context, ICookieAuthService _cookieAuthService, IDatosRepository _repository, IValidacionesRepository _valido)
        {
            this._context = _context;
            this._cookieAuthService = _cookieAuthService;
            this._repository = _repository;
            this._valido = _valido;
            _logger = logger;
            _cookieAuthService.SetHttpContext(HttpContext);
        }

        public IActionResult PreIndex()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Index()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            int id = _context.EncontrarIdUsuario(nombre);
            ViewBag.Nombre = nombre;
            ViewBag.Avatar = _context.AvatarUsuario(nombre);
            ViewBag.Cursos = _repository.CursosU(nombre);
            ViewBag.Total = _repository.NumeroCursos();
            ViewBag.Progreso = _repository.NumeroCursosEnProgreso(id);
            //_repository.ActualizarTodosPorcentajeSubtema(id);
            //_repository.ActualizarTodosPorcentajeTema(id);
            //_repository.ActualizarTodosPorcentajeCurso(id);
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            return View();
        }
        public IActionResult Temas(int curso)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Nombre = nombre;
            ViewBag.Avatar = _context.AvatarUsuario(nombre);
            ViewBag.Curso = _repository.ObtenerNombreCurso(curso);
            ViewBag.Temas = _repository.TemasU(nombre,curso);
            ViewBag.Total = _repository.NumeroTemas(curso);
            ViewBag.Progreso = _repository.NumeroTemasEnProgreso(nombre,curso);
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            return View();
        }
        public IActionResult SubTemas(int tema)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Nombre = nombre;
            ViewBag.Avatar = _context.AvatarUsuario(nombre);
            ViewBag.Tema = _repository.ObtenerNombreTema(tema);
            ViewBag.Subtemas = _repository.SubtemasU(nombre, tema);
            ViewBag.Total = _repository.NumeroSubtemas(tema);
            ViewBag.Progreso = _repository.NumerosubtemasEnProgreso(nombre, tema);
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            return View();
        }
        public IActionResult Lecciones(int subtema)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            if(_repository.ObtenerNombreSubtema(subtema) == "Historias Sencillas")
            {
                return RedirectToAction("HistoriaIndex", "Historia");
            }
            ViewBag.Nombre = nombre;
            ViewBag.Avatar = _context.AvatarUsuario(nombre);
            ViewBag.Subtema = _repository.ObtenerNombreSubtema(subtema);
            ViewBag.Lecciones = _repository.LeccionesU(nombre, subtema);
            ViewBag.Total = _repository.NumeroLecciones(subtema);
            ViewBag.Progreso = _repository.NumeroLeccionesEnProgreso(nombre, subtema);
            ViewBag.Pruebas = _repository.PruebasSubtemaU(nombre, subtema);
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            return View();
        }
        
        public IActionResult EducaNinja()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Info()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            ViewBag.Nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Avatar = _context.AvatarUsuario(_cookieAuthService.LoggedUser().User);
            return View();
        }
        [HttpGet]
        public ActionResult EditUser(string statusE)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            ViewBag.Nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Avatar = _context.AvatarUsuario(_cookieAuthService.LoggedUser().User);
            var nombre = _cookieAuthService.LoggedUser().User;
            Usuario user = new Usuario();
            user = _context.ObtenerUsuario(nombre);
            ViewBag.StatusEdit = statusE;
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            return View("EditUser", user);
        }
        [HttpPost]
        public ActionResult EditUser(Usuario userN)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            ViewBag.Nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Avatar = _context.AvatarUsuario(_cookieAuthService.LoggedUser().User);
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            var nombre = _cookieAuthService.LoggedUser().User;
            userN.User = userN.User.Substring(0, 1).ToUpper() + userN.User.Substring(1).ToLower();
            
            if (userN.NombreUsuario == null)
            {
                ModelState.AddModelError("NombreUsuarioVacio", "Ingresar Nombre");
            }
            if (userN.Escuela == null)
            {
                ModelState.AddModelError("EscuelaVacio", "Ingresar Escuela");
            }
            if (nombre != userN.User)
            {
                if (nombre == "AdminEduca" || nombre == "Admineduca")
                {
                    ModelState.AddModelError("UsernameE", "Usuario existente");
                }
                if (_context.BuscarUsuarioUser(userN.User) == true)
                {
                    ModelState.AddModelError("UsernameE", "Usuario existente");
                }
            }
            if (userN.Age == null)
            {
                ModelState.AddModelError("AgeVacio", "Ingresar Edad");
            }
            if (userN.Age <= 0 || userN.Age > 120 )
            {
                ModelState.AddModelError("AgeError", "Edad no válida");
            }
            if (userN.User == null)
            {
                ModelState.AddModelError("UserVacio", "Ingresar Usuario");
            }

            if (userN.NombreTutor == null)
            {
                ModelState.AddModelError("NombreTutorVacio", "Ingresar Nombre Tutor");
            }
            if (!_valido.emailValido(userN.EmailTutor))
            {
                ModelState.AddModelError("EmailError", "Email no válido");
            }
            if (!_valido.EmailUserEqual(nombre, userN.EmailTutor))
            {
                if (_valido.EmailExist(userN.EmailTutor))
                {
                    ModelState.AddModelError("EmailExist", "Email ya registrado");
                }
            }
            if (userN.EmailTutor == null)
            {
                ModelState.AddModelError("EmailVacio", "Email no válido");
            }
            if (userN.CelularTutor == null)
            {
                ModelState.AddModelError("CelularTutorVacio", "Ingresar Celular Tutor");
            }
            if (!ModelState.IsValid)
            {
                ViewBag.StatusEdit = "No editado!";
                Response.StatusCode = 400;
                return View(userN);
            }
            int id = _context.EncontrarIdUsuario(nombre);
            if (_valido.MismoUsuario(userN, id))
            {
                ViewBag.StatusEdit = "Edita un campo";
                Response.StatusCode = 400;
                return View(userN);
            }
                _context.EditarUsuario(userN, id);
            return RedirectToAction("LoginEdit", "Auth", new { username = userN.User, password =_context.PassUsuario(id)});
        }
        public ActionResult EditPassUser(string statusE)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            ViewBag.Nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Avatar = _context.AvatarUsuario(_cookieAuthService.LoggedUser().User);
            ViewBag.StatusEdit = statusE;
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            return View();
        }
        
        public ActionResult ChangePassword(string pass, string pass1, string pass2)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            int id = _context.EncontrarIdUsuario(nombre);
            if (pass == null)
            {
                ModelState.AddModelError("PassVacio", "Ingresar contraseña actual");
            }
            if (pass1 == null)
            {
                ModelState.AddModelError("Pass1Vacio", "Ingresar contraseña actual");
            }
            if (pass2 == null)
            {
                ModelState.AddModelError("Pass2Vacio", "Ingresar contraseña actual");
            }
            if (pass1 != pass2)
            {
                ModelState.AddModelError("PassDiferent", "No coinciden");
            }
            if(!_valido.PasswordValidate(id, pass))
            {
                Response.StatusCode = 400;
                return RedirectToAction("EditPassUser", "home", new { statusE = "No editado!" });
            }
            if (!ModelState.IsValid)
            {
                Response.StatusCode = 400;
                return RedirectToAction("EditPassUser", "home");
            }
            _context.EditarPassword(id, pass1);
            return RedirectToAction("EditPassUser", "home", new { statusE = "Editado!" });
        }
        public IActionResult NotasUsuario()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Nombre = nombre;
            ViewBag.Nombre = nombre;
            ViewBag.Avatar = _context.AvatarUsuario(nombre);
            ViewBag.Temas = _repository.TodosTemasU(nombre);
            ViewBag.Subtemas = _repository.TodosSubtemasU(nombre);
            ViewBag.Lecciones = _repository.TodosLeccionesU(nombre);
            return View();
        }
        public IActionResult PagLecciones(int leccion)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            int id = _context.EncontrarIdUsuario(nombre);
            var nombreLeccion = _repository.NombrePaginaLeccion(leccion,id);
            if(nombreLeccion == "Completado")
            {
                return RedirectToAction("Lecciones", "home", new { subtema = _repository.ObtenerIdSubtema(leccion) });
            }else if(nombreLeccion == "NotFound")
            {
                return RedirectToAction("PageBeta", "home");
            }
            else
            {
                return RedirectToAction(nombreLeccion, "Paginas");
            }
          
        }
        public IActionResult PageBeta()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }

        public IActionResult Privacy()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}