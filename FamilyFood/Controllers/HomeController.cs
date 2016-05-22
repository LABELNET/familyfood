﻿using System;
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

        /// <summary>
        /// 主页
        /// </summary>
        /// <returns></returns>
        public ActionResult Index()
        {

            return View();
        }

        /// <summary>
        /// 关于页面
        /// </summary>
        /// <returns></returns>
        public ActionResult About()
        {

            return View();
        }

        /// <summary>
        /// 分类页面
        /// </summary>
        /// <returns></returns>
        public ActionResult CatePage()
        {

            return View();
        }

        /// <summary>
        /// 添加分类
        /// </summary>
        /// <returns></returns>
        public ActionResult CateAdd()
        {

            return View();
        }

        /// <summary>
        /// 购买建议-根据食物搭配
        /// </summary>
        /// <returns></returns>
        public ActionResult BuyAdviceByDaPei()
        {

            return View();
        }

        /// <summary>
        /// 购买建议-根据健康
        /// </summary>
        /// <returns></returns>
        public ActionResult BuyAdviceByHeath()
        {

            return View();
        }

        /// <summary>
        /// 消耗统计页面
        /// </summary>
        /// <returns></returns>
        public ActionResult EatChart()
        {

            return View();
        }

    }
}
