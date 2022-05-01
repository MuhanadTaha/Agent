using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Requests : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();

        }
    }

   


    protected void GV_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {

        int crow;
        crow = Convert.ToInt32(e.CommandArgument.ToString());
        string value = GridView1.Rows[crow].Cells[0].Text;
        int ID = Convert.ToInt32(GridView1.Rows[crow].Cells[2].Text);
        con.Open();
        if (e.CommandName == "AcceptCommand")
        {
            Accept(value,ID);
            Delete(value);
        }

        if(e.CommandName == "DeleteCommand")
        {
            Delete(value);
        }
        con.Close();
        Response.Redirect("Requests.aspx");

    }



    public void Accept(string _value, int _ID)
    {
        string Result = "";
       
        string Check = "Select count(1) from employees where username ='"+_value+"'";
        SqlCommand cmd1 = new SqlCommand(Check, con);
        int r = Convert.ToInt32(cmd1.ExecuteScalar());

        
        if (r ==0) {
            Result = "insert into employees (username,imageEmployee) Values(@username,@imageEmployee) ";
            SqlCommand cmd2 = new SqlCommand(Result, con);
            cmd2.Parameters.AddWithValue("@username", _value);
            cmd2.Parameters.AddWithValue("@imageEmployee", "NewProfileImage.png");
            cmd2.ExecuteNonQuery();
            Response.Write("Fined");
        }

        Result = "update users set Policy = @Policy where username ='" + _value + "'";
        SqlCommand cmd = new SqlCommand(Result, con);
        cmd.Parameters.AddWithValue("@Policy", _ID);
        cmd.ExecuteNonQuery();



    }

    public void Delete(string _value)
    {
        string str = "delete from Requests where username = @username ";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.Parameters.AddWithValue("@username", _value);
        cmd.ExecuteNonQuery();
    }

}