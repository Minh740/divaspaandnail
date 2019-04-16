using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_new_addnew : System.Web.UI.Page
{
    public string ok = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
        NewManager SM = new NewManager();
            NewsTBx news = new NewsTBx();
            news.NewsName = Request["name"];
           news.NewsContent= Request["description"];
            
            news.NewsStatus = 1;
            SM.AddNew(news);
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
        }
        catch (Exception ex)
        {
            Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }
}