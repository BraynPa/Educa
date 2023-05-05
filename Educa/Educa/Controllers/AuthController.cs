using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Educa.Controllers
{
    public class AuthController : Controller
    {
        // GET: AuthController
        public ActionResult Landing()
        {
            return View();
        }
        [HttpGet]
        public IActionResult Login()
        {
            //_cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult Login(string user, string password)
        {
            //_cookieAuthService.SetHttpContext(HttpContext);
            return RedirectToAction("index", "Home");
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
            //_cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult SignIn(string name, int age, string ie, string user, string password, string nameA, string email, string phone)
        {
            return RedirectToAction("CuestionarioI", "Auth");
        }
        [HttpGet]
        public IActionResult CuestionarioI()
        {
            //_cookieAuthService.SetHttpContext(HttpContext);
            return View();
        }
        [HttpPost]
        public IActionResult CuestionarioI(string a, string b, string c, string d, string e, string f, string g)
        {
            return RedirectToAction("Login", "Auth");
        }
    }
}
