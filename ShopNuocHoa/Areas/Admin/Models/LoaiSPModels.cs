using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ShopNuocHoa.Areas.Admin.Models
{
    public class LoaiSPModels
    {
        DBContext dbsp = new DBContext();

        public List<LoaiSP> getAllLSP()
        {
            DataTable dt = dbsp.readData("SELECT * FROM LoaiSP");
            List<LoaiSP> listLSP = new List<LoaiSP>();
            foreach (DataRow dr in dt.Rows)
            {
                LoaiSP loai = new LoaiSP();
                loai.maLoai = dr[0].ToString();
                loai.tenLoai = dr[1].ToString();
                loai.ghiChu = dr[2].ToString();
                loai.Anh = dr[3].ToString();
                listLSP.Add(loai);
            }
            return listLSP;
        }
        public LoaiSP get1LSP(string id)
        {
            DataTable dt = dbsp.readData("SELECT * FROM LoaiSP WHERE maLoai = '" + id + "'");
            LoaiSP loai = new LoaiSP();
            loai.maLoai = dt.Rows[0][0].ToString();
            loai.tenLoai = dt.Rows[0][1].ToString();
            loai.ghiChu = dt.Rows[0][2].ToString();
            loai.Anh = dt.Rows[0][3].ToString();
            return loai;
        }
    }
}