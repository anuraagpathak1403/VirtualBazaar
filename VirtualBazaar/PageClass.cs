using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
namespace VirtualBazaar
{
    public class PageClass
    {
        public string RenderMenuPermissions(int userRec)
        {
            try
            {
                string MenuHTML = "";
                string BaseURL = "";


                BazaarModelContainer DB = new BazaarModelContainer();

                var Menu = (from men in DB.Menus
                            join menuper in DB.Menupermissions on men.MenuId equals menuper.MenuID
                            where menuper.User_Recno == userRec
                            orderby men.MenuOrder ascending
                            select new
                            {
                                menuID = men.MenuId,
                                menuperentId = men.ParentID,
                                menuName = men.MenuName,
                                menuUrl = men.MenuURL,
                                menuOrder = men.MenuOrder

                            }).ToList();

                BaseURL = ConfigurationManager.AppSettings["BaseURL"].ToString();
                int i, zz = 0;

                MenuHTML += Environment.NewLine + "<ul id='nav'>" + Environment.NewLine;
                int val = 0;
                i = 0;
                MenuHTML += "<li> <a href='" + BaseURL + "/" + "Default.aspx'>Home</a></li>" + Environment.NewLine;
                int parentID = -1;
                int count = 0;
                int count3Level = 0;
                foreach (var item in Menu)
                {
                    if (Convert.ToInt16(item.menuperentId) == 0)
                    {
                        val = val + 1;
                        if (zz == 1)
                        {
                            if (count == -1)    //in case their are no 1st level submenu after 2nd level submenu for same parentID
                            {
                                if (count3Level == 3)
                                {
                                    MenuHTML += "</ul></li>" + Environment.NewLine;
                                    count3Level = 0;
                                }
                                MenuHTML += "</ul></li>" + Environment.NewLine;
                                MenuHTML += "</a></ul></li>";
                                count = 0;
                                zz = 0;
                            }
                            else
                            {

                                MenuHTML += "</a></ul></li>";
                                zz = 0;
                                count = 0;
                            }
                        }
                        MenuHTML += Environment.NewLine + "<li>" + Environment.NewLine;
                        MenuHTML += "<a href=\"" + BaseURL + "/" + item.menuUrl.ToString() + "\" >";
                        MenuHTML += item.menuName.ToString() + "</a>" + Environment.NewLine;
                    }
                    else
                    {
                        if (zz == 0)
                        {
                            MenuHTML += "<ul>" + Environment.NewLine;  //create dropdown for main tab in menu
                            parentID = Convert.ToInt16(item.menuperentId);

                        }
                        if ((Convert.ToInt16(item.menuperentId) != 0) && (Convert.ToInt16(item.menuperentId) == parentID))
                        {
                            if (count == -1)    //in case their are  1st level submenu after 2nd level submenu for a given submenu for same parentID
                            {
                                if (count3Level == 3)
                                {
                                    MenuHTML += "</ul></li>" + Environment.NewLine;
                                    count3Level = 0;
                                }
                                MenuHTML += "</ul></li>" + Environment.NewLine;
                                count = 0;
                            }
                            else if (count >= 1) //close <a> tag for each submenu item 
                            {
                                MenuHTML += "</a></li>" + Environment.NewLine;
                                count = 0;
                            }

                            MenuHTML += "<li><a id='" + item.menuID.ToString() + "' href='" + BaseURL + "/" + item.menuUrl.ToString() + "'>" + item.menuName.ToString();
                            zz = 1;
                            count++;
                        }
                        else
                        {

                            //generate 2nd level submenu

                            if (count >= 1)
                            {
                                MenuHTML += "<img src=\"" + "/images/arrow-right8.gif\" style=\"border-width:0px;vertical-align:middle\"  align=\"right\" alt=\"\"/></a>" + Environment.NewLine;
                                MenuHTML += "<ul>" + Environment.NewLine;
                                MenuHTML += "<li><a id='" + item.menuperentId.ToString() + "' href='" + BaseURL + "/" + item.menuUrl.ToString() + "' style =\"border-top:solid 1px #0f62ac;\">" + item.menuName.ToString() + "</a></li>" + Environment.NewLine;

                                count = -1;
                            }
                            else
                            {
                                if (item.menuUrl.ToString() == "#")
                                {
                                    MenuHTML += "<li><a id='" + item.menuID.ToString() + "' href='" + item.menuUrl.ToString() + "' >" + item.menuName.ToString() + "<img src=\"" + "/images/arrow-right8.gif\" style=\"border-width:0px;vertical-align:middle\"  align=\"right\" alt=\"\"/></a>";
                                    MenuHTML += "<ul>" + Environment.NewLine;
                                    count3Level = 1;

                                }
                                else
                                {
                                    if (count3Level == 1)
                                    {
                                        MenuHTML += "<li><a id='" + item.menuperentId.ToString() + "' href='" + BaseURL + "/" + item.menuUrl.ToString() + "' style =\"border-top:solid 1px #0f62ac;\">" + item.menuName.ToString() + "</a></li>" + Environment.NewLine;
                                        count3Level = 3;
                                    }
                                    else
                                    {
                                        MenuHTML += "<li><a id='" + item.menuperentId.ToString() + "' href='" + BaseURL + "/" + item.menuUrl.ToString() + "'>" + item.menuName.ToString() + "</a></li>" + Environment.NewLine;
                                    }
                                }

                            }
                        }
                    }
                }


                if (count >= 1)
                {
                    MenuHTML += "</a></li>";
                   
                }

                //MenuHTML += "</ul><li><a href='#'>Options</a>" + Environment.NewLine + "<ul><li><a href='../User/Change_Password.aspx'>Change Password</a></li>" + Environment.NewLine + "<li><a href='../Default.aspx'>Logout</a></li></ul></li>" + Environment.NewLine + "</ul>";
                MenuHTML = MenuHTML.Replace(BaseURL + "/#", "#"); //MenuHTML.Replace("/GCTS/#", "#");
                return MenuHTML;
            }
            catch (Exception ex)
            {
                String AA = ex.InnerException.ToString();
                return string.Empty;
                // ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "Message('" + title + "','btn-success','" + msg + "');", true);

            }
        }
    }
}