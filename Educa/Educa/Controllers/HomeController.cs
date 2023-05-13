﻿using Educa.Models;
using Educa.Repository;
using Educa.Service;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Educa.Controllers
{
    public class HomeController : Controller
    {
        private readonly IUsuarioRepository _context;
        private readonly ICookieAuthService _cookieAuthService;
        private readonly IDatosRepository _repository;
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger, IUsuarioRepository _context, ICookieAuthService _cookieAuthService, IDatosRepository _repository)
        {
            this._context = _context;
            this._cookieAuthService = _cookieAuthService;
            this._repository = _repository;
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
            ViewBag.Nombre = nombre;
            ViewBag.Cursos = _repository.CursosU(nombre);
            ViewBag.Total = _repository.NumeroCursos();
            ViewBag.Progreso = _repository.NumeroCursosEnProgreso(nombre);
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
            ViewBag.Tema = _repository.ObtenerNombreTema(tema);
            ViewBag.Subtemas = _repository.SubtemasU(nombre, tema);
            ViewBag.Total = _repository.NumeroSubtemas(tema);
            ViewBag.Progreso = _repository.NumeroTemasEnProgreso(nombre, tema);
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
                return RedirectToAction("HistoriaIndex", "Home");
            }
            ViewBag.Nombre = nombre;
            ViewBag.Subtema = _repository.ObtenerNombreSubtema(subtema);
            ViewBag.Lecciones = _repository.LeccionesU(nombre, subtema);
            ViewBag.Total = _repository.NumeroLecciones(subtema);
            ViewBag.Progreso = _repository.NumeroLeccionesEnProgreso(nombre, subtema);
            DateTime fecha = DateTime.Now;
            string FechaFormateada = fecha.ToString("MMMM", new System.Globalization.CultureInfo("es-ES")) + " " + fecha.ToString("dd", new System.Globalization.CultureInfo("es-ES"));
            FechaFormateada = char.ToUpper(FechaFormateada[0]) + FechaFormateada.Substring(1);
            ViewBag.Fecha = FechaFormateada;
            return View();
        }
        public IActionResult HistoriaIndex()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var nombre = _cookieAuthService.LoggedUser().User;
            ViewBag.Libros = _repository.LibrosU(nombre);
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