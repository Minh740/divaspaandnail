using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new_page : System.Web.UI.Page
{
   
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = Request["name"];
        string title = Request["title"];
        string desc = Request["desc"];
        string grounpcode = Request["grounpcode"];
        string pagecontent = Request["pagecontent"];

        PageManager PM = new PageManager();
        PageTBx add = new PageTBx();
        add.Name = name;
        add.Title = title;
        add.Description = desc;
        add.PageContent = pagecontent;
        add.GroupCode = grounpcode;
        add.Status = 1;
        PM.AddNew(add);
        Response.Write(1);
    }
}