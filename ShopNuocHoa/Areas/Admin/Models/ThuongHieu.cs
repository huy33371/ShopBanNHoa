namespace ShopNuocHoa.Areas.Admin.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThuongHieu")]
    public partial class ThuongHieu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThuongHieu()
        {
            SanPham = new HashSet<SanPham>();
        }

        [Key]
        [StringLength(5)]
        [Display(Name = "Mã thương hiệu")]
        public string maTH { get; set; }

        [Required]
        [StringLength(50)]
        [Display(Name = "Tên thương hiệu")]
        public string tenTH { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Mô tả")]
        public string moTa { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<SanPham> SanPham { get; set; }
    }
}
