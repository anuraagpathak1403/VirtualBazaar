using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VirtualBazaar
{
    public class AppConstants
    {
        public const string succesLoginStatus = "S";
        public const string failLoginStatus = "F";

        public const string defaultPswd = "123456";
        public const string fromMail = "danisinha4545@gmail.com";
        public const string fromMailPwd = "samraheja14";
        public const string mailHost = "smtp.gmail.com";

        public const int mailPort = 587;
        public const string AppRefNo = "Vadbiz_";
        public const string RejectReason = "rejected";
        public const string TransferfirstSatus = "Under Process at Regional Office";
        public const string ApprovalReason = "Approved By Head Office";
        public const string ApprovalReasonRO = "Approved By Regional Office";

        public const string AllotedReason = "allotted";
        public const string Clarification = "Clarification Short By User";
        public const string UnderProcessHO = "Under Process at Head Office";
        public const string confirmDelMessage = "Are you sure you want to Delete Information?";

        public static string pswdMail = "F";
        public static string pswdChange = "F";
    }
}