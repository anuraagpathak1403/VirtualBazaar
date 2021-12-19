using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace VirtualBazaar
{
    public partial class ViewMap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                
            }

        }
        //private static string getConstr()
        //{
        //    return @"data source=SONY-PC\SQLEXPRESS;initial catalog=VirtualBazar;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework";
        //}
        //public string ConvertDataTabletoString()
        //{

        //    DataTable dt = new DataTable();

           
        //    using (SqlConnection con = new SqlConnection(getConstr()))
        //    {
        //        using (SqlCommand cmd = new SqlCommand("PROC_GET_GIS_DETAILS", con))
        //        {


        //            cmd.CommandType = CommandType.StoredProcedure;
        //            con.Open();

        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            da.Fill(dt);
        //            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        //            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        //            Dictionary<string, object> row;
        //            foreach (DataRow dr in dt.Rows)
        //            {
        //                row = new Dictionary<string, object>();
        //                foreach (DataColumn col in dt.Columns)
        //                {
        //                    row.Add(col.ColumnName, dr[col]);
        //                }
        //                rows.Add(row);
        //            }
        //            return serializer.Serialize(rows);

        //        }
        //    }
        //}
    }
}