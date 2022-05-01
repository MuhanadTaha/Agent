using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    public void TestLogin()
    {

        string Check = "SELECT COUNT(1) FROM Users where Username = @Username AND Password = @Password ";
        SqlCommand cmd = new SqlCommand(Check, con);
        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
        cmd.Parameters.AddWithValue( "@Password", txtPassword.Text);

        con.Open();
       
        int count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if(count == 1)
        {
            
            Session["username"] = txtUsername.Text;
            RedirectGo();
        }
        

    }

    protected void RedirectGo()
    {
        string str = "select policy from users where username= '" + Session["username"] + "' ";
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        int Result = Convert.ToInt32(cmd.ExecuteScalar());
        if (Result != 2)
        {
            Response.Redirect("myHome.aspx");
        }
        else
        {
            Response.Redirect("Categories.aspx");
        }
        con.Close();

    }


    protected void btnCheck(object sender, EventArgs e)
    {
        TestLogin();
    }


}