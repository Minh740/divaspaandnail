using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_delete_page : System.Web.UI.Page
{
    public PageTBx deletepage;
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        PageManager PM = new PageManager();
        deletepage = PM.GetByID(id);
        deletepage.Status = -1;
        PM.Save();
        Response.Write(1);
    }
}