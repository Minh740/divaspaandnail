using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_edit_page : System.Web.UI.Page
{
    public PageTBx editpage;
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        string name = Request["name"];
        string title = Request["title"];
        string desc = Request["desc"];
        string pagecontent = Request["pagecontent"];
        string grounpcode = Request["grounpcode"];
        PageManager PM = new PageManager();
        editpage = PM.GetByID(id);
        if (editpage.Id==0)
        {
            Response.Write("Page doesn't exist. Please try again.");
            return;
        }
        else
        {
            editpage.Id = id;
            editpage.Name = name;
            editpage.Title = title;
            editpage.PageContent = pagecontent;
            editpage.Description = desc;
            editpage.GroupCode = grounpcode;
            Response.Write(1);
            PM.Save();
        }
        
        
    }
}