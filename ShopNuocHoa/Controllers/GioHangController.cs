using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShopNuocHoa.Models;

namespace ShopNuocHoa.Controllers
{
    public class GioHangController : Controller
    {
        public DBModel db = new DBModel();
        // GET: GioHang
        public GioHang getGioHang()
        {
            GioHang gioHang = Session["GioHang"] as GioHang;
            if(gioHang == null || Session["GioHang"] == null)
            {
                gioHang = new GioHang();
                Session["GioHang"] = gioHang;
            }
            return gioHang;
        }
        
        //add item vao gio hang
        public ActionResult AddtoCart(string id)
        {
            var pro = db.SanPham.SingleOrDefault(s => s.maSP == id);
            if(pro != null)
            {
                getGioHang().Add(pro);
            }
            return RedirectToAction("ShowCart", "GioHang");
        }

        //trang gio hang
        public ActionResult ShowCart()
        {
            if(Session["GioHang"] == null)
                return RedirectToAction("ShowCart", "GioHang");
            GioHang gioHang = Session["GioHang"] as GioHang;
            return View(gioHang);

        }
        public ActionResult update_soLuong(FormCollection form)
        {
            GioHang gioHang = Session["GioHang"] as GioHang;
            string id_sanPham = form["id_sanPham"];
            int soLuong = int.Parse(form["soLuong"]);
            gioHang.Update_SL_Shopping(id_sanPham, soLuong);
            return RedirectToAction("ShowCart", "GioHang");
        }
        public ActionResult delete_SP(int id)
        {
            GioHang gioHang = Session["GioHang"] as GioHang;
            gioHang.delete_SP_Shopping(id);
            return RedirectToAction("ShowCart", "GioHang");
        }
      
    }
}