using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Orders : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //DisplatGV();


        }


    }

    protected void GV_OnRowCommand(object sender, GridViewCommandEventArgs e)
    {
        int crow;
        crow = Convert.ToInt32(e.CommandArgument.ToString());
        int ID = Convert.ToInt32(GridView1.Rows[crow].Cells[0].Text);
        con.Open();
        if (e.CommandName == "OkCommand")
        {
            Confirmed(ID);
        }

        con.Close();
        Response.Redirect("Orders.aspx");
    }


    protected void Confirmed(int _ID)
    {
        string str = "update orders set arrive = @arrive where idOrder ="+_ID+" ";
        SqlCommand cmd = new SqlCommand(str,con);
        cmd.Parameters.AddWithValue("@arrive","Yes");
        cmd.ExecuteNonQuery();
    }

}