﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using SWE_Project_LibDB;

namespace SWEProjectWeb.Controllers
{
    public class LoginController : Controller
    {
        private SWEProjectModelContainer db = new SWEProjectModelContainer();

        // GET: Login
        public ActionResult Index()
        {
            return View(db.Users.ToList());
        }

        // GET: Login/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            User user = db.Users.Find(id);
            if (user == null)
            {
                return HttpNotFound();
            }
            //BaseController.setUserId(id.Value);
            setUserId(id.Value);
            return RedirectToAction("Index");
        }
    }
}

        