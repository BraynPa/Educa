using Educa.BD;
using Educa.Models;
using Educa.Service;
using System.Security.Claims;
namespace Educa.Repository
{
    public interface IUsuarioRepository
    {
        public Usuario ObtenerUsuarioLogin(Claim claim);
        public Usuario ObtenerUsuario(string user);
        public Usuario EncontrarUsuario(String username, String password);
        public Dictionary<int, String> IndicesPorId();
        public bool BuscarUsuarioUser(String user);
        public void AgregarUsuario(Usuario usuario);
        public void AstualizarUsuario(Usuario usuario);
        public int EncontrarIdUsuario(string user);
        public string AvatarUsuario(string user);
        public string PassUsuario(int Id);
        public void EditarUsuario(Usuario usuario, int id);
        public void EditarPassword(int id, string pass1);
        public void ForgotEditPassword(string email, string pass1);
        public void DeleteEditPin(string email);
    }
    public class UsuarioRepository : IUsuarioRepository
    {
        private IEducaContext _context;
        private readonly ICookieAuthService _cookieAuthService;

        public UsuarioRepository(EducaContext context, ICookieAuthService cookieAuthService)
        {
            _context = context;
            _cookieAuthService = cookieAuthService;

        }
        public Usuario EncontrarUsuario(string username, string password)
        {
            var Usuario = _context._usuario.FirstOrDefault(o => o.User == username && o.Password == password);
            return Usuario;
        }
        public string AvatarUsuario(string user)
        {
            var Usuario = _context._usuario.FirstOrDefault(o => o.User == user);
            return Usuario.Avatar;
        }
        public string PassUsuario(int Id)
        {
            var Usuario = _context._usuario.FirstOrDefault(o => o.Id == Id);
            return Usuario.Password;
        }
        public int EncontrarIdUsuario(string user)
        {
            var Usuario = _context._usuario.FirstOrDefault(o => o.User == user);
            return Usuario.Id;
        }
        public void AstualizarUsuario(Usuario usuario)
        {
            _context._usuario.Update(usuario);
            _context.SaveChanges();
        }

        public Dictionary<int, string> IndicesPorId()
        {
            Dictionary<int, string> indices = new Dictionary<int, string>();
            var usuarios = _context._usuario.ToList();

            foreach (var item in usuarios)
            {
                indices.Add(item.Id, item.User);
            }

            return indices;
        }

        public Usuario ObtenerUsuarioLogin(Claim claim)
        {
            var user = _context._usuario.FirstOrDefault(o => o.User == claim.Value);
            return user;
        }
        public Usuario ObtenerUsuario(String user)
        {
            var usuario = _context._usuario.FirstOrDefault(o => o.User == user);
            return usuario;
        }
        public bool BuscarUsuarioUser(String user)
        {
            if(user == "AdminEduca")
            {
                return true;
            }
            var Usuario = _context._usuario.FirstOrDefault(o => o.User == user);
            if (Usuario == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }
       
        public void AgregarUsuario(Usuario usuario)
        {
            usuario.User = usuario.User.Substring(0, 1).ToUpper() + usuario.User.Substring(1).ToLower();
            usuario.Fecha = DateTime.Now;
            _context._usuario.Add(usuario);
            _context.SaveChanges();
        }
        public void EditarUsuario(Usuario usuario, int id)
        {
            var usuarioFinal = _context._usuario.FirstOrDefault(o => o.Id == id);
            usuarioFinal.NombreUsuario = usuario.NombreUsuario;
            usuarioFinal.Age = usuario.Age;
            usuarioFinal.Escuela = usuario.Escuela;
            usuarioFinal.User = usuario.User;
            usuarioFinal.NombreTutor = usuario.NombreTutor;
            usuarioFinal.EmailTutor = usuario.EmailTutor;
            usuarioFinal.CelularTutor = usuario.CelularTutor;
            _context._usuario.Update(usuarioFinal);
            _context.SaveChanges();
        }
        public void EditarPassword(int id, string pass1)
        {
            var usuarioFinal = _context._usuario.FirstOrDefault(o => o.Id == id);
            usuarioFinal.Password = pass1;
            _context._usuario.Update(usuarioFinal);
            _context.SaveChanges();
        }
        public void ForgotEditPassword(string email, string pass1)
        {
            var usuarioFinal = _context._usuario.FirstOrDefault(o => o.EmailTutor == email);
            usuarioFinal.Password = pass1;
            _context._usuario.Update(usuarioFinal);
            _context.SaveChanges();
        }
        public void DeleteEditPin(string email)
        {
            var usuarioFinal = _context._usuario.FirstOrDefault(o => o.EmailTutor == email);
            var pinRec = _context._recuperarPassword.FirstOrDefault(o => o.IdUsuario == usuarioFinal.Id);
            _context._recuperarPassword.Remove(pinRec);
            _context.SaveChanges();
        }
    }
}
