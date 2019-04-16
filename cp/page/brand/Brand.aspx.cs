using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_brand_Brand : System.Web.UI.Page
{
    protected List<BrandTBx> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        BrandManager BM = new BrandManager();
        list = BM.GetList();
    }
}