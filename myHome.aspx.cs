using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myHome : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            lblHello.Text = "Hello " + Session["username"];
            DisplayPermissionsDDL();
        }
    }
    public void DisplayPermissionsDDL()
    {
        string strProducts = "select * from UserPermissions where UserTypeName != 'Normal User' ";
        con.Open();
        SqlCommand cmd = new SqlCommand(strProducts, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlPermession.DataSource = ds;
        ddlPermession.DataValueField = "idUserType";
        ddlPermession.DataTextField = "UserTypeName";
        ddlPermession.DataBind();
        con.Close();
    }




    protected void btnRequests_Click(object sender, EventArgs e)
    {
        AddRequest();
    }

    public void AddRequest()
    {
        string str = "insert into Requests (username,userRoleID) values (@username,@userRoleID)";
        SqlCommand cmd = new SqlCommand(str,con);
        cmd.Parameters.AddWithValue("@username",Convert.ToString(Session["username"]));
        cmd.Parameters.AddWithValue("@userRoleID", ddlPermession.SelectedValue);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}