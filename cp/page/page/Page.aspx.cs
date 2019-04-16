using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_page_Page : System.Web.UI.Page
{
    protected List<PageTBx> listPage;
    protected void Page_Load(object sender, EventArgs e)
    {
        PageManager PM = new PageManager();
        listPage = PM.GetList();
    }
}