using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualBazaar.MasterPage
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
                DivEntry.Visible = false;
                DivGridView.Visible = true;
            }
        }
        public void BindData()
        {
            BazaarModelContainer Db = new BazaarModelContainer();

            var UserList = from emp in Db.UserInfoes
                           select emp;
            if (UserList != null)
            {
                List<UserInfo> oList = UserList.ToList();
                grdvUserRegistration.DataSource = oList;
                grdvUserRegistration.DataBind();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (btnSave.Text == "Save")
            {
                try
                {
                    UserInfo obj = new UserInfo();

                    obj.Name = txtFullName.Text;
                    obj.UserName = txtUserName.Text;
                    obj.MobileNo = txtMobileNo.Text;
                    obj.MailID = txtEmailID.Text;
                    obj.Password = EncodeString(txtPassword.Text);
                    obj.AadharNo = txtAadharNumber.Text;
                    obj.RoleID = '3';
                    obj.Address = txtAddress.Text;
                    obj.CreatedDate = DateTime.Now;
                    obj.AdvertiserID = 0;
                    BazaarModelContainer Db = new BazaarModelContainer();
                    Db.UserInfoes.Add(obj);

                    Db.SaveChanges();
                    string title = "Message from System";
                    string msg = "<p>User has been created successfully.</p>";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                    string Url = "CategoryMaster.aspx";
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

                    int Id = Convert.ToInt32(hdnId.Value);
                    UserInfo obj = Db.UserInfoes.SingleOrDefault(p => p.UserID == Id);

                    obj.Name = txtFullName.Text;
                    obj.UserName = txtUserName.Text;
                    obj.MobileNo = txtMobileNo.Text;
                    obj.MailID = txtEmailID.Text;
                    obj.Password = txtPassword.Text;
                    obj.AadharNo = txtAadharNumber.Text;
                    obj.RoleID = '3';
                    obj.Address = txtAddress.Text;
                    Db.SaveChanges();

                    string title = "Message from System";
                    string msg = "<p>User has been updated successfully.</p>";
                    //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);
                    string Url = "UserRegistration.aspx";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');function Redirect(){window.location='" + Url + "';}setTimeout('Redirect()', 2000);", true);
                    return;

                }
                catch (Exception)
                {

                }
            }

            BindData();
            Clear();
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
        public string DecodeString(string sData)
        {
            try
            {
                System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();

                System.Text.Decoder utf8Decode = encoder.GetDecoder();

                byte[] todecode_byte = Convert.FromBase64String(sData);

                int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);

                char[] decoded_char = new char[charCount];

                utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);

                string result = new String(decoded_char);

                return result;
            }
            catch (Exception ex)
            {
                throw new Exception("Error in Decryption : " + ex.Message);
                //InsertException("DecodeString", "CommonDAL", ex.Message);
            }
        }
        public void Clear()
        {
            txtFullName.Text = string.Empty;
            txtUserName.Text = string.Empty;
            txtMobileNo.Text = string.Empty;
            txtEmailID.Text = string.Empty;
            txtPassword.Text = string.Empty;
            txtAadharNumber.Text = string.Empty;

            txtAddress.Text = string.Empty;
        }

        protected void lnkbtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton Edit = (sender) as LinkButton;
            GridViewRow row = (GridViewRow)Edit.NamingContainer;

            HiddenField hdnUserID = (HiddenField)row.FindControl("hdnUserID");

            int UserId = Convert.ToInt32(hdnUserID.Value);

            BazaarModelContainer Db = new BazaarModelContainer();
            var userList = from emp in Db.UserInfoes
                           where emp.UserID == UserId

                           select emp;


            List<UserInfo> oList = userList.ToList();
            hdnId.Value = oList[0].UserID.ToString();
            txtFullName.Text = oList[0].Name;
            txtUserName.Text = oList[0].UserName;
            txtMobileNo.Text = oList[0].MobileNo;
            txtPassword.Text = DecodeString(oList[0].Password);
            txtAadharNumber.Text = oList[0].AadharNo;
            txtEmailID.Text = oList[0].MailID;
            txtAddress.Text = oList[0].Address;
            //ddlRoleType.SelectedValue = oList[0].RoleID;


            btnSave.Text = "Update";
        }

        protected void lnkbtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LinkButton Delete = (sender) as LinkButton;
                GridViewRow row = (GridViewRow)Delete.NamingContainer;

                HiddenField hdnUserID = (HiddenField)row.FindControl("hdnUserID");

                int UserID = Convert.ToInt32(hdnUserID.Value);

                UserInfo ouser = new UserInfo() { UserID = UserID };

                BazaarModelContainer Db = new BazaarModelContainer();
                Db.UserInfoes.Attach(ouser);
                Db.UserInfoes.Remove(ouser);

                Db.SaveChanges();

                BindData();
                Clear();


            }
            catch (Exception)
            {

            }
        }

        protected void grdvUserRegistration_PreRender(object sender, EventArgs e)
        {
            if (grdvUserRegistration.Rows.Count > 0)
            {
                grdvUserRegistration.UseAccessibleHeader = false;
                grdvUserRegistration.HeaderRow.TableSection = TableRowSection.TableHeader;
                grdvUserRegistration.FooterRow.TableSection = TableRowSection.TableFooter;
                int CellCount = grdvUserRegistration.FooterRow.Cells.Count;
                grdvUserRegistration.FooterRow.Cells.Clear();
                grdvUserRegistration.FooterRow.Cells.Add(new TableCell());
                grdvUserRegistration.FooterRow.Cells[0].ColumnSpan = CellCount - 1;
                grdvUserRegistration.FooterRow.Cells[0].HorizontalAlign = HorizontalAlign.Right;
                grdvUserRegistration.FooterRow.Cells.Add(new TableCell());

                TableFooterRow tfr = new TableFooterRow();
                for (int i = 0; i < CellCount; i++)
                {
                    tfr.Cells.Add(new TableCell());

                    grdvUserRegistration.FooterRow.Controls[1].Controls.Add(tfr);
                }
            }

        }

        protected void btnUserRegistration_Click(object sender, EventArgs e)
        {
            DivEntry.Visible = true;
            DivGridView.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserRegistration.aspx");
        }

    }
}