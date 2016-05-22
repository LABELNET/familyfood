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
            user_table user = (user_table)Session["user"];
            if (user == null) {
                Response.Redirect("/user/login");
            }

            ucard uca=db.ucard.SingleOrDefault<ucard>(uc => uc.uid == user.id);
            if (uca == null) {
                uca = new ucard();
                uca.uid = user.id;
                db.ucard.AddObject(uca);
                db.SaveChanges();
            }
            ViewData["ucard"] = uca;
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
           if (user != null)
           {
               if (user.id > 0)
               {
                   Session["user"] = user;
                   return Redirect("../home/index");
               }
               else
               {
                   return Redirect("/user/register");
               }
           }
           else {
               return Redirect("/user/register");
           }
        }



        
        /// <summary>
        /// 用户注册请求
        /// </summary>
        /// <param name="phone"></param>
        /// <param name="pass"></param>
        /// <param name="nick"></param>
        /// <returns></returns>
        public ActionResult RegisterRequest(String phone, String pass,String nick)
        {
            user_table user = new user_table();
            user.nick = nick;
            user.phone = phone;
            user.pass = pass;
            db.user_table.AddObject(user);
            int result= db.SaveChanges();
            if (result > 0)
            {
                return Redirect("/user/login");
            }
            else
            {
                return Redirect("/user/register");
            }

        }

        /// <summary>
        /// 登出
        /// </summary>
        /// <returns></returns>
        public ActionResult Layout() {
            Session.Abandon();
            return Redirect("/user/login");
        }

        /// <summary>
        /// 添加和创建家庭页面
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyAdd() {
            return View();
        }

        /// <summary>
        /// 创建家庭页面
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyCreate()
        {
            return View();
        }

        /// <summary>
        /// 创建家庭请求
        /// </summary>
        /// <param name="name"></param>
        /// <param name="description"></param>
        /// <param name="signature"></param>
        /// <returns></returns>
        public ActionResult FamilyCreateRequest(String name, String description, String signature)
        {

            if (Session["user"] == null)
            {
                 Response.Redirect("/user/login");
            }
                   
            //1.添加家庭信息
            family f = new family();
            f.description = description;
            f.name = name;
            f.signature = signature;
            db.family.AddObject(f);
            int result=db.SaveChanges();
            if (result > 0)
            {
                //成功 //2.修改用户状态
               
                    user_table user = (user_table)Session["user"];
                    user = db.user_table.SingleOrDefault<user_table>(u=>u.id==user.id);
                    user.fid=f.id;
                    user.status = 0;  //创建家庭不用申请，直接修改为0
                    int row=db.SaveChanges();
                    if (row > 0)
                    {
                        Session["user"] = user;
                        Response.Redirect("/user/FamilyRequestStatus");
                    }
                    else 
                    {
                        Response.Redirect("/user/error");
                    }
            }
            else {
                Response.Redirect("/user/error");
            }
           
            return View();
        }

        /// <summary>
        /// 创建家庭成功页面，显示申请状态
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyRequestStatus()
        {
            return View();
        }

        /// <summary>
        /// 家庭主页
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyPage()
        {
            return View();
        }

        /// <summary>
        /// 家庭成员列表
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyMembers()
        {
            return View();
        }

        /// <summary>
        /// 家庭信息修改
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyIfoUpdate()
        {
            return View();
        }

        /// <summary>
        /// 错误页面
        /// </summary>
        /// <returns></returns>
        public ActionResult error()
        {
            return View();
        }

        /// <summary>
        /// 用户编辑资料
        /// </summary>
        /// <returns></returns>
        public ActionResult UpdateUserIfo()
        {
            return View();
        }

        /// <summary>
        /// 修改用户信息业务
        /// </summary>
        /// <returns></returns>
        public ActionResult UpdateUserRequest(String nick, String heath, int gendre)
        {
            user_table user= checkUser();
            user = db.user_table.SingleOrDefault<user_table>(u => user.id == user.id);
            if (nick.Length > 0) {
                user.nick = nick;
            }

            if (heath.Length > 0) {
                user.heath = heath;
            }

            if (user.sex!=gendre)
            {
                user.sex = gendre;
            }
            int result=db.SaveChanges();
            if (result > 0) {
                Session["user"] = user;
                Response.Redirect("/user/index");
            }
            return View();
        }
        

        /// <summary>
        /// 用户编辑爱好
        /// </summary>
        /// <returns></returns>
        public ActionResult UpdateUserCard()
        {
            user_table user = checkUser();
            ucard uca=db.ucard.SingleOrDefault<ucard>(uc=>uc.uid==user.id);
            ViewData["ucard"] = uca;
            return View();
        }

        /// <summary>
        /// 用户爱好请求
        /// </summary>
        /// <returns></returns>
        public ActionResult UpdateUserCardRequest(int id,String taste, String fruit, String vegetables, String dishes)
        {
            if (id > 0)
            {
                ucard uc=db.ucard.SingleOrDefault<ucard>(u => u.id == id);

                if (taste.Length > 0)
                {
                    uc.taste = taste;
                }

                if (fruit.Length > 0) {
                    uc.fruit = fruit;
                }

                if (vegetables.Length > 0) {
                    uc.vegetables = vegetables;
                }

                if (dishes.Length > 0) {
                    uc.dishes = dishes;
                }

                int row=  db.SaveChanges();
                if (row > 0) {
                    Response.Redirect("/user/index");
                }
            }

            return View();
        }  


        /// <summary>
        /// 检查用户是否还在登录状态
        /// </summary>
        /// <returns></returns>
        public user_table checkUser() {
            if (Session["user"] == null)
            {
                Response.Redirect("/user/login");
            }
            return (user_table)Session["user"];
        }

    }
}
