using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_page_Edit : System.Web.UI.Page
{
    protected PageTBx page;
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Page.RouteData.Values["pageID"]);
        PageManager PM = new PageManager();
        page = PM.GetByID(id);
    }
}