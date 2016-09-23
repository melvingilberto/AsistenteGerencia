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
        if (Session["user"] == null)
        {
            Response.Redirect("index.aspx");
        }
    }

    protected void btnCreate_Click(object sender, EventArgs e)
    {
        string name = nombre.Text;
        string mail = email.Text;
        string phon = phone.Text;

        string CC = ConfigurationManager.ConnectionStrings["DBAG"].ConnectionString;
        SqlConnection con = new SqlConnection(CC);
        try
        {
            con.Open();

            SqlCommand com = new SqlCommand(); //Create a object SqlCommand class
            com.Connection = con; //Pasamos la conexion al objeto comando
            com.CommandType = CommandType.StoredProcedure;

            com.CommandText = "createWorkers";
            int id = Convert.ToInt32(Session["user"].ToString());
            com.Parameters.Add("@Phone", SqlDbType.VarChar).Value = phon;
            com.Parameters.Add("@Name", SqlDbType.VarChar).Value = name;
            com.Parameters.Add("@Email", SqlDbType.VarChar).Value = mail;
            com.Parameters.Add("@Id", SqlDbType.Int).Value = id;

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("panel.aspx");

        }
        catch
        { }


    }
}