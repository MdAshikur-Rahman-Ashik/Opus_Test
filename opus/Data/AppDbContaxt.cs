using Microsoft.EntityFrameworkCore;
using opus.Models;

namespace opus.Data
{
    public class AppDbContaxt:DbContext
    {
        public AppDbContaxt(DbContextOptions<AppDbContaxt>options):base(options) 
        {
            
        }
        public DbSet<Product> Products  { get; set; }
    }
}
