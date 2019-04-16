using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_image_category_ImageCatgory : System.Web.UI.Page
{
    public List<ImageCategoryTBx> listImage;
    protected void Page_Load(object sender, EventArgs e)
    {
        ImageCategoryManager ICM = new ImageCategoryManager();
        listImage = ICM.GetList().OrderBy(ele => ele.CategoryID).ToList();
    }
}