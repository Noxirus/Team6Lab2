using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
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
        protected void SlipRegister(int test)
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
                            cmd.Parameters.AddWithValue("@CustomerID", test);
                            connection.Open();
                            cmd.ExecuteNonQuery(); // INSERT statement
                            //customerID = (int)cmd.ExecuteScalar();
                        }
                    }
                Response.Redirect("YourSlips.aspx");
            
        }

        public int CurrentUser(string currentUser)
        {
            
            int result = -1;

            string connectionString = @"Data Source=localhost\sqlexpress;Initial Catalog=Marina;Integrated Security=True";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string insertStatement =
                    "SELECT ID " +
                    "FROM Customer " +
                    "WHERE FirstName = @CurrentUser";
                using (SqlCommand cmd = new SqlCommand(insertStatement, connection))
                {
                    cmd.Parameters.AddWithValue("@CurrentUser", currentUser);
                    connection.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader(CommandBehavior.SingleRow))
                    {
                        if (reader.Read()) // if there is data
                        {
                            result = Convert.ToInt32(reader["ID"]);
                        }

                    }
                }
                return result;
            }
        }
        protected void gvAvailableSlips_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
    bool loggedIn = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
    //Session["selectedId"] = gvAvailableSlips.SelectedValue;
    if (loggedIn)
    {

        string currentUser = Context.User.Identity.GetUserName();
            
            int Test = CurrentUser(currentUser);

            if (Test != -1)
                SlipRegister(Test);
                else { }
            }
            else
            {
                Response.Write("<script>alert('Please Log In First');</script>");
                Response.Redirect("Account/Login.aspx");
            }

        }
    }
}