using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FamilyFood.Controllers
{
    public class HomeController : Controller

    {

       private FamilyFood.Models.FamilyFoodEntities db = new Models.FamilyFoodEntities();

        //
        // GET: /Home/

        public ActionResult Index()
        {

            return View();
        }

    }
}
