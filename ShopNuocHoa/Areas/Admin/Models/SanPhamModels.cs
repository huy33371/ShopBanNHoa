using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ShopNuocHoa.Areas.Admin.Models
{
    public class SanPhamModels
    {
        DBContext dbsp = new DBContext();

        public List<SanPham> getAllSP()
        {
            DataTable dt = dbsp.readData("SELECT * FROM SanPham");
            List<SanPham> listSp = new List<SanPham>();
            foreach (DataRow dr in dt.Rows)
            {
                SanPham sp = new SanPham();
                sp.maSP = dr[0].ToString();
                sp.tenSP = dr[1].ToString();
                sp.maLoai = dr[2].ToString();
                sp.maTH = dr[3].ToString();
                sp.moTa = dr[4].ToString();
                sp.donGia = int.Parse(dr[5].ToString());
                sp.soLuong = int.Parse(dr[6].ToString());
                sp.Anh = dr[7].ToString();
                listSp.Add(sp);
            }
            return listSp;
        }
        public SanPham get1sanPham(string id)
        {
            DataTable dt = dbsp.readData("SELECT * FROM SanPham WHERE maSP = '" + id + "'");
            SanPham sp = new SanPham();
            sp.maSP = dt.Rows[0][0].ToString();
            sp.tenSP = dt.Rows[0][1].ToString();
            sp.maLoai = dt.Rows[0][2].ToString();
            sp.maTH = dt.Rows[0][3].ToString();
            sp.moTa = dt.Rows[0][4].ToString();
            sp.donGia = int.Parse(dt.Rows[0][5].ToString());
            sp.soLuong = int.Parse(dt.Rows[0][6].ToString());
            sp.Anh = dt.Rows[0][7].ToString();
            return sp;
        }

        public List<SanPham> getSanPhambyLoai(string id)
        {
            DataTable dt = dbsp.readData("SELECT * FROM SanPham WHERE maLoai = '" + id + "'");
            List<SanPham> listSp = new List<SanPham>();
            foreach (DataRow dr in dt.Rows)
            {
                SanPham sp = new SanPham();
                sp.maSP = dr[0].ToString();
                sp.tenSP = dr[1].ToString();
                sp.maLoai = dr[2].ToString();
                sp.maTH = dr[3].ToString();
                sp.moTa = dr[4].ToString();
                sp.donGia = int.Parse(dr[5].ToString());
                sp.soLuong = int.Parse(dr[6].ToString());
                sp.Anh = dr[7].ToString();
                listSp.Add(sp);
            }
            return listSp;
        }

        public List<SanPham> getSPbyThuongHieu(string id)
        {
            DataTable dt = dbsp.readData("SELECT * FROM SanPham WHERE maTH = '" + id + "'");
            List<SanPham> listSp = new List<SanPham>();
            foreach (DataRow dr in dt.Rows)
            {
                SanPham sp = new SanPham();
                sp.maSP = dr[0].ToString();
                sp.tenSP = dr[1].ToString();
                sp.maLoai = dr[2].ToString();
                sp.maTH = dr[3].ToString();
                sp.moTa = dr[4].ToString();
                sp.donGia = int.Parse(dr[5].ToString());
                sp.soLuong = int.Parse(dr[6].ToString());
                sp.Anh = dr[7].ToString();
                listSp.Add(sp);
            }
            return listSp;
        }
    }
}