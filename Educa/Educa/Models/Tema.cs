namespace Educa.Models
{
    public class Tema
    {
        public int Id { get; set; }
        public string? TituloTema { get; set; }
        public string? DescripcionTema { get; set; }
        public int IdCurso { get; set; }
        public int IdColor { get; set; }
        public Curso? Cursos { get; set; }
        public Color? Colores { get; set; }
    }
}
