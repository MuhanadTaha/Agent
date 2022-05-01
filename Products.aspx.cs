using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        int _id = Convert.ToInt32(Request.QueryString["id"]);
        if (!IsPostBack)
        {
            DisplayCategories(_id);
            DisplayProductsinDDL(_id);
            PolicyAddCat();
        }
    }


    protected void PolicyAddCat()
    {
        string str = "select policy from users where username= '" + Session["username"] + "' ";
        SqlCommand cmd = new SqlCommand(str, con);
        con.Open();
        int Result = Convert.ToInt32(cmd.ExecuteScalar());
        if (Result == 1 || Result == 3)
        {
            divAgent.Visible = true;
        }
        else
        {
            divAgent.Visible = false;
        }
        con.Close();

    }

    public void DisplayCategories(int id)
    {
        string strProducts = "select * from Products where CategoriesID =" + id + "";
        con.Open();
        SqlCommand cmd = new SqlCommand(strProducts, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataList1.DataSource = ds;
        DataList1.DataBind();
        con.Close();
    }


    public void insert(int id)
    {

        string AddProducts = "insert into Products (Name,Details,Price,Image,CategoriesID,AddedByEmpID) values (@Name,@Details,@Price,@Image,@CategoriesID,@AddedByEmpID) ";
        SqlCommand cmd = new SqlCommand(AddProducts, con);
        cmd.Parameters.AddWithValue("@Name", txtName.Text);
        cmd.Parameters.AddWithValue("@Details", txtDescription.Text);
        cmd.Parameters.AddWithValue("@Price", Convert.ToSingle(txtPrice.Text));
        cmd.Parameters.AddWithValue("@Image", FileUpload1.FileName);
        cmd.Parameters.AddWithValue("@CategoriesID", id);
        cmd.Parameters.AddWithValue("@AddedByEmpID", IdEmployee());
        cmd.ExecuteNonQuery();
    }

    public int IdEmployee()
    {
        string idString = "select id from employees where username = '"+Session["username"]+"' ";
        SqlCommand cmd = new SqlCommand(idString, con);
        int result = Convert.ToInt32(cmd.ExecuteScalar());
        return result;
    }

    public void UploadImage()
    {
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/ImageProducts/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        con.Open();
        int _id = Convert.ToInt32(Request.QueryString["id"]);
        insert(_id);
        UploadImage();
        con.Close();

    }


    protected int EmplyeeID()
    {
        string str = "select id from employees where username = '"+Session["username"]+"' ";
        SqlCommand cmd = new SqlCommand(str,con);
        int result=Convert.ToInt32(cmd.ExecuteScalar());
        return result;
    }

    public void DisplayProductsinDDL(int _id)
    {
        con.Open();
        string strProducts = "select * from Products where CategoriesID = "+_id+ " and AddedByEmpID ='"+ EmplyeeID() + "' ";
        
        SqlCommand cmd = new SqlCommand(strProducts, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlProducts.DataSource = ds;
        ddlProducts.DataValueField = "idProducts";
        ddlProducts.DataTextField = "Name";
        ddlProducts.DataBind();
        con.Close();
    }


    public void deleteProduct()
    {
        con.Open();
        string strProducts = "delete from Products where idProducts=" + ddlProducts.SelectedValue + "";
        SqlCommand cmd1 = new SqlCommand(strProducts, con);
        cmd1.ExecuteNonQuery();
        con.Close();
    }

    protected void btnDeleteComponent_Click(object sender, EventArgs e)
    {
        int _id = Convert.ToInt32(Request.QueryString["id"]);
        deleteProduct();
        DisplayProductsinDDL(_id);
        DisplayCategories(_id);
    }

    protected void dlReplies_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //check for the correct commandname
        if (e.CommandName == "Add")
        {
            con.Open();

            //use findcontrol to find the label and cast it back to one
            Label Name = e.Item.FindControl("lblName") as Label;
            Label Price = e.Item.FindControl("lblPrice") as Label;

            string str = "insert into Orders (NameProducts,NameCategories,BuyerUser,Price,Arrive) Values (@NameProducts,@NameCategories,@BuyerUser,@Price,@Arrive)";
            SqlCommand cmd = new SqlCommand(str,con);
            cmd.Parameters.AddWithValue("@NameProducts", Name.Text);
            cmd.Parameters.AddWithValue("@NameCategories", DisplayCateigores());
            cmd.Parameters.AddWithValue("@BuyerUser", Convert.ToString(Session["username"]));
            cmd.Parameters.AddWithValue("@Price",Convert.ToSingle(Price.Text));
            cmd.Parameters.AddWithValue("@Arrive", "No");

            cmd.ExecuteNonQuery();
            con.Close();
        }

    }

    protected string DisplayCateigores()
    {
        int _id = Convert.ToInt32(Request.QueryString["id"]);
        string str = "select NameCategories from CategoriesProducts where IDCategories=" + _id+" ";
        SqlCommand cmd = new SqlCommand(str,con);
        string result = Convert.ToString(cmd.ExecuteScalar());
        return result;
    }


}