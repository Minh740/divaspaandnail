using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new_meta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = Request["name"];
        string title = Request["title"];
        string desc = Request["desc"];
        string iconurl = Request["iconurl"];
        string grounpname = Request["grounpname"];
        string grounpcode = Request["grounpcode"];
        MetaManager MM = new MetaManager();
        MetaTBx addmeta = new MetaTBx();
        addmeta.Name = name;
        addmeta.Title = title;
        addmeta.Description = desc;
        addmeta.IconURL = iconurl;
        addmeta.GroupCode = grounpcode;
        addmeta.GroupName = grounpname;
        addmeta.Status = 1;
        MM.AddNew(addmeta);
        Response.Write(1);

    }
}