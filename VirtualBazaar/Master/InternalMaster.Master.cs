using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.Master
{
    public partial class InternalMaster : System.Web.UI.MasterPage
    {
        PageClass PC = new PageClass();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Session["SessionExpire"] = true;
                Response.Redirect("~/Default.aspx", false);
                return;
            }

            if (!IsPostBack)
            {

                menu.InnerHtml = PC.RenderMenuPermissions(Convert.ToInt32(Session["UserID"]));



            }
        }

        protected void lnklogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        protected void lnkChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Change_Password.aspx");
        }
    }
}