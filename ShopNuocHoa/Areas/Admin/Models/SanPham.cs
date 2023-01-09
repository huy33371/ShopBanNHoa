namespace ShopNuocHoa.Areas.Admin.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    public partial class SanPham
    {
        [Key]
        [StringLength(5)]
        [Display(Name = "Mã sản phẩm")]
        public string maSP { get; set; }

        [Column(TypeName = "ntext")]
        [Required]
        [Display(Name = "Tên sản phẩm")]
        public string tenSP { get; set; }

        [Required]
        [StringLength(5)]
        public string maLoai { get; set; }

        [Required]
        [StringLength(5)]
        public string maTH { get; set; }

        [Column(TypeName = "ntext")]
        [Display(Name = "Mô tả")]
        public string moTa { get; set; }

        [Display(Name = "Giá")]
        public int donGia { get; set; }

        [Display(Name = "SL")]
        public int? soLuong { get; set; }

        [Column(TypeName = "text")]
        [Display(Name = "Ảnh")]
        public string Anh { get; set; }

        public virtual LoaiSP LoaiSP { get; set; }

        public virtual ThuongHieu ThuongHieu { get; set; }
    }
}
