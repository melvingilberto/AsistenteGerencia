using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] != null)
        {
            Response.Redirect("index.aspx");
        }
        if (Session["admin"] != null)
        {
            Response.Redirect("index.aspx");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string emails = email.Text;
        string pass = password.Text;

        string CC = ConfigurationManager.ConnectionStrings["DBAG"].ConnectionString;
        SqlConnection con = new SqlConnection(CC);
        con.Open();


        SqlCommand cmd = new SqlCommand("select * from users where email=@EMAIL and password=@PASS and type = 1", con);
        cmd.Parameters.Add("@EMAIL", SqlDbType.VarChar).Value = email.Text;
        cmd.Parameters.Add("@PASS", SqlDbType.VarChar).Value = password.Text;

        int count = Convert.ToInt32(cmd.ExecuteScalar());

        SqlDataReader dr = cmd.ExecuteReader();

        
        if (count > 0)
        {
            while (dr.Read())
            {
                int id = dr.GetInt32(0);
                Session["user"] = id;
                Response.Redirect("panel.aspx");
            }
           // Session["user"] = emails;
            //
        }
        con.Close();

    }
}