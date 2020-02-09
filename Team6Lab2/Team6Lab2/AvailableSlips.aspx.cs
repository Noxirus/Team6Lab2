﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team6Lab2
{
    public partial class AvailableSlips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SlipRegister()
        {
            bool loggedIn = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            Session["selectedId"] = gvAvailableSlips.SelectedValue;
            if (loggedIn)
            {


                Response.Redirect("YourSlips.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void gvAvailableSlips_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}