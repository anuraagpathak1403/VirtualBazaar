using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar
{
    public partial class AdvertiserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    //if (Session["LoginName"] == null || Session["LoginName"].ToString() == string.Empty)
                    //{
                    //    Session["SessionExpire"] = true;
                    //    Response.Redirect("~/Default.aspx");
                    //}
                    //else
                    //{
                    //string LoginName = Convert.ToString(Session["LoginName"]);
                    // var AdvertiserID = Convert.ToInt32(Session["Advertiser"]);
                    //var UserID = Convert.ToInt32(Session["UserID"]);

                    int Id = Convert.ToInt32(Request.QueryString["Id"]);

                    hdnAdvertiser.Value = Id.ToString();

                    BindAdvertiserDetailsGrid(Id);
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
        public void BindAdvertiserDetailsGrid(int Id)
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
                             join Approval in Db.VideosApprovals on vid.AdvertiserID equals Approval.AdvertiserID

                             where vid.VideoID == Id && Approval.FileType == 1

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
                                 ApprovalVideoID = Approval.ApprovalID,
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

                DtlistAdvertisements.DataSource = Video;
                DtlistAdvertisements.DataBind();
            }
            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later.</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();
                int AdvertiserID = Convert.ToInt32(hdnAdvertiser.Value);

                AdvertiserRegisteration obj = Db.AdvertiserRegisterations.SingleOrDefault(x => x.AdvertiserID == AdvertiserID);
              
                obj.ApprovalStatus = Convert.ToInt32(ddlstatus.SelectedValue);

                Db.SaveChanges();

                int ApprovedStaus = AdvertiserID;

                if (ApprovedStaus > 0)
                {
                    string title = "Message from System";
                    string msg = "<p>Video is approoved and could be seen in main page.</p>";
                    string Url = "AdminHome.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 4000);", true);
                    return;
                }
            }

            catch (Exception ex)
            {
                string title = "Message from System";
                string msg = "<p>Unable to show details, Please try later</p>";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                return;
            }
        }

    }
}