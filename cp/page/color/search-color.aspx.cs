using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_color_search_color : System.Web.UI.Page
{
    public List<ColorTBx> result = new List<ColorTBx>();
    protected List<BrandTBx> listBrand;
    protected BrandManager BM;
    protected void Page_Load(object sender, EventArgs e)
    {
        ColorManager CM = new ColorManager();
        string name = Request["name"];
        ServicesManager r = new ServicesManager();
        result = CM.GetColorByColorName(name);
        BM = new BrandManager();
        listBrand = BM.GetList();

    }
}