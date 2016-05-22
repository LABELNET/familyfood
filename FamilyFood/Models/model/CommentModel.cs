using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FamilyFood.Models.model
{
    public class CommentModel
    {
        private FamilyFood.Models.comment c;

        public FamilyFood.Models.comment C
        {
            get { return c; }
            set { c = value; }
        }

        private FamilyFood.Models.user_table u;

        public FamilyFood.Models.user_table U
        {
            get { return u; }
            set { u = value; }
        }


    }
}