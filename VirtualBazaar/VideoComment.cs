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
    
    public partial class VideoComment
    {
        public int CommentID { get; set; }
        public int VideoID { get; set; }
        public string Comments { get; set; }
        public string CommentsBy { get; set; }
        public System.DateTime CommentDate { get; set; }
    }
}