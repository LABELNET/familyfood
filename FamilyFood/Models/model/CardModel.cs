using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FamilyFood.Models.model
{
    public class CardModel
    {
        private user_table u;
        private food f;
        private card c;

        public card C
        {
            get { return c; }
            set { c = value; }
        }

        public food F
        {
            get { return f; }
            set { f = value; }
        }

        public user_table U
        {
            get { return u; }
            set { u = value; }
        }


    }
}