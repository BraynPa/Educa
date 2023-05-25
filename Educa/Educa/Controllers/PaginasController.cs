using Educa.Repository;
using Educa.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Educa.Controllers
{
    public class PaginasController : Controller
    {
        private readonly IUsuarioRepository _context;
        private readonly ICookieAuthService _cookieAuthService;
        private readonly IDatosRepository _repository;
        public PaginasController(IUsuarioRepository _context, ICookieAuthService _cookieAuthService, IDatosRepository _repository)
        {
            this._context = _context;
            this._cookieAuthService = _cookieAuthService;
            this._repository = _repository;
            _cookieAuthService.SetHttpContext(HttpContext);
        }
        public IActionResult Leccion1Pag1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion1Pag2()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion1Pag3()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion1Ej1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion1Ej2(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion1Ej3()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
    }
}
