using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_get_news : System.Web.UI.Page
{
    public List<NewsTBx> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        NewsManager NM = new NewsManager();
        list = NM.GetList().Take(1).ToList();
    }
}