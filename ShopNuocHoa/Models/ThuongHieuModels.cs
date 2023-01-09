using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ShopNuocHoa.Models
{
    public class ThuongHieuModels
    {
        DBModel dbsp = new DBModel();

        public List<ThuongHieu> getAllThuongHieu()
        {
            DataTable dt = dbsp.readData("SELECT * FROM ThuongHieu");
            List<ThuongHieu> listTH = new List<ThuongHieu>();
            foreach (DataRow dr in dt.Rows)
            {
                ThuongHieu th = new ThuongHieu();
                th.maTH = dr[0].ToString();
                th.tenTH = dr[1].ToString();
                th.moTa = dr[2].ToString();
                listTH.Add(th);
            }
            return listTH;
        }
        public ThuongHieu get1TH(string id)
        {
            DataTable dt = dbsp.readData("SELECT * FROM ThuongHieu WHERE maTH = '" + id + "'");
            ThuongHieu th = new ThuongHieu();
            th.maTH = dt.Rows[0][0].ToString();
            th.tenTH = dt.Rows[0][1].ToString();
            th.moTa = dt.Rows[0][2].ToString();
            return th;
        }

    }
}