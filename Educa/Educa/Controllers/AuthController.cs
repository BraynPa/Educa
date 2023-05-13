using Educa.Models;
using Educa.Repository;
using Educa.Service;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace Educa.Controllers
{
    public class AuthController : Controller
    {
        private readonly IUsuarioRepository _usuario;
        private readonly IDatosRepository _repository;
        private readonly ICookieAuthService _cookieAuthService;
        private readonly ILogger<AuthController> _logger;

        public AuthController(IUsuarioRepository _usuario, ICookieAuthService _cookieAuthService, IDatosRepository _repository, ILogger<AuthController> logger)
        {

            this._usuario = _usuario;
            this._cookieAuthService = _cookieAuthService;
            this._repository = _repository;
            _cookieAuthService.SetHttpContext(HttpContext);
            this._logger = logger;
        }
        public ActionResult Landing()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Login()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            ViewBag.Alert = "Disable";
            return View();
        }
        [HttpPost]
        public IActionResult Login(string username, string password)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var usuario = _usuario.EncontrarUsuario(username, password);
            if (usuario != null)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name, username)
                };

                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                var claimsPrincipal = new ClaimsPrincipal(claimsIdentity);
                _cookieAuthService.SetHttpContext(HttpContext);
                _cookieAuthService.Login(claimsPrincipal);


                return RedirectToAction("PreIndex", "Home");
            }

            ViewBag.Alert = "Enable";
            return View();
        }
        [HttpGet]
        public IActionResult Forgot()
        {
            //_cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult Forgot(string email)
        {         
           return RedirectToAction("Forgot2", "Auth");
        }
        [HttpGet]
        public IActionResult Forgot2()
        {
            //_cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult Forgot2(string a, string b, string c, string d)
        {
            return RedirectToAction("Forgot3", "Auth");
        }
        [HttpGet]
        public IActionResult Forgot3()
        {
            //_cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult Forgot3(string password, string passwordvalidate)
        {
            return RedirectToAction("Login", "Auth");
        }
        [HttpGet]
        public IActionResult SignIn()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult SignIn(Usuario usuario)
        {
            if (_usuario.BuscarUsuarioUser(usuario.NombreUsuario) == true)
            {
                ModelState.AddModelError("Username", "Usuario existente");
            }
            if (usuario.Age == null)
            {
                ModelState.AddModelError("UsernameVacio", "Ingresar Usuario");
            }

            if (usuario.User == null)
            {
                ModelState.AddModelError("PasswordVacio", "Ingresar Password");
            }
            if (usuario.Password == null)
            {
                ModelState.AddModelError("passwordConfVacio", "Ingresar password Confirmacion");
            }

            if (!ModelState.IsValid)
            {
                return RedirectToAction("Registrar", "Auth", usuario);
            }

            _cookieAuthService.SetHttpContext(HttpContext);
            _usuario.AgregarUsuario(usuario);
            return RedirectToAction("CuestionarioI", "Auth", new { user = usuario.User });
        }
        [HttpGet]
        public IActionResult CuestionarioI(string user)
        {
            ViewBag.Nombre = user;
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult CuestionarioI(string a, string b, string c, string d, string e, string f, string user)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            _repository.RegistrarPrimerCuestionario(a, b, c, d, e, f, user);
            return RedirectToAction("DatosUsuarios", "Auth", new { dato = user });
        }
        [HttpGet]
        public IActionResult DatosUsuarios(string dato)
        {
            _repository.RegistroTablasUsuario(dato);
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }

    }
}
