using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar
{
    public partial class ViewDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlYearAdd();
            }
            ddlMonthsAdd();
            ChartType();
            BindAdvertiserCategory();
            BindAdvertiserID();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "CreateChart();", true);
        }
        public void ddlYearAdd()
        {
            var currentYear = DateTime.Today.Year - 4;
            for (int i = 4; i >= 0; i--)
            {
                if (i == 4)
                {
                    ddlYear.Items.Add(new ListItem("All", 0.ToString()));
                    ddlYear.Items.Add((currentYear + i).ToString());

                    //ddlSchemeYear.Items.Add(new ListItem("All", 0.ToString()));
                    //ddlSchemeYear.Items.Add((currentYear + i).ToString());

                    //ddlBUDGETYear.Items.Add(new ListItem("All", 0.ToString()));
                    //ddlBUDGETYear.Items.Add((currentYear + i).ToString());

                    //ddlPriorityYear.Items.Add(new ListItem("All", 0.ToString()));
                    //ddlPriorityYear.Items.Add((currentYear + i).ToString());

                    //ddlSchememilstoneyear.Items.Add(new ListItem("All", 0.ToString()));
                    //ddlSchememilstoneyear.Items.Add((currentYear + i).ToString());

                    //ddlBudgetSchemeWiseYear.Items.Add(new ListItem("All", 0.ToString()));
                    //ddlBudgetSchemeWiseYear.Items.Add((currentYear + i).ToString());

                    //ddlBPMYear.Items.Add(new ListItem("All", 0.ToString()));
                    // ddlPendingRTIYear.Items.Add((currentYear + i).ToString());

                    //ddlIncidentYear.Items.Add(new ListItem("All", 0.ToString()));
                    //ddlIncidentYear.Items.Add((currentYear + i).ToString());

                    //ddlAssetsYear.Items.Add(new ListItem("All", 0.ToString()));
                    //ddlAssetsYear.Items.Add((currentYear + i).ToString());
                }
                else
                {
                    // ddlYear.Items.Add((currentYear + i).ToString());

                    //ddlPriorityYear.Items.Add((currentYear + i).ToString());

                    ////ddlBPMYear.Items.Add((currentYear + i).ToString());
                    //ddlIncidentYear.Items.Add((currentYear + i).ToString());
                    //ddlAssetsYear.Items.Add((currentYear + i).ToString());
                }
            }
        }
        public void ddlMonthsAdd()
        {

            ddlMonth.Items.Clear();
            ddlMonth.Items.Add(new ListItem("All", 0.ToString()));

            //ddlSchemeMonth.Items.Clear();
            // ddlSchemeMonth.Items.Add(new ListItem("--Select--", 0.ToString()));

            // ddlBUDGETMonth.Items.Clear();
            // ddlBUDGETMonth.Items.Add(new ListItem("--Select--", 0.ToString()));

            //ddlPriorityMonth.Items.Clear();
            //ddlPriorityMonth.Items.Add(new ListItem("--Select--", 0.ToString()));

            // ddlSchememilstonemonth.Items.Clear();
            // ddlSchememilstonemonth.Items.Add(new ListItem("--Select--", 0.ToString()));

            //  ddlPendingRTIMonth.Items.Clear();
            //  ddlPendingRTIMonth.Items.Add(new ListItem("--Select--", 0.ToString()));

            //ddlBPMMonths.Items.Clear();
            //ddlBPMMonths.Items.Add(new ListItem("--Select--", 0.ToString()));

            //ddlIncidentMonth.Items.Clear();
            //ddlIncidentMonth.Items.Add(new ListItem("--Select--", 0.ToString()));

            //ddlAssetsMonth.Items.Clear();
            //ddlAssetsMonth.Items.Add(new ListItem("--Select--", 0.ToString()));

            for (int i = 1; i <= 12; i++)
            {
                DateTime date = new DateTime(1900, i, 1);
                // ddlMonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                //  ddlSchemeMonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                // ddlBUDGETMonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                //ddlPriorityMonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                //  ddlSchememilstonemonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                // ddlPendingRTIMonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                // ddlBPMMonths.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                //ddlIncidentMonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
                //ddlAssetsMonth.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));
            }
        }
        public void ChartType()
        {
            //ddl1.Items.Add("line");
            //ddl1.Items.Add("bubble");
            //ddl1.Items.Add("spline");
            //ddl1.Items.Add("stepLine");
            //ddl1.Items.Add("bar");            
            //ddl1.Items.Add("column");
            //ddl1.Items.Add("stackedColumn");
            //ddl1.Items.Add("stackedColumn100");
            //ddl1.Items.Add("area");
            //ddl1.Items.Add("splineArea");
            //ddl1.Items.Add("stackedArea");
            //ddl1.Items.Add("stackedArea100");
            //ddl1.SelectedValue = "column";
            ddl2.Items.Add("pie");
            ddl2.Items.Add("line");
            // ddl2.Items.Add("bubble");
            ddl2.Items.Add("spline");
            ddl2.Items.Add("stepLine");
            ddl2.Items.Add("bar");
            ddl2.Items.Add("column");
            ddl2.Items.Add("stackedColumn");
            ddl2.Items.Add("stackedColumn100");
            ddl2.Items.Add("area");
            ddl2.Items.Add("splineArea");
            ddl2.Items.Add("stackedArea");
            // ddl2.Items.Add("stackedArea100");
            ddl2.SelectedValue = "spline";

            //ddl3.Items.Add("line");
            //ddl3.Items.Add("bubble");
            //ddl3.Items.Add("spline");
            //ddl3.Items.Add("stepLine");
            //ddl3.Items.Add("bar");
            //ddl3.Items.Add("column");
            //ddl3.Items.Add("stackedColumn");
            //ddl3.Items.Add("stackedColumn100");
            //ddl3.Items.Add("area");
            //ddl3.Items.Add("splineArea");
            //ddl3.Items.Add("stackedArea");
            //ddl3.Items.Add("stackedArea100");
            //ddl3.SelectedValue = "column";

            //ddl4.Items.Add("line");
            //ddl4.Items.Add("bubble");
            //ddl4.Items.Add("spline");
            //ddl4.Items.Add("stepLine");
            //ddl4.Items.Add("bar");
            //ddl4.Items.Add("column");
            //ddl4.Items.Add("stackedColumn");
            //ddl4.Items.Add("stackedColumn100");
            //ddl4.Items.Add("area");
            //ddl4.Items.Add("splineArea");
            //ddl4.Items.Add("stackedArea");
            //ddl4.Items.Add("stackedArea100");
            //ddl4.SelectedValue = "spline";

            //ddl5.Items.Add("line");
            //ddl5.Items.Add("bubble");
            //ddl5.Items.Add("spline");
            //ddl5.Items.Add("stepLine");
            //ddl5.Items.Add("bar");
            //ddl5.Items.Add("column");
            //ddl5.Items.Add("stackedColumn");
            //ddl5.Items.Add("stackedColumn100");
            //ddl5.Items.Add("area");
            //ddl5.Items.Add("splineArea");
            //ddl5.Items.Add("stackedArea");
            //ddl5.Items.Add("stackedArea100");
            //ddl5.SelectedValue = "column";

            //ddl6.Items.Add("line");
            //ddl6.Items.Add("bubble");
            //ddl6.Items.Add("spline");
            //ddl6.Items.Add("stepLine");
            //ddl6.Items.Add("bar");
            //ddl6.Items.Add("column");
            //ddl6.Items.Add("stackedColumn");
            //ddl6.Items.Add("stackedColumn100");
            //ddl6.Items.Add("area");
            //ddl6.Items.Add("splineArea");
            //ddl6.Items.Add("stackedArea");
            //ddl6.Items.Add("stackedArea100");
            //ddl6.SelectedValue = "splineArea";

            //ddl7.Items.Add("line");
            //ddl7.Items.Add("bubble");
            //ddl7.Items.Add("spline");
            //ddl7.Items.Add("stepLine");
            //ddl7.Items.Add("bar");
            //ddl7.Items.Add("column");
            //ddl7.Items.Add("stackedColumn");
            //ddl7.Items.Add("stackedColumn100");
            //ddl7.Items.Add("area");
            //ddl7.Items.Add("splineArea");
            //ddl7.Items.Add("stackedArea");
            //ddl7.Items.Add("stackedArea100");
            //ddl7.SelectedValue = "column";

            //ddl8.Items.Add("line");
            //ddl8.Items.Add("bubble");
            //ddl8.Items.Add("spline");
            //ddl8.Items.Add("stepLine");
            //ddl8.Items.Add("bar");
            //ddl8.Items.Add("column");
            //ddl8.Items.Add("stackedColumn");
            //ddl8.Items.Add("stackedColumn100");
            //ddl8.Items.Add("area");
            //ddl8.Items.Add("splineArea");
            //ddl8.Items.Add("stackedArea");
            //ddl8.Items.Add("stackedArea100");
            //ddl8.SelectedValue = "column";

            //ddl9.Items.Add("line");
            //ddl9.Items.Add("bubble");
            //ddl9.Items.Add("spline");
            //ddl9.Items.Add("stepLine");
            //ddl9.Items.Add("bar");
            //ddl9.Items.Add("column");
            //ddl9.Items.Add("stackedColumn");
            //ddl9.Items.Add("stackedColumn100");
            //ddl9.Items.Add("area");
            //ddl9.Items.Add("splineArea");
            //ddl9.Items.Add("stackedArea");
            //ddl9.Items.Add("stackedArea100");
            //ddl9.SelectedValue = "column";
        }
        public void BindAdvertiserCategory()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Catg = from Cat in Db.AdvertiserCategories
                           select Cat;

                List<AdvertiserCategory> oList = Catg.ToList();


                ddlCategory.DataSource = oList;
                ddlCategory.DataTextField = "Category";
                ddlCategory.DataValueField = "CategoryID";
                ddlCategory.DataBind();

                ddlCategory.Items.Insert(0, new ListItem("All", "0"));
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind advertiser category, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }
        public void BindAdvertiserID()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var AID = from AIDs in Db.AdvertiserRegisterations
                          select AIDs;
                List<AdvertiserRegisteration> oList = AID.ToList();



                ddlAdvertiser.DataSource = oList;
                ddlAdvertiser.DataTextField = "OrganisationName";
                ddlAdvertiser.DataValueField = "AdvertiserID";
                ddlAdvertiser.DataBind();

                ddlAdvertiser.Items.Insert(0, new ListItem("All", "0"));
            }
            catch (Exception)
            {
                string title = "Message from System";
                string msg = "<p>Unable to bind advertiser ID, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }
    }
}