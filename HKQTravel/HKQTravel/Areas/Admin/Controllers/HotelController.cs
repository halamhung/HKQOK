﻿using HKQTravel.Models;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace HKQTravel.Areas.Admin.Controllers
{
    public class HotelController : Controller
    {
        // GET: Admin/Hotel
        dbTravelTourDataContext data = new dbTravelTourDataContext();
        public ActionResult Index(int? page)
        {
            int pagenumber = (page ?? 1);
            int pagesize = 5;
            return View(data.hotels/*.Where(p=>p.Status != 0)*/.ToList().ToPagedList(pagenumber, pagesize));
        }
    }
}