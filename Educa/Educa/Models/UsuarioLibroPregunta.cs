namespace Educa.Models
{
    public class UsuarioLibroPregunta
    {
        public int Id { get; set; }
        public int IdUsuarioLibro { get; set; }
        public int IdPreguntaPrueba { get; set; }
        public int ValorPregunta { get; set; }
        public UsuarioLibro? UsuarioLibros { get; set; }
        public PreguntaPrueba? PreguntaPruebas { get; set; }
    }
}
