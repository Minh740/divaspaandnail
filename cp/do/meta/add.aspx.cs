using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new_meta : System.Web.UI.Page
{
    public MetaTBx meta;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
                    
        {
            string name = Request["name"];
            string title = Request["title"];
            string desc = Request["desc"];
            string groupname = Request["groupname"];
            string groupcode = Request["groupcode"];
            MetaManager MM = new MetaManager();
            MetaTBx meta = new MetaTBx();
            meta.Title = title;
            meta.Description = desc;
            meta.GroupCode = groupcode;
            meta.GroupName = groupname;
            meta.Name = name;
            meta.Status = 1;
            MM.AddNew(meta);
            meta.IconURL = "/upload/imagemeta/image_" + meta.Id + ".jpg";
            MM.Save();
            string base64 = Request["base64"];
            byte[] imageBytes = Convert.FromBase64String(base64);
            MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
            ms.Write(imageBytes, 0, imageBytes.Length);
            System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
           
            image.Save(Server.MapPath("~/upload/imagemeta/image_"+meta.Id + ".jpg"));
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
      