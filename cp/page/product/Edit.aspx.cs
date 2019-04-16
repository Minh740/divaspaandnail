using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_product_Edit : System.Web.UI.Page
{
    protected ProductTBx product;
    protected void Page_Load(object sender, EventArgs e)
    {
        int productID = Convert.ToInt32(Page.RouteData.Values["productID"]);
        ProductManager PM = new ProductManager();
        product = PM.GetByID(productID);
    }
}