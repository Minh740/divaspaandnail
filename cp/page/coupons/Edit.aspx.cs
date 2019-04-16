using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_coupons_Edit : System.Web.UI.Page
{
    protected CouponsTBx coupons;

    protected void Page_Load(object sender, EventArgs e)
    {
        CouponsManager CM = new CouponsManager();
        int couponsId = Convert.ToInt32(Request["id"]);
        coupons = CM.GetByID(couponsId);
    }
}