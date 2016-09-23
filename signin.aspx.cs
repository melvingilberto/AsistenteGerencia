using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSignin_Click(object sender, EventArgs e)
    {
        string first_name = fname.Text;
        string last_name = lname.Text;
        string emails = email.Text;
        string pass = Password.Text;
        string compname = cname.Text;
        string compemail = cemail.Text;

        try
        {
            SqlConnection con = new SqlConnection
            ("Data source=.;Initial Catalog = asistente_de_gerencias;Trusted_Connection = true;");
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from users where email ='"+emails+"'",con);
            int count = Convert.ToInt32(cmd.ExecuteScalar());

            SqlDataReader dr = cmd.ExecuteReader();

            if (count > 0)
            {
                Response.Redirect("signin.aspx?msg=Usuario ya registrado");
            }
            dr.Close();
            SqlCommand com = new SqlCommand(); //Create a object SqlCommand class
            com.Connection = con; //Pasamos la conexion al objeto comando
            com.CommandType = CommandType.StoredProcedure;

            com.CommandText = "crearUsuarios";

            com.Parameters.Add("@fname", SqlDbType.VarChar).Value = first_name;
            com.Parameters.Add("@lname", SqlDbType.VarChar).Value = last_name;
            com.Parameters.Add("@password", SqlDbType.VarChar).Value = pass;
            com.Parameters.Add("@user_name", SqlDbType.VarChar).Value = first_name + " " + last_name;
            com.Parameters.Add("@company", SqlDbType.VarChar).Value = compname;
            com.Parameters.Add("@comp_email", SqlDbType.VarChar).Value = compemail;
            com.Parameters.Add("@email", SqlDbType.VarChar).Value = emails;
            com.Parameters.Add("@type", SqlDbType.Int).Value = 1;

            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("index.aspx");
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }


    }
}