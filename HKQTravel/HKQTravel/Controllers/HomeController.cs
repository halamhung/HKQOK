using HKQTravel.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Web.UI;

namespace HKQTravel.Controllers
{
    public class HomeController : Controller
    {
        dbTravelTourDataContext data = new dbTravelTourDataContext();

        //Get the tour list from database;
        private List<tour> getTour(int count)
        {
            return data.tours.OrderByDescending(a => a.tour_id).Take(count).ToList();
        }
        private List<destination_point> getDestination(int count)
        {
            return data.destination_points.OrderByDescending(a => a.destination_id).Take(count).ToList();
        }

        //Options in Service
        public ActionResult Service()
        {
            return View();
        }

        //Click to depend on the index action and the travel action.
        public ActionResult DetailTour(int id)
        {
            var details = from detail in data.tours where detail.tour_id == id select detail;
            return View(details.Single());
        }

        #region Default website

        //Display homepage
        public ActionResult Index(int? page)
        {
            var tour = getTour(1000);
            var destination = getDestination(1000);
            int pagesize = 10;
            int pagenum = (page ?? 1);
            return View(tour.ToPagedList(pagenum, pagesize));
        }

        //Display tour and destination
        public ActionResult Travel(int? page)
        {
            var tour = getTour(1000);
            var destination = getDestination(1000);
            int pagesize = 10;
            int pagenum = (page ?? 1);
            return View(tour.ToPagedList(pagenum, pagesize));


        }

        //Display About
        public ActionResult About()
        {


            return View();
        }

        //Display contact
        public ActionResult Contact()
        {
            return View();
        }

        #endregion
    }
}