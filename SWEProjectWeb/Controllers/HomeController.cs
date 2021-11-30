using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SWEProjectWeb.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "This is PROJECTIFY";

            return View();
        }

        public ActionResult Contact()
        {
            //ViewBag.Message = "No contact";

            return View();
        }
    }
}