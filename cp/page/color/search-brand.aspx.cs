using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_color_search_brand : System.Web.UI.Page
{
    public List<ColorTBx> result1 = new List<ColorTBx>();
    //public List<BrandTBx> result = new List<BrandTBx>();
    public List<BrandTBx> listBrand;
    public BrandManager BM;
    protected void Page_Load(object sender, EventArgs e)
    {
         BM = new BrandManager();
        ColorManager CM = new ColorManager();
        //string name = Request["name"];
        //listBrand = BM.GetList();

        int id = Convert.ToInt32(Request["id"]);
        result1 = CM.getbrandbybrandname(id);

    }
}