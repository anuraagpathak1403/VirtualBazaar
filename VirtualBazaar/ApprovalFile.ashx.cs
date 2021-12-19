using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace VirtualBazaar
{
    /// <summary>
    /// Summary description for ApprovalFile
    /// </summary>
    public class ApprovalFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            int Id = int.Parse(context.Request.QueryString["Id"]);
            byte[] bytes;
            string contentType;
            string name;

            BazaarModelContainer Db = new BazaarModelContainer();

            var Video = Db.VideosApprovals.Where(p => p.ApprovalID == Id).Single();

            bytes = FileToByteArray(Video.FileName);
            contentType = Video.ContentType;
            name = Video.Title;

            context.Response.Clear();
            context.Response.Buffer = true;
            context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + name);
            context.Response.ContentType = contentType;
            context.Response.BinaryWrite(bytes);
            context.Response.End();
        }

        public byte[] FileToByteArray(string fileName)
        {
            byte[] buff = null;
            string Path = System.Web.HttpContext.Current.Server.MapPath(fileName);
            FileStream fs = new FileStream(Path, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            long numBytes = new FileInfo(Path).Length;
            buff = br.ReadBytes((int)numBytes);
            return buff;
        }

        public bool IsReusable
        {
            get
            {
                return true;
            }

        }
    }
}