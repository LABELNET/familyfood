using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FamilyFood.Models;
using FamilyFood.Models.model;

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
            user_table user=checkUser();
            List<CateModel> cm = new List<CateModel>();

            //用户信息和分类信息
            var data = from c in db.cate
                       join u in db.user_table
                       on c.uid equals u.id
                       where c.fid == user.fid
                       orderby c.id descending
                       select new CateModel{ 
                         C=c,
                         U=u
                       };

            cm=data.ToList();
            ViewData["cates"] = cm;
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
        /// 添加分类请求
        /// </summary>
        /// <returns></returns>
        public ActionResult CateAddRequest(String content)
        {
            if(content.Length>0){
                user_table user = checkUser();
                cate ca = new cate();
                ca.catecontent = content;
                ca.uid = user.id;
                ca.fid = user.fid;
                db.cate.AddObject(ca);
                db.SaveChanges();
            }
            return Redirect("/home/catepage");
        }

           /// <summary>
            ///  修改分类页面
           /// </summary>
           /// <param name="id">分类id</param>
           /// <returns></returns>
        public ActionResult CateUpdate(int id)
        {
            cate ca=db.cate.SingleOrDefault<cate>(c=>c.id==id);
            ViewData["cate"] = ca;
            return View();
        }

        /// <summary>
        /// 修改分类业务实现
        /// </summary>
        /// <param name="id"></param>
        /// <param name="content"></param>
        /// <returns></returns>
        public ActionResult CateUpdateRequest(int id, String content)
        {
            if(content.Length>0){
                cate ca = db.cate.SingleOrDefault<cate>(c => c.id == id);
                ca.catecontent = content;
                db.SaveChanges();
            }
            return Redirect("/home/catepage");
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


        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult MessagePage()
        {

            user_table user = checkUser();
            //申请加入家庭的人
            List<FamilyFood.Models.user_table> users = (from u in db.user_table where u.fid == user.fid && u.status == 2 select u).ToList<FamilyFood.Models.user_table>();
            ViewData["users"] = users;

            //食物新鲜度显示
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
