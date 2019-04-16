using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_category_Category : System.Web.UI.Page
{
    protected List<CategoryTBx> listCategory;
    protected void Page_Load(object sender, EventArgs e)
    {
        CategoryManager CM = new CategoryManager();
        listCategory = CM.GetList();
    }
}