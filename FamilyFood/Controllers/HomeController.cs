using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FamilyFood.Models;
using FamilyFood.Models.model;
using System.Data.Objects;
using System.Data.Objects.SqlClient;

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
            //食物统计
            user_table user = checkUser();
            if (user != null)
            {
                //查询家庭总食物
                var query = (from f in db.food where f.fid == user.fid select f.kg).Sum();
                if (query != null)
                {
                    ViewData["AllFoodCount"] = query.Value;
                }
                else
                {
                    ViewData["AllFoodCount"] = 0;
                }

                // 消耗的家庭总食物
                var queryEat = (from c in db.consume where c.faid == user.fid select c.kg).Sum();
                if (queryEat != null)
                {
                    ViewData["AllEatCount"] = queryEat.Value;
                }
                else
                {
                    ViewData["AllEatCount"] = 0.0;
                }

                // 剩余的家庭食物总量
                var querySheng = (from f in db.food where f.fid == user.fid && f.status == 0 select f.kg).Sum();
                if (querySheng != null)
                {
                    ViewData["AllShengCount"] = querySheng.Value;
                }
                else
                {
                    ViewData["AllShengCount"] = 0.0;
                }
                // 丢弃的食物总量
                var queryDiu = (from f in db.food where f.fid == user.fid && f.status == 1 select f.kg).Sum();
                if (queryDiu != null)
                {
                    ViewData["AllDiuCount"] = queryDiu.Value;
                }
                else
                {
                    ViewData["AllDiuCount"] = 0.0;
                }

                //不新鲜食物
                List<FamilyFood.Models.food> foods = db.food.Where(f => System.Data.Objects.SqlClient.SqlFunctions.DateDiff("week", f.dt, DateTime.Now) > 0 && f.fid == user.fid && f.status == 0).OrderByDescending(f => f.dt).Select(f => f).ToList<FamilyFood.Models.food>();
                if (foods != null)
                {
                    ViewData["NoFrashFood"] = foods;
                }
                else
                {
                    ViewData["NoFrashFood"] = new List<food>();
                }

                //购买建议
                List<dapei> ds = db.dapei.Where(da => da.fid == user.fid).Select(f => f).ToList<dapei>();
                List<string> cards = getTuiModel(ds);
                ViewData["cards"] = cards;

                //食物列表
                List<food> eatFoods = db.food.Where(f => f.status == 0 && f.fid == user.fid).OrderByDescending(f=>f.id).Select(f => f).ToList<food>();
                ViewData["eatFoods"] = eatFoods;

                //今天吃的食物列表
                List<consume> nowEatFoods = db.consume.Where(c => SqlFunctions.DateDiff("day", c.dt, DateTime.Now) == 0 && c.faid == user.fid).Select(c => c).ToList<consume>();
                List<food> eatNowFood = new List<food>();
                foreach (consume cs in nowEatFoods) {
                    food f = db.food.SingleOrDefault(fo=>fo.id==cs.fid);
                    if (f.status == 0) 
                    {
                        f.kg = cs.kg.Value;
                        eatNowFood.Add(f);
                    }
                }
                ViewData["eatNowFood"] = eatNowFood;
            }
            else {

                return Redirect("/user/login");

            }
           


            return View();
        }

        /// <summary>
        /// 提交今天吃的食物
        /// </summary>
        /// <param name="id"></param>
        /// <param name="kg"></param>
        /// <returns></returns>
        public ActionResult indexPageRequest(int id, Double kg) 
        {
            user_table user=checkUser();
            var food = db.food.SingleOrDefault(f => f.id == id);
            var eatCount = db.consume.Where(c => c.fid == id).Select(c => c.kg).Sum();
            if (eatCount != null)
            {
                if (eatCount.Value >= food.kg)
                {
                    food.status = 2;
                    db.SaveChanges();
                }
                else
                {
                    if (kg < food.kg - eatCount.Value)
                    {
                        //执行
                        consume con = new consume();
                        con.kg = kg;
                        con.uid = user.id;
                        con.fid = food.id;
                        con.faid = user.fid;
                        con.dt = DateTime.Now;
                        db.consume.AddObject(con);
                        db.SaveChanges();
                    }
                }
            }
            else {
                //执行
                consume con = new consume();
                con.kg = kg;
                con.uid = user.id;
                con.fid = food.id;
                con.faid = user.fid;
                con.dt = DateTime.Now;
                db.consume.AddObject(con);
                db.SaveChanges();
            }

            return Redirect("/home/index");
        }

        /// <summary>
        /// 得到建议购买的食物名称
        /// </summary>
        /// <param name="ds"></param>
        /// <returns></returns>
        public  List<string>  getTuiModel(List<dapei> ds)
        {
            user_table user = checkUser();
            List<string> foodNames = new List<string>();
            foreach (dapei d in ds)
            {
                string str = d.dp;
                str = str.Substring(1, str.Length - 2);
                string[] ar = str.Split(',');
                foreach (string s in ar)
                {
                    if (foodNames.Contains(s))
                    {
                        continue;
                    }
                    else
                    {
                        //目前食物不存在和吃完了
                        var query = from f in db.food where f.name == s && f.status == 0 select f;
                        if (query.Count<food>() == 0)
                        {
                            foodNames.Add(s);
                        }
                    }
                }
            }
            return foodNames;
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
        /// 删除分类请求
        /// </summary>
        /// <param name="id">分类id</param>
        /// <returns></returns>
        public ActionResult CateDeleteRequest(int id)
        {
                cate ca = db.cate.SingleOrDefault<cate>(c => c.id == id);
                db.cate.DeleteObject(ca);
                db.SaveChanges();
            return Redirect("/home/catepage");
        }


        /// <summary>
        /// 购买建议-根据食物搭配
        /// </summary>
        /// <returns></returns>
        public ActionResult BuyAdviceByDaPei()
        {
            user_table user=checkUser();
            List<dapei> ds = db.dapei.Where(da => da.fid == user.fid).Select(f => f).ToList<dapei>();
            List<CardModel> cards = getModel(ds);
            ViewData["cards"] = cards;
            return View();
        }

        /// <summary>
        /// 解析推荐食物
        /// </summary>
        /// <param name="d">食物搭配对象</param>
        /// <returns></returns>
        public List<CardModel> getModel(List<dapei> ds) 
        {
             List<CardModel> cardsModels=new List<CardModel>();
             user_table user=checkUser();
             List<string> foodNames = new List<string>();
             foreach (dapei d in ds)
             {
                  string str = d.dp;
                 str = str.Substring(1,str.Length-2);
                 string[] ar = str.Split(',');
                 foreach (string s in ar)
                 {
                    if(foodNames.Contains(s)){
                      continue;
                    }else{
                        //目前食物不存在和吃完了
                        var query = from f in db.food where f.name == s && f.status == 0 select f;
                        if (query.Count<food>() == 0)
                        {
                            foodNames.Add(s);
                        }
                    }
                 }
             }
              foreach(string s in foodNames){
                  var cards = from c in db.card
                              join u in db.user_table
                              on c.uid equals u.id
                              join f in db.food
                              on c.fid equals f.id
                              where c.faid == user.fid
                              && f.name==s
                              orderby c.id descending
                              select new CardModel
                              {
                                  C = c,
                                  U = u,
                                  F = f
                              };

                 if (cards != null)
                 {
                     int count = cards.Count<CardModel>();
                     if (count > 0)
                     {
                         cardsModels.AddRange(cards.ToList<CardModel>());
                     }
                     else
                     {
                         CardModel cm = new CardModel();
                         food f = new food();
                         card c=new card();
                         f.name = s;
                         c.description = "暂时没有信息，记得添加";
                         c.message = "暂时没有信息，记得添加";
                         c.summary = "暂时没有信息，记得添加";
                         cm.F = f;
                         cm.C = c;
                         cardsModels.Add(cm);
                     }
                 }else{
                     CardModel cm = new CardModel();
                     food f = new food();
                     card c = new card();
                     f.name = s;
                     c.description = "暂时没有信息，记得添加";
                     c.message = "暂时没有信息，记得添加";
                     c.summary = "暂时没有信息，记得添加";
                     cm.F = f;
                     cm.C = c;
                     cardsModels.Add(cm);
                 
                 }
             }
             return cardsModels;
        }

        /// <summary>
        /// 消耗统计页面
        /// </summary>
        /// <returns></returns>
        public ActionResult EatChart()
        {
            user_table user=checkUser();
            //查询家庭总食物
            var query = (from f in db.food where f.fid == user.fid select f.kg).Sum();
            if (query != null)
            {
                ViewData["AllFoodCount"] = query.Value;
            }
            else {
                ViewData["AllFoodCount"] = 0;
            }

            // 消耗的家庭总食物
            var queryEat = (from c in db.consume where c.faid == user.fid select c.kg).Sum(); 
            if (queryEat != null)
            {
                ViewData["AllEatCount"] = queryEat.Value;
            }
            else {
                ViewData["AllEatCount"] = 0.0;
            }

            // 剩余的家庭食物总量
            var querySheng = (from f in db.food where f.fid == user.fid && f.status==0 select f.kg).Sum();
            if (querySheng != null)
            {
                ViewData["AllShengCount"] = querySheng.Value;
            }
            else
            {
                ViewData["AllShengCount"] = 0.0;
            }
            // 丢弃的食物总量
            var queryDiu = (from f in db.food where f.fid == user.fid && f.status == 1 select f.kg).Sum();
            if (queryDiu != null)
            {
                ViewData["AllDiuCount"] = queryDiu.Value;
            }
            else
            {
                ViewData["AllDiuCount"] = 0.0;
            }
           
            //今天的食物总量
            var queryNow = db.food.Where(f => SqlFunctions.DateDiff("Day", f.dt, DateTime.Now) == 0 && f.fid == user.fid).Select(f => f.kg).Sum();
            if (queryNow != null)
            {
                ViewData["nowCount"] = queryNow.Value;
            }
            else {
                ViewData["nowCount"] = 0.0;
            }

            //近3天添加的食物总量
            var queryThree = db.food.Where(f => SqlFunctions.DateDiff("Day", f.dt, DateTime.Now) <= 3 && f.fid == user.fid).Select(f => f.kg).Sum();
            if (queryThree != null)
            {
                ViewData["threeCount"] = queryThree.Value;
            }
            else {
                ViewData["threeCount"] = 0.0;
            }

            //近一周添加的食物总量
            var queryWeek = db.food.Where(f => SqlFunctions.DateDiff("week", f.dt, DateTime.Now) == 0 && f.fid == user.fid).Select(f => f.kg).Sum();
            if (queryWeek != null)
            {
                ViewData["weekCount"] = queryWeek.Value;
            }
            else
            {
                ViewData["weekCount"] = 0.0;
            }

            //近一个月的食物总量
            var queryMonth = db.food.Where(f => SqlFunctions.DateDiff("month", f.dt, DateTime.Now) == 0 && f.fid == user.fid).Select(f => f.kg).Sum();
            if (queryMonth != null)
            {
                ViewData["monthCount"] = queryMonth.Value;
            }
            else
            {
                ViewData["monthCount"] = 0.0;
            }

            //近一年的食物总量
            var queryYear = db.food.Where(f => SqlFunctions.DateDiff("year", f.dt, DateTime.Now) == 0 && f.fid == user.fid).Select(f => f.kg).Sum();
            if (queryYear != null)
            {
                ViewData["yearCount"] = queryYear.Value;
            }
            else
            {
                ViewData["yearCount"] = 0.0;
            }


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

            //不新鲜食物
            List<FamilyFood.Models.food> foods = db.food.Where(f => System.Data.Objects.SqlClient.SqlFunctions.DateDiff("week", f.dt, DateTime.Now) > 0 && f.fid == user.fid && f.status==0).Select(f => f).ToList<FamilyFood.Models.food>();
            ViewData["foods"] = foods;
   

            //食物新鲜度显示
            return View();
        }

        /// <summary>
        /// 吃完不新鲜食物
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult MessageEatAll(int id)
        {
            user_table user = checkUser();
            food fo= db.food.SingleOrDefault(f => f.id == id);
            fo.status = 2; //吃完状态修改为2
            consume c = new consume();
            c.dt = DateTime.Now;
            c.faid = user.fid;
            c.fid = id;
            c.uid = user.id;
            c.kg = fo.kg;
            db.consume.AddObject(c);
            db.SaveChanges();

            return Redirect("/home/MessagePage");
        }

        /// <summary>
        /// 丢弃不新鲜食物
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult MessageDiuqi(int id)
        {
            food fo = db.food.SingleOrDefault(f => f.id == id);
            fo.status = 1;
            db.SaveChanges();
            return Redirect("/home/MessagePage");
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
