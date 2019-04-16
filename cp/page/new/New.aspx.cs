using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_new_New : System.Web.UI.Page
{
    public List<NewsTBx> list;
    public string title;
    protected void Page_Load(object sender, EventArgs e)
    {
        NewManager news = new NewManager();
        list = news.GetList();
        Page.Title = "News";
        for (int i = 0; i < list.Count; i++)
        {
            title = list[0].NewsName;
        }
    }
}