using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_checkin_CheckIn : System.Web.UI.Page
{
    public List<UserCheckInTBx> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckInManager CM = new CheckInManager();
        list = CM.GetList();
        Page.Title = "CheckIn";
    }
}