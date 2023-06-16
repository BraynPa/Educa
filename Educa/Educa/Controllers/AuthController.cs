using Educa.Models;
using Educa.Repository;
using Educa.Service;
using Microsoft.AspNetCore.Authentication;
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
        private readonly IValidacionesRepository _valido;
        private readonly ILogger<AuthController> _logger;

        public AuthController(IUsuarioRepository _usuario, IValidacionesRepository _valido, ICookieAuthService _cookieAuthService, IDatosRepository _repository, ILogger<AuthController> logger)
        {

            this._usuario = _usuario;
            this._cookieAuthService = _cookieAuthService;
            this._repository = _repository;
            this._valido = _valido;
            _cookieAuthService.SetHttpContext(HttpContext);
            this._logger = logger;
        }
        public ActionResult Landing()
        {
            return View();
        }
        public ActionResult UserNotFound()
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
            username = username.Substring(0, 1).ToUpper() + username.Substring(1).ToLower();
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
        public IActionResult LoginEdit(string username, string password)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            username = username.Substring(0, 1).ToUpper() + username.Substring(1).ToLower();
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


                return RedirectToAction("EditUser", "Home", new { statusE = "Editado!" });
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
        public ViewResult SignIn()
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            return View("SignIn", new Usuario());
        }
        [HttpPost]
        public ActionResult SignIn(Usuario usuario)
        {
            usuario.User = usuario.User.Substring(0, 1).ToUpper() + usuario.User.Substring(1).ToLower();
            if (usuario.NombreUsuario == null)
            {
                ModelState.AddModelError("NombreUsuarioVacio", "Ingresar Nombre");
            }
            if (usuario.Escuela == null)
            {
                ModelState.AddModelError("EscuelaVacio", "Ingresar Escuela");
            }
            if (_usuario.BuscarUsuarioUser(usuario.User) == true)
            {
                ModelState.AddModelError("UsernameE", "Usuario existente");
            }
            if (usuario.Age == null)
            {
                ModelState.AddModelError("AgeVacio", "Ingresar Edad");
            }
            if (usuario.Age <= 0 || usuario.Age > 120)
            {
                ModelState.AddModelError("AgeError", "Edad no válida");
            }
            if (usuario.User == null)
            {
                ModelState.AddModelError("UserVacio", "Ingresar Usuario");
            }

            if (usuario.NombreTutor == null)
            {
                ModelState.AddModelError("NombreTutorVacio", "Ingresar Nombre Tutor");
            }
            if (!_valido.emailValido(usuario.EmailTutor))
            {
                ModelState.AddModelError("EmailError", "Email no válido");
            }
            if (usuario.EmailTutor == null)
            {
                ModelState.AddModelError("EmailVacio", "Email no válido");
            }
            if (usuario.CelularTutor == null)
            {
                ModelState.AddModelError("CelularTutorVacio", "Ingresar Celular Tutor");
            }
            if (usuario.Password == null)
            {
                ModelState.AddModelError("passwordVacio", "Ingresar contraseña");
            }

            if (!ModelState.IsValid)
            {
                return View("SignIn", usuario);
            }

            _cookieAuthService.SetHttpContext(HttpContext);
            _usuario.AgregarUsuario(usuario);
            return RedirectToAction("AvatarUser", "Auth", new { user = usuario.User });
        }
        [HttpGet]
        public IActionResult AvatarUser(string user)
        {
            ViewBag.Nombre = user;
            _repository.RegistroTablasUsuario(user);
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpGet]
        public IActionResult Avatar(string user, int avatar_id)
        {
            _cookieAuthService.SetHttpContext(HttpContext);
            var usuario = _usuario.ObtenerUsuario(user);

            switch (avatar_id)
            {
                case 0:
                    usuario.Avatar = "/Images/Home/Avatar1.png";
                    _usuario.AstualizarUsuario(usuario);
                    break;
                case 1:
                    usuario.Avatar = "/Images/Home/Avatar1.png";
                    _usuario.AstualizarUsuario(usuario);
                    break;
                case 2:
                    usuario.Avatar = "/Images/Home/Avatar2.png";
                    _usuario.AstualizarUsuario(usuario);
                    break;
                case 3:
                    usuario.Avatar = "/Images/Home/Avatar3.png";
                    _usuario.AstualizarUsuario(usuario);
                    break;
                case 4:
                    usuario.Avatar = "/Images/Home/Avatar4.png";
                    _usuario.AstualizarUsuario(usuario);
                    break;
                case 5:
                    usuario.Avatar = "/Images/Home/Avatar5.png";
                    _usuario.AstualizarUsuario(usuario);
                    break;
                case 6:
                    usuario.Avatar = "/Images/Home/Avatar6.png";
                    _usuario.AstualizarUsuario(usuario);
                    break;
                default:
                    // code block
                    break;
            }
            return RedirectToAction("CuestionarioI", "Auth", new { user = user });
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
            _repository.RegistroTablasPruebas(dato);
            _cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpGet]
        public IActionResult Logout(string user)
        {
            ViewBag.Nombre = user;
            DateTime fechaHora = DateTime.Now;
            var hora = fechaHora.ToString("HH");
            int result = Int32.Parse(hora);
            if (result <= 7 && result >= 6)
            {
                ViewBag.Hora = "dusk";
            }
            if (result <= 19 && result >= 18)
            {
                ViewBag.Hora = "sunset";
            }
            if ((result <= 24 && result > 19) || (result < 6 && result >= 0))
            {
                ViewBag.Hora = "night";
            }
            if (result < 18 && result > 7)
            {
                ViewBag.Hora = "day";
            }
            HttpContext.SignOutAsync();
            return View();
        }
    }
}
