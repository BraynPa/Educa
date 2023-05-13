namespace Educa.Models
{
    public class UsuarioSubtemaPregunta
    {
        public int Id { get; set; }
        public int IdUsuarioSubtema { get; set; }
        public int IdPreguntaPrueba { get; set; }
        public int ValorPregunta { get; set; }
        public UsuarioSubtema? UsuarioSubtemas { get; set; }
        public PreguntaPrueba? PreguntaPruebas { get; set; }
    }
}
