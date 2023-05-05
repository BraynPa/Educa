namespace Educa.Models
{
    public class Subtema
    {
        public int Id { get; set; }
        public string? TituloSubtema { get; set; }
        public string? DescripcionSubtema { get; set; }
        public int IdColor { get; set; }
        public string? TipoSubtema { get; set; }
        public Color? Colores { get; set; }
    }
}
