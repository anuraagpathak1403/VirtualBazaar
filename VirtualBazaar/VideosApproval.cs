//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VirtualBazaar
{
    using System;
    using System.Collections.Generic;
    
    public partial class VideosApproval
    {
        public int ApprovalID { get; set; }
        public int AdvertiserID { get; set; }
        public string Title { get; set; }
        public string FileName { get; set; }
        public string ContentType { get; set; }
        public int FileType { get; set; }
        public int ApprovalStatus { get; set; }
        public System.DateTime SubmitDate { get; set; }
    }
}