using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.Master
{
    public partial class ExternalMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginName"] != null)
            {
                lblLoginName.Text = "Logout";
            }
            else
            {
                lblLoginName.Text = "Join Us";
            }
        }

        protected void lblLoginName_Click(object sender, EventArgs e)
        {
            if (lblLoginName.Text == "Join Us")
            {
                Response.Redirect("LoginMaster.aspx", false);
            }
            else
            {
                Session["UserID"] = null;
                Session["LoginName"] = null;
                Session["Advertiser"] = null;
                Response.Redirect("Default.aspx", false);
            }
            //}
        }
    }
}