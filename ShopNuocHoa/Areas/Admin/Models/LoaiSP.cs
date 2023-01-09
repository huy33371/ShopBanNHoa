namespace ShopNuocHoa.Areas.Admin.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LoaiSP")]
    public partial class LoaiSP
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LoaiSP()
        {
            SanPham = new HashSet<SanPham>();
        }

        [Key]
        [StringLength(5)]
        [Display(Name = "Mã loại")]
        public string maLoai { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Tên loại")]
        public string tenLoai { get; set; }

        [StringLength(50)]
        [Display(Name = "Mô tả")]
        public string ghiChu { get; set; }

        [Column(TypeName = "text")]
        [Required]
        [Display(Name = "Ảnh")]
        public string Anh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPham { get; set; }
    }
}
