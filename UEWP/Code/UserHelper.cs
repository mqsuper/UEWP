using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UEWP.Models;

namespace UEWP.Web.Code
{
    public class UserHelper
    {
        public static User CurrentUser
        {
            get
            {
                return new User();
            }

        }
    }
}