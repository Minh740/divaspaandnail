using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_edit_meta : System.Web.UI.Page
{
    public MetaTBx editmetaa= new MetaTBx();

    protected void Page_Load(object sender, EventArgs e)
        
    {
        try { 
        int id = Convert.ToInt32(Request["id"]);

        string name = Request["name"];
        string title = Request["title"];
        string desc = Request["desc"];
        string groupname = Request["groupname"];
        string groupcode = Request["groupcode"];
       
        MetaManager mm = new MetaManager();
        editmetaa = mm.GetByID(id);
        editmetaa.Name = name;
        editmetaa.Title = title;
        editmetaa.Description = desc;
        editmetaa.GroupCode = groupcode;
        editmetaa.GroupName = groupname;
        string base64 = Request["base64"];
            mm.Save();
        if (!string.IsNullOrEmpty(base64))
        {
            byte[] imageBytes = Convert.FromBase64String(base64);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);           
            image.Save(Server.MapPath("~/upload/imagemeta/editimage_" + editmetaa.Id  +".jpg"));
            
        }
            
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
      