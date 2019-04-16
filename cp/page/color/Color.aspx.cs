using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_color_Color : System.Web.UI.Page
{
    protected List<ColorTBx> list;
    protected List<BrandTBx> listBrand;
    protected BrandManager BM;
    protected void Page_Load(object sender, EventArgs e)
    {
        ColorManager CM = new ColorManager();
        BM = new BrandManager();
        list = CM.GetList();
        listBrand = BM.GetList();

    }
}