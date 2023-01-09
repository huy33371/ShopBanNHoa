using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShopNuocHoa.Models;

namespace ShopNuocHoa.Models
{
    public class ItemGioHang
    {
        public int Id { get; set; }
        public SanPham sanPham_shopping { get; set; }
        public int soLuong_shopping { get; set; }

    }
    public class GioHang
  
    {
        List<ItemGioHang> itemGioHangs = new List<ItemGioHang>();
        public IEnumerable<ItemGioHang> ItemGioHangs
        {
            get { return itemGioHangs; }
        }
        public void Add(SanPham sanPham, int soLuong = 1)
        {
            var item = itemGioHangs.FirstOrDefault(s => s.sanPham_shopping.maSP == sanPham.maSP);
            if (item == null)
            {
                itemGioHangs.Add(new ItemGioHang
                {
                    sanPham_shopping = sanPham,
                    soLuong_shopping = soLuong
                });

            }
            else
            {
                item.soLuong_shopping += soLuong;
            }
        }
        public void Update_SL_Shopping(string id, int soLuong)
        {
            var item = itemGioHangs.Find(s => s.sanPham_shopping.maSP == id);
            if(item != null)
            {
                item.soLuong_shopping = soLuong;
            }
        }

       public void delete_SP_Shopping(int id)
        {
            var item = itemGioHangs.Find(s => s.Id == id);
            if(item != null)
            {
                itemGioHangs.Remove(item);
            }
        }
    }
}