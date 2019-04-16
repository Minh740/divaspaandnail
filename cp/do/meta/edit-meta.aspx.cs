using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_edit_meta : System.Web.UI.Page
{
    public MetaTBx editmetaa= new MetaTBx();

    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        string name = Request["name"];
        string title = Request["title"];
        string desc = Request["desc"];
        string iconurl= Request["iconurl"];
        string grounpname = Request["grounpname"];
        string grounpcode = Request["grounpcode"];

        MetaManager mm = new MetaManager();
        editmetaa = mm.GetByID(id);
        //xet meta ko ton tai
        if (editmetaa.Id==0)
        {
            Response.Write("Meta doesn't exist. Please try again.");
            return;
        }
        {
            editmetaa.Id = id;
            editmetaa.Name = name;
            editmetaa.Title = title;
            editmetaa.Description = desc;
            editmetaa.IconURL = iconurl;
            editmetaa.GroupCode = grounpcode;
            editmetaa.GroupName = grounpname;
            // luu  vao database
            mm.Save();
            Response.Write(1);
        }
    }
}