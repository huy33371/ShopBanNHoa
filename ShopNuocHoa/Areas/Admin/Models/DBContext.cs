using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Configuration;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;

namespace ShopNuocHoa.Areas.Admin.Models
{
    public partial class DBContext : DbContext
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataTable dt; 
        string str = ConfigurationManager.ConnectionStrings["DBContext"].ConnectionString;
        public DBContext()
            : base("name=DBContext")
        {
            con = new SqlConnection(str);
        }

        public DataTable readData(string query)
        {
            con.Open();
            da = new SqlDataAdapter(query, con);
            dt = new DataTable();
            da.Fill(dt);
            con.Close();
            return dt;
        }

        //func ghi dl
        public void writeData(string query)
        {
            con.Open();
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            con.Close();
        }

        public virtual DbSet<LoaiSP> LoaiSP { get; set; }
        public virtual DbSet<SanPham> SanPham { get; set; }
        public virtual DbSet<ThuongHieu> ThuongHieu { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<LoaiSP>()
                .Property(e => e.maLoai)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiSP>()
                .Property(e => e.Anh)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiSP>()
                .HasMany(e => e.SanPham)
                .WithRequired(e => e.LoaiSP)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.maSP)
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.maLoai)
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.maTH)
                .IsUnicode(false);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.Anh)
                .IsUnicode(false);

            modelBuilder.Entity<ThuongHieu>()
                .Property(e => e.maTH)
                .IsUnicode(false);

            modelBuilder.Entity<ThuongHieu>()
                .HasMany(e => e.SanPham)
                .WithRequired(e => e.ThuongHieu)
                .WillCascadeOnDelete(false);
        }
    }
}
