using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FamilyFood.Models;
using FamilyFood.Models.model;

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
            user.fid = 0;
            user.status = 1;
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
            checkUser();
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
            user_table u = checkUser();
            u = db.user_table.SingleOrDefault<user_table>(us => us.id == u.id);
            Session["user"] = u;
            return View();
        }

        /// <summary>
        /// 根据家庭id，申请加入家庭及其页面
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult FamilyIdPage(int id)
        {
            user_table u = checkUser();
            if (u.status != 1) {
                Redirect("/user/FamilyRequestStatus");//不是1的话，处于申请状态下，不需要提出申请操作
            }

            family fa = db.family.SingleOrDefault<family>(f => f.id == id);
            ViewData["family"] = fa;//家庭信息
            return View();
        }

        /// <summary>
        /// 申请加入家庭请求
        /// </summary>
        /// <param name="id">家庭id</param>
        /// <returns></returns>
        public ActionResult FamilyIdPageRequest(int id) {

            user_table ut = checkUser();
            ut= db.user_table.SingleOrDefault<user_table>(u => u.id == ut.id);
            ut.fid = id;
            ut.status = 2;//已申请，等待审核
            db.SaveChanges();
            Session["user"] = ut;
            return Redirect("/user/FamilyRequestStatus");
        }

        /// <summary>
        /// 确认加入家庭
        /// </summary>
        /// <param name="id">用户id</param>
        /// <returns></returns>
        public ActionResult FamilyIdSureRequest(int id)
        {
             user_table ut = db.user_table.SingleOrDefault<user_table>(u => u.id == id);
             ut.status =0;//确认加入
             db.SaveChanges();
             return Redirect("/home/messagePage");
        }

        /// <summary>
        /// 拒绝加入家庭
        /// </summary>
        /// <param name="id">用户id</param>
        /// <returns></returns>
        public ActionResult FamilyIdCancelRequest(int id)
        {
            user_table ut = db.user_table.SingleOrDefault<user_table>(u => u.id == id);
            ut.status = 3;//拒绝加入
            db.SaveChanges();
            return Redirect("/home/messagePage");
        }

        /// <summary>
        /// 删除申请
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult FamilyIdDeleteRequest(int id)
        {
            user_table ut = db.user_table.SingleOrDefault<user_table>(u => u.id == id);
            ut.status = 1;//不加入操作
            db.SaveChanges();
            Session["user"] = ut;
            return Redirect("/user/FamilyRequestStatus");
        }

        /// <summary>
        /// 重新申请
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult FamilyIdZaiRequest(int id)
        {
            user_table ut = db.user_table.SingleOrDefault<user_table>(u => u.id == id);
            ut.status = 2;//重新申请
            db.SaveChanges();
            Session["user"] = ut;
            return Redirect("/user/FamilyRequestStatus");
        }



        /// <summary>
        /// 家庭主页
        /// 1.家庭信息
        /// 2.家庭成员信息
        /// 3.留言列表
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyPage()
        {
            user_table user = checkUser();
            family fa = db.family.SingleOrDefault<family>(f => f.id == user.fid);
            ViewData["family"] = fa;//家庭信息
            List<user_table> users=(from u in db.user_table where u.fid==fa.id && u.status==0 select u).ToList<user_table>();
            ViewData["users"] = users;//家庭成员信息
            List<comment> comments = (from c in db.comment where c.fid == fa.id orderby c.id descending select c).ToList<comment>();
            List<CommentModel> modes=new List<CommentModel>();

            foreach(comment cs in comments){
                CommentModel model = new CommentModel();
                model.C = cs;
                user_table ut=db.user_table.SingleOrDefault<user_table>(u => u.id == cs.uid);
                model.U = ut;
                modes.Add(model);
            }

            ViewData["modes"] = modes;//留言信息

            return View();
        }

        /// <summary>
        /// 留言请求提交
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyPageRequest(String content) {
            user_table u = checkUser();
            comment c = new comment();
            c.uid = u.id;
            c.fid = u.fid;
            c.comment1 = content;
            db.comment.AddObject(c);
            db.SaveChanges();

            return Redirect("/user/FamilyPage");
        }

        /// <summary>
        /// 家庭成员列表
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyMembers()
        {

            user_table user = checkUser();
            List<user_table> users = (from u in db.user_table where u.fid == user.fid && u.status==0 select u).ToList<user_table>();
            ViewData["users"] = users;//家庭成员列表
            return View();
        }

        /// <summary>
        /// 家庭信息修改
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyIfoUpdate()
        {
            user_table user = checkUser();
            family f = db.family.SingleOrDefault<family>(fa => fa.id == user.fid);
            ViewData["family"] = f;
            return View();
        }

        /// <summary>
        /// 修改家庭信息请求
        /// </summary>
        /// <returns></returns>
        public ActionResult FamilyIfoUpdateRequest(String name, String signature, String description)
        {
            user_table user = checkUser();
            family f = db.family.SingleOrDefault<family>(fa => fa.id == user.fid);
            if (name.Length > 0) {
                f.name = name;
            }

            if (signature.Length > 0) {
                f.signature = signature;
            }

            if (description.Length > 0) {
                f.description = description;
            }

            db.SaveChanges();

            return Redirect("/user/FamilyPage");
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
            user = db.user_table.SingleOrDefault<user_table>(u => u.id == user.id);
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
