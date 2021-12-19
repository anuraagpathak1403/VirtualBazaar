using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar
{
    public partial class AdminHome1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    BindVideosCount();
                    ddlYearAdd();
                    ChartType();
                    ddlMonthsAdd();
                }
                ScriptManager.RegisterStartupScript(this,GetType(), "Javascript", "javascript:CreateChart(); ", true);
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to load page correctly, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }
        public void ddlYearAdd()
        {
            var currentYear = DateTime.Today.Year - 4;
            for (int i = 4; i >= 0; i--)
            {
                if (i == 4)
                {
                    ddlyear1.Items.Add(new ListItem("All", 0.ToString()));
                    ddlyear1.Items.Add((currentYear + i).ToString());


                }
                else
                {
                    ddlyear1.Items.Add((currentYear + i).ToString());

                }
            }
        }

        public void ddlMonthsAdd()
        {

            ddlMonths1.Items.Clear();
            ddlMonths1.Items.Add(new ListItem("All", 0.ToString()));


            for (int i = 1; i <= 12; i++)
            {
                DateTime date = new DateTime(1900, i, 1);
                ddlMonths1.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));

            }
        }

        public void ChartType()
        {

            ddl1.Items.Add("line");
            ddl1.Items.Add("bubble");
            ddl1.SelectedValue = "spline";
            ddl1.Items.Add("stepLine");
            ddl1.Items.Add("bar");
            ddl1.Items.Add("column");
            ddl1.Items.Add("stackedColumn");
            ddl1.Items.Add("stackedColumn100");
            ddl1.Items.Add("area");
            ddl1.Items.Add("splineArea");
            ddl1.Items.Add("stackedArea");
            ddl1.Items.Add("stackedArea100");
            //ddl8.SelectedValue = "column";


        }
        public void BindVideosCount()
        {
            BazaarModelContainer DB = new BazaarModelContainer();

            try
            {


                var Videos = (from Approval in DB.AdvertiserRegisterations
                              where Approval.ApprovalStatus == 1 
                              select Approval).Count();

                Lblvedios.Text = Videos.ToString();

                var Images = (from ImageApproval in DB.AdvertiserRegisterations
                              where ImageApproval.ApprovalStatus == 1 
                              select ImageApproval).Count();
                lblImage.Text = Images.ToString();
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind data into grid, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }
    }
}