using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar
{
    public partial class Change_Password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtnewPassword.Text == txtConfirmPassword.Text)
                {
                    BazaarModelContainer Db = new BazaarModelContainer();
                    int UserID = Convert.ToInt32(Session["UserID"]);                  
                    UserInfo obj = Db.UserInfoes.SingleOrDefault(p => p.UserID == UserID);                            
                    obj.Password = EncodeString(txtnewPassword.Text);                                                     
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>User has been updated successfully.</p>";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                    
                    return;

                }
                else
                {
                    string title = "Message from System";
                    string msg = "Confirm Password must be same as New Password";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-danger','" + msg + "');", true);
                    return;
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error in Encryption" + ex.Message);
            }
        }
        public string EncodeString(string sData)
        {
            try
            {
                byte[] encData_byte = new byte[sData.Length];

                encData_byte = System.Text.Encoding.UTF8.GetBytes(sData);

                string encodedData = Convert.ToBase64String(encData_byte);

                return encodedData;

            }
            catch (Exception ex)
            {
                throw new Exception("Error in Encryption" + ex.Message);
            }
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
}