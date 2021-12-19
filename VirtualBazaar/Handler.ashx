<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        string str2 = context.Request.QueryString["request"];
        if (str2 == "getviedoview")
        {
            this.getviedoview(context);
        }
        else if (str2 == "AdvertiserwiseDetails")
        {
            this.AdvertiserwiseDetails(context);
        }
        else if (str2 == "Vediocount")
        {
            this.Vediocount(context);
        }                  
        else if (str2 == "CategoryName")
        {
            this.getCategoryNames(context);
        }
        else if (str2 == "AdvertiserIDinfo")
        {
            this.getAdvertiserIDinfo(context);
        }
        else if (str2 == "AllAdvertiserMarker")
        {
            this.getAllAdvertiserMarker(context);
        }
    }

    private static void writeResponse(HttpContext context, string jResp)
    {
        try
        {

            context.Response.ContentType = "application/json";
            context.Response.Write(jResp);
            context.Response.End();
        }
        catch (Exception ex)
        {
            
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    private void getAdvertiserIDinfo(HttpContext context)
    {

        string str2 = context.Request.Params["AdvertiserID"];
     
        string jResp = "{\"status\":false,\"data\":\"\"}";
        try
        {
            SqlConnection connection = new SqlConnection(getConstr());
            SqlCommand selectCommand = new SqlCommand("PROC_ADVERTISEMENT_INFO_MAP", connection);
            selectCommand.CommandType = CommandType.StoredProcedure;


            selectCommand.Parameters.AddWithValue("@AdvertiserID", str2);
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                jResp = "{\"status\":true,\"data\":{" + this.getColJSON(dataTable) + "}}";
            }
            else
            {
                jResp = "{\"status\":false,\"data\":\"plot information not found\"}";
            }
        }
        catch
        {
            jResp = "{\"status\":false,\"data\":\"\"}";
        }
        writeResponse(context, jResp);
    }

    private string getColJSON(DataTable dt)
    {
        string str = "";
        foreach (DataColumn column in dt.Columns)
        {
            string str2 = column.ColumnName.Replace("_", " ").ToLower();
            str2 = new CultureInfo("en-US", false).TextInfo.ToTitleCase(str2);
            string str3 = str;
            str = str3 + ((str == "") ? "" : ",") + "\"" + str2 + "\":\"" + dt.Rows[0][column.ColumnName].ToString().Replace(@"\", "") + "\"";
        }
        return str;
    }

    private void getAllAdvertiserMarker(HttpContext context)
    {
        //string location = context.Request.Params["location"];

        string jResp = "{\"status\":false,\"data\":\"\"}";
        try
        {
            SqlConnection connection = new SqlConnection(getConstr());
            SqlCommand selectCommand = new SqlCommand("SELECT_ADVERTISER_MARKER_LAYER", connection);
            selectCommand.CommandType = CommandType.StoredProcedure;
           // selectCommand.Parameters.AddWithValue("@P_IIE_Recno", location);
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                jResp = "{\"status\":true,\"data\":{" + this.getAdvertiserMarrkerCreateRowJSON(dataTable) + "}}";
                //jResp = "{\"status\":true,\"data\":{ + this.getAdvertiserMarrkerCreateRowJSON(dataTable) + }}";
            }
            else
            {
                jResp = "{\"status\":false,\"data\":\"plot information not found\"}";
            }
        }
        catch
        {
            jResp = "{\"status\":false,\"data\":\"\"}";
        }
        writeResponse(context, jResp);
    }
    private string getAdvertiserMarrkerCreateRowJSON(DataTable dt)
    {
        string str = "";

        string str2 = str;
        //str = str2 + "\"Marker\":[ + GetAdvertiserMarrker(dt) + ]";
        str = str2 + "\"Marker\":[" + GetAdvertiserMarrker(dt) + "]";
        return str;
    }

    private object GetAdvertiserMarrker(DataTable dt)
    {
        string str = "";
        foreach (DataRow row in dt.Rows)
        {
            string str2 = str;
           
           // str = str2 + ((str == "") ? "" : ",") + "[" + row["Labelname"].ToString() + "]";
            str = str2 + ((str == "") ? "" : ",") + "[" + row["Labelname"].ToString() + "]";
        }

        return str;
    }
    
    private void AdvertiserwiseDetails(HttpContext context)
    {
        string jResp = "{\"status\":false,\"data\":\"\"}";
        try
        {
            string Year = Convert.ToString(context.Request.Params["Year"]);
            string Month = "All";
            string AdvertiserID = Convert.ToString(context.Request.Params["Advertiser"]);                     
            SqlConnection connection = new SqlConnection(getConstr());
            SqlCommand selectCommand = new SqlCommand("GET_ADERTISER_VIEW_DETAILS", connection);
            selectCommand.CommandType = CommandType.StoredProcedure;

            selectCommand.Parameters.AddWithValue("@Year", Year);
            selectCommand.Parameters.AddWithValue("@Month", Month);
            selectCommand.Parameters.AddWithValue("@AdvertiserID", AdvertiserID);
            
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                jResp = "{\"status\":true,\"data\":{" + this.getRowJSONnewss(dataTable) + "}}";
            }
            else
            {
                jResp = "{\"status\":false,\"data\":\"plot information not found\"}";
            }
        }
        catch
        {
            jResp = "{\"status\":false,\"data\":\"\"}";
        }
        writeResponse(context, jResp);
    }
    private string getRowJSONnewss(DataTable dt)
    {
        string str = "";
        int i = 1;
        foreach (DataRow row in dt.Rows)
        {
            string str2 = str;
            str = str2 + ((str == "") ? "" : ",") + "\"Month_" + i.ToString() + "\":\"" + row["MONTH"].ToString() + "\",\"View" + i.ToString() + "\":\"" + row["View_Count"].ToString() + "\"";
            i++;
        }
        return str;
    }
    private void Vediocount(HttpContext context)
    {
        string jResp = "{\"status\":false,\"data\":\"\"}";
        try
        {
            string Year = Convert.ToString(context.Request.Params["Year"]);
            string Month = "All";
            string AdvertiserID = "1";
          //  string AdvertiserID = Convert.ToString(context.Request.Params["Advertiser"]);
            SqlConnection connection = new SqlConnection(getConstr());
            SqlCommand selectCommand = new SqlCommand("GET_ADERTISER_VIEW_DETAILS", connection);
            selectCommand.CommandType = CommandType.StoredProcedure;

            selectCommand.Parameters.AddWithValue("@Year", Year);
            selectCommand.Parameters.AddWithValue("@Month", Month);
            selectCommand.Parameters.AddWithValue("@AdvertiserID", AdvertiserID);

            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                jResp = "{\"status\":true,\"data\":{" + this.getvedioRowJSONnewss(dataTable) + "}}";
            }
            else
            {
                jResp = "{\"status\":false,\"data\":\"plot information not found\"}";
            }
        }
        catch
        {
            jResp = "{\"status\":false,\"data\":\"\"}";
        }
        writeResponse(context, jResp);
    }
    private string getvedioRowJSONnewss(DataTable dt)
    {
        string str = "";
        int i = 1;
        foreach (DataRow row in dt.Rows)
        {
            string str2 = str;
            str = str2 + ((str == "") ? "" : ",") + "\"Month_" + i.ToString() + "\":\"" + row["MONTH"].ToString() + "\",\"View" + i.ToString() + "\":\"" + row["View_Count"].ToString() + "\"";
            i++;
        }
        return str;
    }
    private void getviedoview(HttpContext context)
    {
        string jResp = "{\"status\":false,\"data\":\"\"}";
        try
        {
            string Year = Convert.ToString(context.Request.Params["Year"]);
            string Month = Convert.ToString(context.Request.Params["Month"]);
            string Category = Convert.ToString(context.Request.Params["Category"]);
            string AdvertiserID = Convert.ToString(context.Request.Params["Advertiser"]);
            SqlConnection connection = new SqlConnection(getConstr());
            SqlCommand selectCommand = new SqlCommand("GET_VIDEOS_VIEW_DETAILS", connection);
            selectCommand.CommandType = CommandType.StoredProcedure;
            
            selectCommand.Parameters.AddWithValue("@Year", Year);
            selectCommand.Parameters.AddWithValue("@Month", Month);
            selectCommand.Parameters.AddWithValue("@Category", Category);
            selectCommand.Parameters.AddWithValue("@AdvertiserID", AdvertiserID);
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                jResp = "{\"status\":true,\"data\":{" + this.getRowJSON(dataTable) + "}}";
            }
            else
            {
                jResp = "{\"status\":false,\"data\":\"plot information not found\"}";
            }
        }
        catch
        {
            jResp = "{\"status\":false,\"data\":\"\"}";
        }
        writeResponse(context, jResp);
    }
    private string DataTableToJsonWithJsonNet(DataTable dt)
    {
        string str = "";
        foreach (DataColumn column in dt.Columns)
        {
            string str2 = column.ColumnName.Replace("_", " ").ToLower();
          
            string str3 = str;
            str = str3 + ((str == "") ? "" : ",") + "\"" + str2 + "\":\"" + dt.Rows[0][column.ColumnName].ToString().Replace(@"\", "") + "\"";
        }
        return str;
    }
    private string getRowJSON(DataTable dt)
    {
        string str = "";
        int i = 1;
        foreach (DataRow row in dt.Rows)
        {
            string str2 = str;
            str = str2 + ((str == "") ? "" : ",") + "\"Month_" + i.ToString() + "\":\"" + row["MONTH"].ToString() + "\",\"View" + i.ToString() + "\":\"" + row["View_Count"].ToString() + "\"";
            i++;
        }
        return str;
    }
    private void getCategoryNames(HttpContext context)
    {
        
        string jResp = "{\"status\":false,\"data\":\"\"}";
        try
        {
            SqlConnection connection = new SqlConnection(getConstr());
            SqlCommand selectCommand = new SqlCommand("PROC_GET_CATEGORY", connection);
            selectCommand.CommandType = CommandType.StoredProcedure;
          
            SqlDataAdapter adapter = new SqlDataAdapter(selectCommand);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                jResp = "{\"status\":true,\"data\":" + this.DataTableToJsonWithJsonNet(dataTable) + "}";

            }
            else
            {
                jResp = "{\"status\":false,\"data\":\"Distict information not found\"}";
            }
        }
        catch
        {
            jResp = "{\"status\":false,\"data\":\"\"}";
        }
        writeResponse(context, jResp);
    }
    private static string getConstr()
    {
        return @"data source=SONY-PC\SQLEXPRESS;initial catalog=VirtualBazar;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework&quot;";
        //return @"data source=SONY-PC\SQLEXPRESS;initial catalog=Vadbiz_;User ID=Vadsbiz;Password=Jaimatadi@4545;MultipleActiveResultSets=True;App=EntityFramework&quot;";
    }

    private static string getConstrs()
    {
        return ConfigurationManager.ConnectionStrings["HDESKConnection"].ConnectionString;
    }
    private static string getConstres()
    {
        return ConfigurationManager.ConnectionStrings["Connection3"].ConnectionString;
    }
    
}