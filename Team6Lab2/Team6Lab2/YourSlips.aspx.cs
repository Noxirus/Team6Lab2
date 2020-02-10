using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Team6Lab2
{
    public partial class YourSlips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool loggedIn = System.Web.HttpContext.Current.User.Identity.IsAuthenticated;
            if (!loggedIn)
            {
                Response.Redirect("~/Account/Login.aspx");
            }
        }
        public void Show_Lease(int ID)
        {

        }

        protected void gvCustomerLeases_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int selectedRowIndex = gvCustomerLeases.SelectedRow.RowIndex;

            //int slipID = gvCustomerLeases.SelectedRow.;


            //int selectedRowIndex = dgvPackages.SelectedCells[0].RowIndex;
            //DataGridViewRow selectedRow = dgvPackages.Rows[selectedRowIndex];
            //not nullable
            //selectedPackage.PackageID = Convert.ToInt32(selectedRow.Cells["PackageID"].Value);
        }
    }
}