using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_image_category_Add : System.Web.UI.Page
{
    public ImageCategoryTBx image;
    public List<CategoryTBx> listCat;
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Page.RouteData.Values["ImageID"]);
        ImageCategoryManager icm = new ImageCategoryManager();
        image = icm.GetByID(id);
        CategoryManager cm = new CategoryManager();
        listCat = cm.GetList().Where(ele => ele.ParentID == null).ToList();
    }
}