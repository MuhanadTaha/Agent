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

public partial class Categories : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ProjectConnectionString"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayProducts();
            DisplayProductsinDDL();
            PolicyAddCat();
        }
    }


    protected void PolicyAddCat()
    {
        string str = "select policy from users where username= '"+Session["username"]+"' ";
        SqlCommand cmd = new SqlCommand(str,con);
        con.Open();
        int Result = Convert.ToInt32(cmd.ExecuteScalar());
        if (Result !=1)
        {
            divAdmin.Visible = false;
        }
        con.Close();

    }



    public void DisplayProducts()
    {
        string strProducts = "select * from CategoriesProducts";
        con.Open();
        SqlCommand cmd = new SqlCommand(strProducts, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        DataList1.DataSource = ds;
        DataList1.DataBind();
        con.Close();
    }


    public void insert()
    {
        string AddProducts = "insert into CategoriesProducts (NameCategories,Description,ImageMainProducts) values (@NameCategories,@Description,@ImageMainProducts) ";
        con.Open();
        SqlCommand cmd = new SqlCommand(AddProducts, con);
        cmd.Parameters.AddWithValue("@NameCategories", txtName.Text);
        cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
        cmd.Parameters.AddWithValue("@ImageMainProducts", FileUpload1.FileName);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void UploadImage()
    {
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/ImageCategories/") + fileName);
            Response.Redirect(Request.Url.AbsoluteUri);
        }
    }

    protected void imgNewComponent_Click(object sender, EventArgs e)
    {
        insert();
        UploadImage();
        DisplayProducts();
        DisplayProductsinDDL();

    }

    public void DisplayProductsinDDL()
    {
        string strProducts = "select * from CategoriesProducts";
        con.Open();
        SqlCommand cmd = new SqlCommand(strProducts, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlProducts.DataSource = ds;
        ddlProducts.DataValueField = "idCategories";
        ddlProducts.DataTextField = "NameCategories";
        ddlProducts.DataBind();
        con.Close();
    }


    public void deleteProduct()
    {
        con.Open();
        string strProducts = "delete from Products where CategoriesID=" + ddlProducts.SelectedValue + "";
        SqlCommand cmd1 = new SqlCommand(strProducts, con);
        cmd1.ExecuteNonQuery();

        string strCategories = "delete from CategoriesProducts where idCategories=" + ddlProducts.SelectedValue + "";
        SqlCommand cmd = new SqlCommand(strCategories, con);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void btnDeleteComponent_Click(object sender, EventArgs e)
    {
        deleteProduct();
        DisplayProducts();
        DisplayProductsinDDL();
    }
}