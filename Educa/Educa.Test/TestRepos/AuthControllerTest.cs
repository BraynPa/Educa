using Educa.Repository;
using Educa.Service;
using Educa.Models;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Educa.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace Educa.Test.TestRepos
{
    [TestFixture]
    public class AuthControllerTest
    {
        [Test]
        [Obsolete]
        public void LoginIngreso()
        {
            var usuario = new Mock<IUsuarioRepository>();
            var cook = new Mock<ICookieAuthService>() { CallBase = true };
            usuario.Setup(o => o.EncontrarUsuario("Anita", "Anita.123")).Returns(new Usuario { });
            var controller = new AuthController(usuario.Object, cook.Object, null, null);
            var view = controller.Login("Anita", "Anita.123");
            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }
        [Test]
        [Obsolete]
        public void LoginFalla()
        {
            var usuario = new Mock<IUsuarioRepository>();
            var cook = new Mock<ICookieAuthService>() { CallBase = true };
            usuario.Setup(o => o.EncontrarUsuario("ermelindaF", null)).Returns(new Usuario { NombreUsuario = "ermelindaF", Password = null});
            var controller = new AuthController(usuario.Object, cook.Object, null, null);
            var view = controller.Login("ermelindaF", null);
            Assert.IsInstanceOf<RedirectToActionResult>(view);
        }
    }
}
