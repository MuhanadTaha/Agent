using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);
   
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            lblPage.Text = Session["username"] as string;
            string str = "select imageEmployee from employees where username = '" + Session["username"] + "' ";
            SqlCommand cmd = new SqlCommand(str, con);

            con.Open();
            string ImageName = Convert.ToString(cmd.ExecuteScalar());
            
            con.Close();
            if(ImageName != "")
            {
                Image2.ImageUrl = Image3.ImageUrl = "images/" + ImageName;
            }
            else
            {
                Image2.ImageUrl = Image3.ImageUrl = "images/NewProfileImage.png";
            }

            policy();

        }



    }


    protected void policy()
    {
        string str = "select policy from users where username= '" + Session["username"] + "' ";
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        int Result = Convert.ToInt32(cmd.ExecuteScalar());
        if (Result == 1)
        {
            divOrders.Visible = false;
            divReq.Visible = true;
            divProf.Visible = true;
        }
        else
        {

            divOrders.Visible= false;
            divReq.Visible = false;
            divProf.Visible = false;
            if (Result == 3)
            {
                divProf.Visible = true;
            }
            else if( Result == 2){
                divOrders.Visible = true;
            }

        }
        con.Close();
    }


    protected void lbRequest_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("RequestAuthentication.aspx");
    }


    protected void lbProfile_Click(object sender, System.EventArgs e)
    {
        Response.Redirect("myProfile.aspx");
    }

    protected void btnOut_Click(object sender, System.EventArgs e)
    {
        Session.Abandon();
        Session.Clear();
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }







}
