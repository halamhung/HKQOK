using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HKQTravel.Areas.Admin.Controllers
{
    public class DashBoardController : BaseController
    {
        // GET: Admin/DashBoard
        public ActionResult Index()
        {
            //if (string.IsNullOrEmpty(Session["admin_user"].ToString()))
            //{
            //    return Redirect("~/Admin/Login");
            //}
            return View();
        }
    }
}