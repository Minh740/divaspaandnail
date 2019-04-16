using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_category_Edit : System.Web.UI.Page
{
    protected List<CategoryTBx> listParent;
    protected CategoryTBx category;
    protected void Page_Load(object sender, EventArgs e)
    {
        CategoryManager CM = new CategoryManager();
        listParent = CM.GetList().Where(t => t.ParentID == null).ToList();
        int ID = Convert.ToInt32(Page.RouteData.Values["categoryID"]);
        category = CM.GetByID(ID);
    }
}