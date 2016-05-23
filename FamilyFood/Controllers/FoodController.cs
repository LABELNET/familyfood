using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FamilyFood.Models;
using FamilyFood.Models.model;

namespace FamilyFood.Controllers
{
    public class FoodController : Controller
    {

        private FamilyFood.Models.FamilyFoodEntities db = new Models.FamilyFoodEntities();
        private int pagesize = 10;
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
        public ActionResult FoodListPage(int? p)
        {
            if (p == null) {
                p = 1;
            }

            if (p < 1) {
                p = 1;
            }

            user_table user = checkUser();
            var data = from f in db.food
                       join c in db.cate
                       on f.caid equals c.id
                       join u in db.user_table
                       on f.uid equals u.id
                       where f.fid==user.fid && f.status==0
                       orderby f.id descending
                       select new FoodModel
                       {
                           U=u,
                           C=c,
                           F=f
                       };
            int count=data.Count<FoodModel>();//总数
            List<FoodModel> foods = data.Skip((p.Value-1)*pagesize).Take(pagesize).ToList<FoodModel>();
            ViewData["foods"] = foods;
            ViewData["count"] = count;
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
        public ActionResult FoodUpdate(int id) {

            user_table user = checkUser();
            List<cate> cates = (from c in db.cate where c.fid == user.fid select c).ToList<cate>();
            ViewData["cates"] = cates;

            food fo=db.food.SingleOrDefault<food>(f => f.id == id);
            ViewData["food"] = fo;

            return View();
        }
        /// <summary>
        /// 修改食物信息业务
        /// </summary>
        /// <param name="id"></param>
        /// <param name="name"></param>
        /// <param name="kg"></param>
        /// <param name="cid"></param>
        /// <returns></returns>
        public ActionResult FoodUpdateRequest(int id,String name,double kg,int cid)
        {
            food fo = db.food.SingleOrDefault<food>(f => f.id == id);
            fo.name = name;
            fo.kg = kg;
            fo.caid = cid;
            db.SaveChanges();

            return Redirect("/food/foodlistpage?p=1");
        }

        /// <summary>
        /// 删除食物信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult FoodDeleteRequest(int id)
        {
            food fo = db.food.SingleOrDefault<food>(f => f.id == id);
            db.DeleteObject(fo);
            db.SaveChanges();

            return Redirect("/food/foodlistpage?p=1");
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
