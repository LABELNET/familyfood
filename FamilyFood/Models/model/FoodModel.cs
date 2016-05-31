using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FamilyFood.Models.model
{
 
    /// <summary>
    /// 包含用户信息、分类信息、食物信息
    /// </summary>
    public class FoodModel
    {
        private cate c;

        public cate C
        {
            get { return c; }
            set { c = value; }
        }

        private user_table u;

        public user_table U
        {
            get { return u; }
            set { u = value; }
        }

        private food f;

        public food F
        {
            get { return f; }
            set { f = value; }
        }

        private double eatCount;

        public double EatCount
        {
            get { return eatCount; }
            set { eatCount = value; }
        }

    
        

    }
}