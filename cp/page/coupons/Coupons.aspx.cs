using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_coupons_Coupons : System.Web.UI.Page
{
    protected List<CouponsTBx> listCoupons;

    protected void Page_Load(object sender, EventArgs e)
    {
        CouponsManager CM = new CouponsManager();
        listCoupons = CM.GetList();
    }
}