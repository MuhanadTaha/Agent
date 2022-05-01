using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class myProfile : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Default.aspx");
        }

        if (!IsPostBack)
        {
            ReadFromDatabase();
            imageUser.ImageUrl = Display_My_Image();



        }
       

    }

    protected void btnChangeImage_Click(object o, EventArgs e)
    {
        string str = "update employees set imageEmployee = @imageEmployee where username = '" + Session["username"] + "' ";
        SqlCommand cmd = new SqlCommand(str, con);
        cmd.Parameters.AddWithValue("@imageEmployee",FileUpload1.FileName);
        con.Open();
        string ImageName = Convert.ToString(cmd.ExecuteScalar());
        con.Close();


        //var folder = Server.MapPath("~/images/"+ Session["username"]);
        //if (!Directory.Exists(folder))
        //{
        //    Directory.CreateDirectory(folder);
        //}
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
        }


        
    }
    public string Display_My_Image()
    {
        string str = "select imageEmployee from employees where username = '" + Session["username"] + "' ";
        SqlCommand cmd = new SqlCommand(str, con);

        con.Open();
        string ImageName = Convert.ToString(cmd.ExecuteScalar());
        con.Close();
        return "images/" + ImageName;

    }

    protected void btnSave_Click(object o, EventArgs e)
    {

        Insert_Or_Update();
    }


    public void Insert_Or_Update()
    {
        con.Open();
        string Query = "";
        string QueryUser = "";
        string Check = "SELECT COUNT(1) FROM employees where Username = '"+Session["username"]+"' ";
        SqlCommand cmdCheck = new SqlCommand(Check, con);

        
        int count = Convert.ToInt32(cmdCheck.ExecuteScalar());
       

        if (count >= 1)
        {
            Query = "update employees set firstName=@firstName,lastName=@lastName,Postion = @Postion where username ='"+Session["username"]+"' ";
            QueryUser = "update users set address = @address, phoneNumber =@phoneNumber,Password =@Password where username ='"+Session["username"]+"'";
            SqlCommand cmd1 = new SqlCommand(QueryUser, con);
            cmd1.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd1.Parameters.AddWithValue("@phoneNumber", txtPhone.Text);
            cmd1.Parameters.AddWithValue("@Password", txtPass.Text);
            cmd1.ExecuteNonQuery();
        }
        else
        {
            Query = "insert into employees (username,firstName,lastName,Postion) Values(@username,@firstName,@lastName,@Postion)";
        }
        SqlCommand cmd = new SqlCommand(Query, con);
        cmd.Parameters.AddWithValue("@firstName", txtFirstNmae.Text);
        cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
        cmd.Parameters.AddWithValue("@Postion", txtPostion.Text);

        
        cmd.ExecuteNonQuery();
        con.Close();
    }



    public void ReadFromDatabase() {

        //to read info. from employees table
        SqlDataReader myReader = null;
        string Data = "select * from employees where username ='"+ Session["username"]+"'";
        SqlCommand cmd = new SqlCommand(Data,con);
        con.Open();
        myReader = cmd.ExecuteReader();

        while (myReader.Read())
        {
            txtFirstNmae.Text = (myReader["firstName"].ToString());
            txtLastName.Text = (myReader["lastName"].ToString());
            txtPostion.Text = (myReader["postion"].ToString());
            txtUsername.Text = Session["username"].ToString();
        }
        con.Close();



        //to read info. from users table

        SqlDataReader myReader1 = null;
        string Data1 = "select * from users where username ='" + Session["username"] + "'";
        SqlCommand cmd1 = new SqlCommand(Data1, con);
        con.Open();
        myReader1 = cmd1.ExecuteReader();

        while (myReader1.Read())
        {
            txtAddress.Text = (myReader1["address"].ToString());
            txtPhone.Text = (myReader1["PhoneNumber"].ToString());
            txtPass.Text = (myReader1["Password"].ToString());


        }
        con.Close();
    }

    
}