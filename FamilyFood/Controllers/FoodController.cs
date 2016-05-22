using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FamilyFood.Controllers
{
    public class FoodController : Controller
    {
        //
        // GET: /Food/

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 食物列表
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodListPage()
        {
            return View();
        }

        /// <summary>
        /// 添加食物信息
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodAdd() {
            return View();
        }


        /// <summary>
        /// 食物修改页面
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodUpdate() {
            return View();
        }

        /// <summary>
        /// 食物搭配列表页面
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodDapeiPage()
        {
            return View();
        }

        /// <summary>
        /// 食物搭配添加页面
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodDapeiPageAdd()
        {
            return View();
        }

        /// <summary>
        /// 食物资料卡
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodIfoList()
        {
            return View();
        }
        
        /// <summary>
        /// 添加食物资料卡
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodIfoAdd()
        {
            return View();
        }

    }
}
