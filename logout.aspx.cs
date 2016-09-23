using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Session.Remove("user");
            Response.Redirect("index.aspx");
        }
        if (Session["admin"] != null){
            Session.Remove("admin");
            Response.Redirect("index.aspx");
        }else
        {
            Response.Redirect("index.aspx");
        }
    }
}