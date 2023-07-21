using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;





namespace Myproject01
{
    public partial class PleasePurchaseInboundManagement : System.Web.UI.Page
    {
     
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //宣告
            DateTime dt;
            Page page = (Page)HttpContext.Current.Handler;
            DetailsView details = (DetailsView)page.FindControl("DetailsView1");

            if (details != null)
            {
                TextBox text = (TextBox)details.FindControl("TextBox7");
                string a = text.Text;
                if (DateTime.TryParseExact(args.Value, "yyyy/mm/dd", null,
                    System.Globalization.DateTimeStyles.AllowWhiteSpaces, out dt))
                {
                    args.IsValid = true;
                }
                else 
                {
                    args.IsValid = false;
                }
            }              
        }
    }
}