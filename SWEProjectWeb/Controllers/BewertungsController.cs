using System;
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
    public class BewertungsController : BaseController
    {
        private SWEProjectModelContainer db = new SWEProjectModelContainer();

        // GET: Bewertungs
        public ActionResult Index()
        {
            return View(db.Bewertungen.ToList());
        }

        // GET: Bewertungs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bewertung bewertung = db.Bewertungen.Find(id);
            if (bewertung == null)
            {
                return HttpNotFound();
            }
            return View(bewertung);
        }

        // GET: Bewertungs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Bewertungs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Rating")] Bewertung bewertung)
        {
            if (ModelState.IsValid)
            {
                db.Bewertungen.Add(bewertung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(bewertung);
        }

        // GET: Bewertungs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bewertung bewertung = db.Bewertungen.Find(id);
            if (bewertung == null)
            {
                return HttpNotFound();
            }
            return View(bewertung);
        }

        // POST: Bewertungs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Rating")] Bewertung bewertung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bewertung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(bewertung);
        }

        // GET: Bewertungs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Bewertung bewertung = db.Bewertungen.Find(id);
            if (bewertung == null)
            {
                return HttpNotFound();
            }
            return View(bewertung);
        }

        // POST: Bewertungs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Bewertung bewertung = db.Bewertungen.Find(id);
            db.Bewertungen.Remove(bewertung);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
