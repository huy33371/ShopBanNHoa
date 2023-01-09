using ShopNuocHoa.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShopNuocHoa.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            SanPhamModels db = new SanPhamModels();
            LoaiSPModels loaiSPModels = new LoaiSPModels();
            List<LoaiSP> loaiSPs = loaiSPModels.getAllLSP();
            List<SanPham> listSp = db.getAllSP();
            ViewBag.listLoaiSP = loaiSPs;
            return View(listSp);
         
        }

    }
}