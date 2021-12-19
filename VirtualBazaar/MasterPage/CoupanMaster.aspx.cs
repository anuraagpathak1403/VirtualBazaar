using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WMPLib;
using System.Net.Mail;
namespace VirtualBazaar.MasterPage
{
    public partial class Coupan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
                BindData1();
                DivEntry.Visible = false;
                DivGridView.Visible = true;
                GenerateRandomString(5);
                for (int i = 1; i < 101; i++)
                {
                    if (i % 5 == 0)
                    {
                        ddlDiscount.Items.Add(new ListItem(i.ToString() + "%", i.ToString()));
                    }
                }
                ddlDiscount.Items.Insert(0, new ListItem("Select", "0"));
            }
        }



        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Send Coupon")
            {
                try
                {
                    Coupon oCoupon = new Coupon();

                    BazaarModelContainer Db = new BazaarModelContainer();

                    oCoupon.AdvertiserID = Convert.ToInt32(Session["Advertiser"]);
                    oCoupon.UserID = Convert.ToInt32(Session["UserID"]);
                    oCoupon.Discount = Convert.ToDecimal(ddlDiscount.SelectedValue);
                    oCoupon.CreatedDate = DateTime.Now;
                    oCoupon.Validupto = Convert.ToDateTime(txtEndDate.Text);
                    oCoupon.UsedStatus = 0;
                    oCoupon.CouponNumber = lblCoupon.Text;
                    Db.Coupons.Add(oCoupon);
                    Db.SaveChanges();

                    int CoupounID = oCoupon.CouponId;
                    
                    if(CoupounID>0)
                    {
                        int UserId = Convert.ToInt32(Session["UserID"]);

                        var User = from UserDetails in Db.UserInfoes
                                    where UserDetails.UserID == UserId
                                    select UserDetails;

                        List<UserInfo> olist = User.ToList();

                        if(olist.Count > 0)
                        {
                            string mail = olist[0].MailID.ToString();

                            GenerateMailFormat(lblCoupon.Text, mail, oCoupon.Validupto.ToString());
                        }
                    }
                    
                    string title = "Message from System";
                    string msg = "<p>Coupon detail has been Saved successfully.</p>";
                    string Url = "CoupanMaster.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                    return;
                }
                catch (Exception)
                {
                }
            }
            else
            {
                try
                {
                    BazaarModelContainer Db = new BazaarModelContainer();
                    int CouponId = Convert.ToInt32(hdfCouponId.Value);

                    Coupon oCoupon = Db.Coupons.SingleOrDefault(p => p.CouponId == CouponId);

                    oCoupon.UsedStatus = 1;

                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>Coupon Details has been updated successfully.</p>";
                    string Url = "CoupanMaster.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                    return;
                }
                catch (Exception)
                {
                }
            }
        }
        #region For Mail

        public void GenerateMailFormat(string CouponNumber, string EmailID, string Validupto)
        {
            string link = "#";
            string body = this.PopulateBody(CouponNumber, EmailID, Validupto,link);
            string Sub = "VideoDirectory Coupon Code";

            this.sendMail(EmailID, Sub, body, link);
        }

        private string PopulateBody(string CouponNumber, String EmailID, String Validupto, string Link)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(System.Web.HttpContext.Current.Server.MapPath("CouponCode.html")))
            {
                body = reader.ReadToEnd();
            }
           // body = body.Replace("{Name}", Name);
            body = body.Replace("{CouponNumber}", CouponNumber);
            body = body.Replace("{Validupto}", Validupto);
            body = body.Replace("{Link}", Link);


            return body;
        }

        private void sendMail(string EmailID, string Subject, string Body, string link)
        {
            MailMessage msg = new MailMessage();
            try
            {
                msg.From = new MailAddress(AppConstants.fromMail);
                if (EmailID != "" || EmailID != string.Empty)
                {
                    msg.To.Add(EmailID);
                    msg.Body = Body;
                    msg.IsBodyHtml = true;
                    msg.Subject = Subject;
                    SmtpClient smt = new SmtpClient(AppConstants.mailHost);
                    smt.Port = AppConstants.mailPort;
                    smt.Credentials = new NetworkCredential(AppConstants.fromMail, AppConstants.fromMailPwd);
                    smt.EnableSsl = true;
                    smt.Send(msg);
                }

            }
            catch (Exception ex)
            {
            }
            finally
            {
                msg.Dispose();
            }
        }
        #endregion

        public void BindData()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                int AdvertiserID = Convert.ToInt32(Session["Advertiser"]);

                var Discounts = (from Cop in Db.Coupons
                                  join user in Db.UserInfoes on Cop.UserID equals user.UserID
                                  where Cop.AdvertiserID==AdvertiserID
                                  
                                  select new
                                  {
                                      coupons =Cop.CouponId,
                                      Discount = Cop.Discount,
                                      validupto = Cop.Validupto,
                                      usedStatus = Cop.UsedStatus,
                                      UserName=user.UserName
                                  }).ToList();
                                
                if (Discounts != null)
                {
                    grdvCoupon.DataSource = Discounts;
                    grdvCoupon.DataBind();
                }
                
            }
            catch (Exception)
            {
            }
        }

        public void BindData1()
        {
            try
            {
                BazaarModelContainer Db = new BazaarModelContainer();

                int AdvertiserID = Convert.ToInt32(Session["Advertiser"]);

                var Discounts = (from Cop in Db.Coupons
                                 join Adver in Db.AdvertiserRegisterations on Cop.AdvertiserID equals Adver.AdvertiserID
                                 join AdvVideo in Db.AdvertiserVideos on Adver.AdvertiserID equals AdvVideo.AdvertiserID
                                 //join VR in Db.VideoRatings on AdvVideo.VideoID equals VR.VideoID
                                 join VC in Db.VideoComments on AdvVideo.VideoID equals VC.VideoID
                                 join user in Db.UserInfoes on Cop.UserID equals user.UserID
                                 //where Cop.AdvertiserID == AdvertiserID

                                 select new
                                 {
                                     userid = Cop.UserID,
                                     AdvertiserID = user.AdvertiserID,
                                     coupons = Cop.CouponId,
                                     UserName = user.UserName,
                                     comment = VC.Comments,
                                     commentDate = VC.CommentDate
                                 }).ToList();
                
                if (Discounts != null)
                {
                    GrdShowAllCoupon.DataSource = Discounts;
                    GrdShowAllCoupon.DataBind();
                }

            }
            catch (Exception)
            {
            }
        }
        protected void grdvCoupon_PreRender(object sender, EventArgs e)
        {
            if (grdvCoupon.Rows.Count > 0)
            {
                grdvCoupon.UseAccessibleHeader = false;
                grdvCoupon.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdvCoupon.FooterRow.TableSection = TableRowSection.TableFooter;
                int CellCount = grdvCoupon.FooterRow.Cells.Count;
                grdvCoupon.FooterRow.Cells.Clear();
                grdvCoupon.FooterRow.Cells.Add(new TableCell());
                grdvCoupon.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
                grdvCoupon.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                grdvCoupon.FooterRow.Cells.Add(new TableCell());

                TableFooterRow tfr = new TableFooterRow();
                for (int i = 0; i < CellCount; i++)
                {
                    tfr.Cells.Add(new TableCell());

                    grdvCoupon.FooterRow.Controls[1].Controls.Add(tfr);
                }
            }

        }

        //protected void lnkbtnEdit_Click(object sender, EventArgs e)
        //{
        //    LinkButton Edit = (sender) as LinkButton;
        //    GridViewRow row = (GridViewRow)Edit.NamingContainer;

        //    HiddenField hdnCategoryID = (HiddenField)row.FindControl("hdnCategoryID");

        //    int CategoryID = Convert.ToInt32(hdnCategoryID.Value);

        //    BazaarModelContainer Db = new BazaarModelContainer();
        //    var CouponList = from Coupons in Db.Coupons
        //                     where Coupons.CouponId == CategoryID

        //                     select Coupons;

        //    List<Coupon> oList = CouponList.ToList();
        //    hdfCouponId.Value = oList[0].CouponId.ToString();
        //    ddlDiscount.DataSource = CouponList.ToList();
        //    txtEndDate.Text = Convert.ToString(oList[0].Validupto);

        //    btnSave.Text = "Update";
        //    DivEntry.Visible = true;
        //    DivGridView.Visible = false;
        //}

        //protected void lnkbtnforDelete_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        LinkButton Delete = (sender) as LinkButton;
        //        GridViewRow row = (GridViewRow)Delete.NamingContainer;

        //        HiddenField hdfCouponId = (HiddenField)row.FindControl("hdnCategoryID");

        //        int CouponId = Convert.ToInt32(hdfCouponId.Value);

        //        Coupon oCoupon = new Coupon() { CouponId = CouponId };

        //        BazaarModelContainer Db = new BazaarModelContainer();
        //        Db.Coupons.Attach(oCoupon);
        //        Db.Coupons.Remove(oCoupon);

        //        Db.SaveChanges();
        //        string title = "Message from System";
        //        string msg = "<p>Coupan Details has been deleted successfully.</p>";
        //        string Url = "CoupanMaster.aspx";
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
        //        return;

        //        BindData();
        //    }
        //    catch (Exception)
        //    {

        //    }
        //}

        public  void GenerateRandomString(int Length)
        {
            string _allowedChars = "#@$&*abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNOPQRSTUVWXYZ0123456789";
            Random randNum = new Random();
            char[] chars = new char[Length];

            for (int i = 0; i < Length; i++)
            {
                chars[i] = _allowedChars[Convert.ToInt32((_allowedChars.Length - 1) * randNum.NextDouble())];
            }

            string Coupon = string.Empty;

            foreach (var a in chars)
            {
                Coupon = Coupon + a.ToString();
            }

            lblCoupon.Text = Coupon;
        }
        protected void btnAddCoupon_Click(object sender, EventArgs e)
        {
            DivShowall.Visible = true;
            DivEntry.Visible = false;
            DivGridView.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("CoupanMaster.aspx");
        }
   
        protected void GrdShowAllCoupon_PreRender(object sender, EventArgs e)
        {
            if (GrdShowAllCoupon.Rows.Count > 0)
            {
                GrdShowAllCoupon.UseAccessibleHeader = false;
                GrdShowAllCoupon.HeaderRow.TableSection = TableRowSection.TableHeader;
                GrdShowAllCoupon.FooterRow.TableSection = TableRowSection.TableFooter;
                int CellCount = GrdShowAllCoupon.FooterRow.Cells.Count;
                GrdShowAllCoupon.FooterRow.Cells.Clear();
                GrdShowAllCoupon.FooterRow.Cells.Add(new TableCell());
                GrdShowAllCoupon.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
                GrdShowAllCoupon.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                GrdShowAllCoupon.FooterRow.Cells.Add(new TableCell());

                TableFooterRow tfr = new TableFooterRow();
                for (int i = 0; i < CellCount; i++)
                {
                    tfr.Cells.Add(new TableCell());

                    GrdShowAllCoupon.FooterRow.Controls[1].Controls.Add(tfr);
                }
            }
        }

        protected void lnkbtnSend_Click(object sender, EventArgs e)
        {
            DivShowall.Visible = false;
            DivEntry.Visible = true;
            DivGridView.Visible = false;
            
        }
    }
}