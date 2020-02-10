using System;
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
            if (loggedIn)
                {
                    string connectionString = @"Data Source=localhost\sqlexpress;Initial Catalog=Marina;Integrated Security=True";
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string insertStatement =
                            "INSERT INTO Lease(SlipID, CustomerID) " +
                            "VALUES(@SlipID, @CustomerID)";
                        using (SqlCommand cmd = new SqlCommand(insertStatement, connection))
                        {
                            cmd.Parameters.AddWithValue("@SlipID", gvAvailableSlips.SelectedValue);
                            cmd.Parameters.AddWithValue("@CustomerID", "1");
                            connection.Open();
                            cmd.ExecuteNonQuery(); // INSERT statement
                            //customerID = (int)cmd.ExecuteScalar();
                        }
                    }
                Response.Redirect("YourSlips.aspx");
            }
            else
            {
                Response.Write("<script>alert('Please Log In First');</script>");
                Response.Redirect("~/Account/Login.aspx");
            }
        }
        protected void gvAvailableSlips_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SlipRegister();
        }
    }
}