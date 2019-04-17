using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_new_Edit : System.Web.UI.Page
{
    public NewsTBx edit1;
    protected void Page_Load(object sender, EventArgs e)
    {
        int id= Convert.ToInt32(Page.RouteData.Values["id"]);
        NewManager nm = new NewManager();
        edit1 = nm.GetByID(id);

    }
}
