using Educa.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
namespace Educa.BD.Maps
{
    public class PreguntaPruebaMap : IEntityTypeConfiguration<PreguntaPrueba>
    {
        public void Configure(EntityTypeBuilder<PreguntaPrueba> builder)
        {
            builder.ToTable("PreguntaPrueba");
            builder.HasKey(o => o.Id);

            builder.HasMany(o => o.UsuarioLibroPreguntas).
             WithOne(o => o.PreguntaPruebas).
             HasForeignKey(o => o.IdPreguntaPrueba);

            builder.HasMany(o => o.UsuarioSubtemaPreguntas).
            WithOne(o => o.PreguntaPruebas).
            HasForeignKey(o => o.IdPreguntaPrueba);

        }
    }
}
