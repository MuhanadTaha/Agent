using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SignUP : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    public void SignUpUser()
    {

        string Check = "Select Count(*) from users where username =@username";
        SqlCommand cmd1 = new SqlCommand(Check,con);
        cmd1.Parameters.AddWithValue("@username", txtUsername.Text);
        con.Open();
        int count = Convert.ToInt32(cmd1.ExecuteScalar());
        con.Close();
        if(count == 0)
        {

            string NewUser = "insert into users values (@username,@password,@address,@phoneNumber,@policy)";
            SqlCommand cmd = new SqlCommand(NewUser, con);
            cmd.Parameters.AddWithValue("@username", txtUsername.Text);
            cmd.Parameters.AddWithValue("@password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@phoneNumber",Convert.ToDecimal(txtPhone.Text));
            cmd.Parameters.AddWithValue("@policy", 2);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

        }
        else
        {
            lblMessage.Text = "Username Is Already Exist";
        }



    }

    protected void SignUp_Click(object sender, EventArgs e)
    {
        SignUpUser();
    }

    
}