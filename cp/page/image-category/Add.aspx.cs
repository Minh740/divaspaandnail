using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_image_category_Add : System.Web.UI.Page
{
    protected List<CategoryTBx> listCat;
    protected void Page_Load(object sender, EventArgs e)
    {
        CategoryManager CM = new CategoryManager();
        listCat = CM.GetList().Where(ele => ele.ParentID == null).ToList();
    }
}