using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_page_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string name = Request["name"];
            string title = Request["title"];
            string pageContent = Request.Unvalidated["pagecontent"];
            PageManager PM = new PageManager();
            PageTBx page = new PageTBx();
            page.Name = name;
            page.Title = title;
            page.PageContent = pageContent;
            page.Status = 1;
            PM.AddNew(page);
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