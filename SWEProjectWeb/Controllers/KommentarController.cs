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
    public class KommentarController : Controller
    {
        private SWEProjectModelContainer db = new SWEProjectModelContainer();

        // GET: Kommentar
        public ActionResult Index()
        {
            var kommentars = db.Kommentars.Include(k => k.Projekt).Include(k => k.User);
            return View(kommentars.ToList());
        }

        // GET: Kommentar/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kommentar kommentar = db.Kommentars.Find(id);
            if (kommentar == null)
            {
                return HttpNotFound();
            }
            return View(kommentar);
        }

        // GET: Kommentar/Create
        public ActionResult Create()
        {
            ViewBag.ProjektId = new SelectList(db.Projekts, "Id", "Titel");
            ViewBag.UserUserId = new SelectList(db.Users, "UserId", "Name");
            return View();
        }

        // POST: Kommentar/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Inhalt,ProjektId,UserUserId")] Kommentar kommentar)
        {
            if (ModelState.IsValid)
            {
                db.Kommentars.Add(kommentar);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProjektId = new SelectList(db.Projekts, "Id", "Titel", kommentar.ProjektId);
            ViewBag.UserUserId = new SelectList(db.Users, "UserId", "Name", kommentar.UserUserId);
            return View(kommentar);
        }

        // GET: Kommentar/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kommentar kommentar = db.Kommentars.Find(id);
            if (kommentar == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProjektId = new SelectList(db.Projekts, "Id", "Titel", kommentar.ProjektId);
            ViewBag.UserUserId = new SelectList(db.Users, "UserId", "Name", kommentar.UserUserId);
            return View(kommentar);
        }

        // POST: Kommentar/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Inhalt,ProjektId,UserUserId")] Kommentar kommentar)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kommentar).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProjektId = new SelectList(db.Projekts, "Id", "Titel", kommentar.ProjektId);
            ViewBag.UserUserId = new SelectList(db.Users, "UserId", "Name", kommentar.UserUserId);
            return View(kommentar);
        }

        // GET: Kommentar/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Kommentar kommentar = db.Kommentars.Find(id);
            if (kommentar == null)
            {
                return HttpNotFound();
            }
            return View(kommentar);
        }

        // POST: Kommentar/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Kommentar kommentar = db.Kommentars.Find(id);
            db.Kommentars.Remove(kommentar);
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
