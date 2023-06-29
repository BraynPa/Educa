using Educa.Models;
using Educa.Repository;
using Educa.Service;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
namespace Educa.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private readonly ICookieAuthService _cookieAuthService;
        private readonly IAdminRepository _adminRepository;
        private readonly ILogger<HomeController> _logger;

        public AdminController(ILogger<HomeController> logger,ICookieAuthService _cookieAuthService, IAdminRepository _adminRepository)
        {
            this._cookieAuthService = _cookieAuthService;
            this._adminRepository = _adminRepository;
            _logger = logger;
            _cookieAuthService.SetHttpContext(HttpContext);
        }
        public IActionResult AdminIndex()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if(claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Usuarios = _adminRepository.usuarios();
            ViewBag.UsuariosCursos = _adminRepository.usuarioCursos();
            ViewBag.UsuariosTotal = _adminRepository.NumeroUsuariosTotal();
            ViewBag.UsuariosMesTotal = _adminRepository.NumeroUsuariosMesActual();
            ViewBag.UsuariosNuevos = _adminRepository.NumeroUsuariosHoy();
            ViewBag.UsuarioCursoPorcentaje = _adminRepository.usuarioCursosPorcentaje();
            ViewBag.UsuarioCursoNota = _adminRepository.usuarioCursosNota();
            return View();
        }
        public IActionResult GradoAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Grados = _adminRepository.grados();
            return View();
        }
        public IActionResult CursoAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Cursos = _adminRepository.cursos();
            return View();
        }
        public IActionResult TemaAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Temas = _adminRepository.temas();
            return View();
        }
        public IActionResult SubtemaAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Temas = _adminRepository.temas();
            ViewBag.Subtemas = _adminRepository.subTemas();
            return View();
        }
        public IActionResult LeccionAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Subtemas = _adminRepository.subTemas();
            ViewBag.Lecciones = _adminRepository.lecciones();
            return View();
        }
        public IActionResult PagLeccionAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Lecciones = _adminRepository.lecciones();
            ViewBag.PagLecciones = _adminRepository.pagLecciones();
            return View();
        }
        public IActionResult EjercicioAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Lecciones = _adminRepository.lecciones();
            ViewBag.Ejercicios = _adminRepository.ejercicios();
            return View();
        }
        public IActionResult LibroAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Libros = _adminRepository.libros();
            return View();
        }
        public IActionResult ExamAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Examenes = _adminRepository.examenes();
            ViewBag.Subtemas = _adminRepository.subTemasOnly();
            ViewBag.Libros = _adminRepository.librosOnly();
            return View();
        }
        public IActionResult CuestionarioAdmin()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Cuestionario = _adminRepository.cuestionarios();
            return View();
        }
        public IActionResult CuestionarioPreguntasAdmin(int value)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var claim = _cookieAuthService.ObtenerClaim();
            if (claim.Value != "AdminEduca")
            {
                return RedirectToAction("PreIndex", "Home");
            }
            ViewBag.Value = value;
            ViewBag.Nombre = _adminRepository.NombreCuestionario(value);
            ViewBag.CuestionarioPregunta = _adminRepository.cuestionarioPreguntas();
            return View();
        }
    }
}
