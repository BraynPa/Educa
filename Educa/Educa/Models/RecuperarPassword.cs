namespace Educa.Models
{
    public class RecuperarPassword
    {
        public int Id { get; set; }
        public string Pin { get; set; }
        public int IdUsuario { get; set; }
        public Usuario Usuarios { get; set; }

    }
}
