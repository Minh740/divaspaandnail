using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_get_page : System.Web.UI.Page
{
    public PageTBx page;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        PageManager pm = new PageManager();
        int id = Convert.ToInt32(Request["id"]);
        page = pm.GetByID(id);
    }
}