using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.MasterPage
{
    public partial class Renewsubscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    if (Session["LoginName"] == null || Session["LoginName"].ToString() == string.Empty)
                    {
                        Session["SessionExpire"] = true;
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        string LoginName = Convert.ToString(Session["LoginName"]);
                        //var AdvertiserID = Convert.ToInt32(Session["Advertiser"]);
                        //var UserID = Convert.ToInt32(Session["UserID"]);
                        BindCategoryGrid(LoginName);
                    }
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
        public void BindCategoryGrid(string LoginName)
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
                             where use.UserName == LoginName

                             let VisitorCount = (from Visitor in Db.VideoVisitors
                                                 where Visitor.VideoID == vid.VideoID
                                                 select Visitor).Count()
                             let CommentsCount = (from Comments in Db.VideoComments
                                                  where Comments.VideoID == vid.VideoID
                                                  select Comments).Count()

                             select new
                             {
                                 AdvertiserID=Adv.AdvertiserID,
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
                                 veiwAllowed=Adv.ViewsAllowed,
                                 Views = VisitorCount,
                                 scheme=Adv.Scheme,
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            DivPlans.Visible = true;
            DivEntry.Visible = false;
        }

        protected void btnBuySilver_Click(object sender, EventArgs e)
        {
            try
            {
                var AdvertiserID = Convert.ToInt32(Session["Advertiser"]);
            DivEntry.Visible = true;           
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Silver";
            SchemeChange(AdvertiserID);
         
            }
            catch (Exception)
            {

            }
        }

        protected void btnBuyGold_Click(object sender, EventArgs e)
        {
            var AdvertiserID = Convert.ToInt32(Session["Advertiser"]);
            DivEntry.Visible = true;          
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Gold";
            SchemeChange(AdvertiserID);
        }

        protected void btnBuyDiamond_Click(object sender, EventArgs e)
        {
            var AdvertiserID = Convert.ToInt32(Session["Advertiser"]);
            DivEntry.Visible = true;         
            DivPlans.Visible = false;
            SchemeDiv.Visible = true;
            txtPlan.Text = "Diamond";
            SchemeChange(AdvertiserID);
        }

        public void SchemeChange(int AdvertiserID)
        {
            try
            {
                
                BazaarModelContainer Db = new BazaarModelContainer();
                
              
                AdvertiserRegisteration obj = Db.AdvertiserRegisterations.SingleOrDefault(x => x.AdvertiserID == AdvertiserID);
                if (txtPlan.Text == "Silver")
                {
                    var ViewAllowed = 100;
                    obj.Scheme = txtPlan.Text;
                    obj.ViewsAllowed = ViewAllowed + obj.ViewsAllowed;
                }
                else if (txtPlan.Text == "Gold")
                {
                    var ViewAllowed = 250;
                    obj.Scheme = txtPlan.Text;
                    obj.ViewsAllowed = ViewAllowed + obj.ViewsAllowed;
                }
                else if (txtPlan.Text == "Diamond")
                {
                    var ViewAllowed = 500;
                    obj.Scheme = txtPlan.Text;
                    obj.ViewsAllowed = ViewAllowed + obj.ViewsAllowed;
                }
                obj.OrganisationName = obj.OrganisationName;
                obj.Category = obj.Category;
                obj.Street = obj.Street;
                obj.Landmark = obj.Landmark;
                obj.LocalityID = obj.LocalityID;
                obj.CityID = obj.CityID;
                obj.StateID = obj.StateID;
                obj.Country = "India";
                obj.EmailID = obj.EmailID;
                obj.MobileNo = obj.MobileNo;
                obj.Website = obj.Website;
                obj.Description = obj.Description;
                obj.RegisterDate = obj.RegisterDate;
                obj.Keyword = obj.Keyword;
                obj.CustomerName = obj.CustomerName;
                obj.CustomerMobileNum = obj.CustomerMobileNum;
                obj.CustomerEmailID = obj.CustomerEmailID;
              
                Db.SaveChanges();
                string title = "Message from System";
                string msg = "Renews details Updated sucessfully:";
                ScriptManager.RegisterStartupScript(txtPlan, txtPlan.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                
                
            }
            catch
            {
            }
        }
    }
}