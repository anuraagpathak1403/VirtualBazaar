using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    ddlYearAdd();
                    ChartType();
                    ddlMonthsAdd();


                    ddlAdvertiser.SelectedValue = Convert.ToString(Session["Advertiser"]);
                    int UserID = Convert.ToInt32(Session["UserID"]);
                    BindCategoryGrid(UserID);

                    BindAdvertiserID();
                    //}
                }
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
                    ddlyear.Items.Add(new ListItem("All", 0.ToString()));
                    ddlyear.Items.Add((currentYear + i).ToString());


                }
                else
                {
                    ddlyear.Items.Add((currentYear + i).ToString());


                }
            }
        }

        public void ddlMonthsAdd()
        {

            ddlMonths.Items.Clear();
            ddlMonths.Items.Add(new ListItem("All", 0.ToString()));


            for (int i = 1; i <= 12; i++)
            {
                DateTime date = new DateTime(1900, i, 1);
                ddlMonths.Items.Add(new ListItem(date.ToString("MMMM"), i.ToString()));

            }
        }

        public void ChartType()
        {

            ddl8.Items.Add("line");
            ddl8.Items.Add("bubble");
            ddl8.SelectedValue = "spline";
            ddl8.Items.Add("stepLine");
            ddl8.Items.Add("bar");
            ddl8.Items.Add("column");
            ddl8.Items.Add("stackedColumn");
            ddl8.Items.Add("stackedColumn100");
            ddl8.Items.Add("area");
            ddl8.Items.Add("splineArea");
            ddl8.Items.Add("stackedArea");
            ddl8.Items.Add("stackedArea100");
            //ddl8.SelectedValue = "column";


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
        public void BindCategoryGrid(int UserID)
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                var Video = (from vid in Db.AdvertiserVideos
                             join Adv in Db.AdvertiserRegisterations on vid.AdvertiserID equals Adv.AdvertiserID
                             join Catg in Db.AdvertiserCategories on Adv.Category equals Catg.CategoryID
                             join States in Db.States on Adv.StateID equals States.StateID
                             join Cty in Db.Cities on Adv.CityID equals Cty.CityID
                             join Loc in Db.Localities on Adv.LocalityID equals Loc.LocalityID
                             join use in Db.UserInfoes on Adv.AdvertiserID equals use.AdvertiserID
                             where use.UserID == UserID

                             let VisitorCount = (from Visitor in Db.VideoVisitors
                                                 where Visitor.VideoID == vid.VideoID
                                                 select Visitor).Count()
                             let CommentsCount = (from Comments in Db.VideoComments
                                                  where Comments.VideoID == vid.VideoID
                                                  select Comments).Count()

                             select new
                             {
                                 AdvertiserID = Adv.AdvertiserID,
                                 VideoID = vid.VideoID,
                                 OrgName = Adv.OrganisationName,
                                 AdvImage = "../" + Adv.Image,
                                 Category = Catg.Category,
                                 MobileNo = Adv.MobileNo,
                                 EmailID = Adv.EmailID,
                                 Address = Adv.Street + ", " + Adv.Landmark + ", " + Loc.LocalityName + ", " + Cty.CityName + ", " + States.StateName + ", India",
                                 Description = Adv.Description,
                                 ContactName = Adv.CustomerName,
                                 ContactEmail = Adv.CustomerEmailID,
                                 ContactMobileNo = Adv.CustomerMobileNum,
                                 veiwAllowed = Adv.ViewsAllowed,
                                 Views = VisitorCount,
                                 scheme = Adv.Scheme,
                                 Comments = CommentsCount
                             }).ToList();
                if (Video.Count > 0)
                {
                    DtlistAdvertisements.DataSource = Video;
                    DtlistAdvertisements.DataBind();
                }
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = false;
        }

    }
}