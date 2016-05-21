using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FamilyFood.Models;

namespace FamilyFood.Controllers
{
    public class UserController : Controller
    {


        private FamilyFood.Models.FamilyFoodEntities db = new Models.FamilyFoodEntities();

        //
        // GET: /User/

        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 用户登录页面
        /// </summary>
        /// <returns></returns>
        public ActionResult Login() {
            return View();
        }


        /// <summary>
        /// 用户注册页面
        /// </summary>
        /// <returns></returns>
        public ActionResult Register()
        {
            return View();
        }

        
        /// <summary>
        /// 用户登录请求
        /// </summary>
        /// <param name="phone">电话</param>
        /// <param name="pass">密码</param>
        /// <returns></returns>
        public ActionResult LoginRequest(String phone, String pass) { 
           user_table user= db.user_table.SingleOrDefault<user_table>(u=>u.phone==phone && u.pass==pass);
           if (user.id > 0)
           {
               Session["user"] = user;
               return Redirect("home/index");
           }
           else {
               return Redirect("user/register");
           }
        }
        



    }
}
