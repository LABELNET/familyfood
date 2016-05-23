using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FamilyFood.Models;

namespace FamilyFood.Controllers
{
    public class FoodController : Controller
    {

        private FamilyFood.Models.FamilyFoodEntities db = new Models.FamilyFoodEntities();
        //
        // GET: /Food/

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 食物列表
        /// </summary>
        /// <returns>食物信息、分类信息、用户信息</returns>
        public ActionResult FoodListPage()
        {

            return View();
        }

        /// <summary>
        /// 添加食物信息
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodAdd() {
            //获取分类
            user_table user = checkUser();
            List<cate> cates = (from c in db.cate where c.fid == user.fid select c).ToList<cate>();
            ViewData["cates"] = cates;

            return View();
        }

        /// <summary>
        /// 添加食物请求
        /// </summary>
        /// <param name="cid">分类id</param>
        /// <param name="kg">重量</param>
        /// <param name="name">食物名称</param>
        /// <returns></returns>
        public ActionResult FoodAddRequest(int cid,double kg,String name) {

            user_table user = checkUser();
            //string dt = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"); 
            // DateTime.ParseExact(dateTimeString, "yyyy-MM-dd HH:mm:ss")
            if (name.Length > 0) {
                food f = new food();
                f.caid = cid;
                f.name = name;
                f.kg = kg;
                f.dt = DateTime.Now;
                f.uid = user.id;
                f.fid = user.fid;
                f.status = 0;
                db.food.AddObject(f);
                db.SaveChanges();
            }
            return Redirect("/food/FoodListPage");
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


        /// <summary>
        /// 检查用户是否还在登录状态
        /// </summary>
        /// <returns></returns>
        public user_table checkUser()
        {
            if (Session["user"] == null)
            {
                Response.Redirect("/user/login");
            }
            return (user_table)Session["user"];
        }

    }
}
