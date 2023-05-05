using Educa.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
namespace Educa.BD.Maps
{
    public class TemaMap : IEntityTypeConfiguration<Tema>
    {
        public void Configure(EntityTypeBuilder<Tema> builder)
        {
            builder.ToTable("Tema");
            builder.HasKey(o => o.Id);

            //builder.HasMany(o => o.Cursos).
            // WithOne(o => o.Grados).
            // HasForeignKey(o => o.IdGrado);

        }
    }
}
