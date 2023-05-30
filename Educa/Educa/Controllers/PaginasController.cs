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
        public IActionResult Leccion1Ej3(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion1Finish(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return RedirectToAction("Lecciones", "Home", new { subtema = 1 });
        }
        public IActionResult Leccion2Pag1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion2Pag2()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion2Ej1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion2Finish(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return RedirectToAction("Lecciones", "Home", new { subtema = 1 });
        }
        public IActionResult Leccion3Pag1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag2()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag3()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag4()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag5()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag6()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag7()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag8()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag9()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag10()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag11()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag12()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag13()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag14()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag15()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag16()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag17()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag18()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag19()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag20()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag21()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag22()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag23()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag24()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag25()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag26()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag27()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag28()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag29()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag30()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Pag31()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Ej1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Ej2(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Ej3(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Ej4(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Ej5(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }

        public IActionResult Leccion3Ej6(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion3Finish(int puntos)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return RedirectToAction("Subtemas", "Home", new { tema = 1 });
        }
        
        public IActionResult Leccion4Pag1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        public IActionResult Leccion5Pag1()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
    }
}
