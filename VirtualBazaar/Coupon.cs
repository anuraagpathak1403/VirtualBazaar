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
    
    public partial class Coupon
    {
        public int CouponId { get; set; }
        public int AdvertiserID { get; set; }
        public int UserID { get; set; }
        public decimal Discount { get; set; }
        public System.DateTime Validupto { get; set; }
        public int UsedStatus { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public string CouponNumber { get; set; }
        public string CouponNumber1 { get; set; }
    }
}
