using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_product_Product : System.Web.UI.Page
{
    protected List<ProductTBx> listProduct;
    protected void Page_Load(object sender, EventArgs e)
    {
        ProductManager PM = new ProductManager();
        listProduct = PM.GetList();
    }
}