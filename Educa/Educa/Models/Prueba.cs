namespace Educa.Models
{
    public class Prueba
    {
        public int Id { get; set; }
        public string? NombrePrueba { get; set; }
        public List<PreguntaPrueba>? PreguntaPruebas { get; set; }
    }
}
