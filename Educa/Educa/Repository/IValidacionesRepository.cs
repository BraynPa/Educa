using Educa.BD;
using Educa.Models;
using Educa.Service;
using System.Security.Claims;
using System.Text.RegularExpressions;
namespace Educa.Repository

{
    public interface IValidacionesRepository
    {
        public Boolean emailValido(String email);
        public Boolean MismoUsuario(Usuario usuario, int id);
        public Boolean PasswordValidate(int Id, string pass);

    }
    public class ValidacionesRepository : IValidacionesRepository
    {
        private EducaContext _context;
        private IUsuarioRepository _usuario;
        public ValidacionesRepository(EducaContext context, IUsuarioRepository _usuario)
        {
            _context = context;
            this._usuario = _usuario;
        }
        public Boolean emailValido(String email)
        {
            String expresion;
            expresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(email, expresion))
            {
                if (Regex.Replace(email, expresion, String.Empty).Length == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        public Boolean MismoUsuario(Usuario usuario, int id)
        {
            var usuarioFinal = _context._usuario.FirstOrDefault(o => o.Id == id);
            if (usuarioFinal.CelularTutor == usuario.CelularTutor && usuarioFinal.EmailTutor == usuario.EmailTutor && usuarioFinal.NombreTutor ==  usuario.NombreTutor && usuarioFinal.User == usuario.User && usuarioFinal.NombreUsuario == usuario.NombreUsuario && usuarioFinal.Age == usuario.Age && usuarioFinal.Escuela == usuario.Escuela)
            {
                return true;
            }
            return false;
        }
        public Boolean PasswordValidate(int Id, string pass)
        {
            var usuarioFinal = _context._usuario.FirstOrDefault(o => o.Id == Id);
            if(usuarioFinal.Password == pass)
            {
                return true;
            }
            return false;
        }


    }
}
