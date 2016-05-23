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

            user_table user = checkUser();
            var data = from d in db.dapei
                       join u in db.user_table
                       on d.uid equals u.id
                       where d.fid == user.fid
                       orderby d.id descending
                       select new DapeiModel
                       {
                           D = d,
                           U = u
                       };
            List<DapeiModel> dapeis = data.ToList<DapeiModel>();
            ViewData["dapeis"] = dapeis;

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
        /// 添加食物搭配业务
        /// </summary>
        /// <param name="dp">搭配内容</param>
        /// <returns></returns>
        public ActionResult FoodDapeiPageAddRequest(String dp)
        {
            user_table u = checkUser();
            dapei d = new dapei();
            d.uid = u.id;
            d.fid = u.fid;
            d.dp = dp;
            db.dapei.AddObject(d);
            int row= db.SaveChanges();

            return Json(row, JsonRequestBehavior.AllowGet);
        }

     
        /// <summary>
        /// 食物搭配修改页面
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult FoodDapeiPageUpdate(int id)
        {
             dapei dd=db.dapei.SingleOrDefault<dapei>(d=>d.id==id);
             ViewData["dapei"] = dd;
            return View();
        }

        /// <summary>
        /// 食物搭配修改业务
        /// </summary>
        /// <param name="id">搭配id</param>
        /// <param name="dp">搭配内容</param>
        /// <returns></returns>
        public ActionResult FoodDapeiPageUpdateRequest(int id,String dp)
        {
            dapei dd = db.dapei.SingleOrDefault<dapei>(d => d.id == id);
            dd.dp = dp;
            db.SaveChanges();
            return Redirect("/food/FoodDapeiPage");
        }


        /// <summary>
        /// 食物搭配删除业务实现
        /// </summary>
        /// <param name="id">搭配Id</param>
        /// <returns></returns>
        public ActionResult FoodDapeiPageDeleteRequest(int id)
        {
            dapei dd = db.dapei.SingleOrDefault<dapei>(d => d.id == id);
            db.dapei.DeleteObject(dd);
            db.SaveChanges();
            return Redirect("/food/FoodDapeiPage");
        }

        /// <summary>
        /// 食物资料卡
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodIfoList(int? p)
        {
            if (p == null)
            {
                p = 1;
            }

            if (p < 1)
            {
                p = 1;
            }
            user_table user = checkUser();
            var cards = from c in db.card
                        join u in db.user_table
                        on c.uid equals u.id
                        join f in db.food
                        on c.fid equals f.id
                        where c.faid == user.fid
                        orderby c.id descending
                        select new CardModel
                        {
                            C = c,
                            U = u,
                            F = f
                        };
            
            int count = cards.Count<CardModel>();
            List<CardModel> cardsModels = cards.Skip((p.Value - 1)*pagesize).Take(pagesize).ToList<CardModel>();
            ViewData["cardsModels"] = cardsModels;
            ViewData["count"] = count;
            return View();
        }
        
        /// <summary>
        /// 添加食物资料卡
        /// </summary>
        /// <returns></returns>
        public ActionResult FoodIfoAdd()
        {
            user_table user=checkUser();
            //需要食物信息
            List<food> foods = (from f in db.food where f.fid == user.fid orderby f.id descending select f).ToList<food>();
            ViewData["foods"] = foods;
            return View();
        }


        /// <summary>
        /// 添加食物资料卡信息
        /// </summary>
        /// <param name="summary"></param>
        /// <param name="message"></param>
        /// <param name="description"></param>
        /// <param name="fid"></param>
        /// <returns></returns>
        public ActionResult FoodIfoAddRequest(String summary, String message, String description,int fid)
        {
            user_table us = checkUser();
            card c = new card();
            c.description = description;
            c.summary = summary;
            c.message = message;
            c.fid = fid;
            c.uid = us.id;
            c.faid = us.fid;
            db.card.AddObject(c);
            db.SaveChanges();
            return Redirect("/food/FoodIfoList");
        }

       /// <summary>
        /// 修改食物资料卡信息
       /// </summary>
       /// <param name="id"></param>
       /// <returns></returns>
        public ActionResult FoodIfoUpdate(int id)
        {
            user_table user = checkUser();
            //需要食物信息
            List<food> foods = (from f in db.food where f.fid == user.fid orderby f.id descending select f).ToList<food>();
            ViewData["foods"] = foods;
            //食物信息
            card ca=db.card.SingleOrDefault<card>(c=>c.id==id);
            ViewData["card"] = ca;

            return View();
        }

        /// <summary>
        /// 修改食物资料卡信息
        /// </summary>
        /// <param name="summary"></param>
        /// <param name="message"></param>
        /// <param name="description"></param>
        /// <param name="fid"></param>
        /// <param name="cid"></param>
        /// <returns></returns>
        public ActionResult FoodIfoUpdateRequest(String summary, String message, String description, int fid,int cid)
        {
            user_table us = checkUser();
            card c = db.card.SingleOrDefault<card>(ca => ca.id == cid);
            c.description = description;
            c.summary = summary;
            c.message = message;
            c.fid = fid;
            db.SaveChanges();
            return Redirect("/food/FoodIfoList");
        }


        /// <summary>
        /// 删除食物资料卡
        /// </summary>
        /// <param name="cid">资料卡id</param>
        /// <returns></returns>
        public ActionResult FoodIfoDeleteRequest(int cid) {
            card c = db.card.SingleOrDefault<card>(ca => ca.id == cid);
            db.DeleteObject(c);
            db.SaveChanges();
            return Redirect("/food/FoodIfoList");
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
