using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FamilyFood.Models.model
{
    public class DapeiModel
    {
        private dapei d;

        private user_table u;

        public user_table U
        {
            get { return u; }
            set { u = value; }
        }


        public dapei D
        {
            get { return d; }
            set { d = value; }
        }

    }
}