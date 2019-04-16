using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_gallery_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            GalleryManager GM = new GalleryManager();
            int id = Convert.ToInt32(Request["id"]);
            GalleryTBx gallery = GM.GetByID(id);
            int type = Convert.ToInt32(Request["type"]);
            gallery.Status = 1;
            gallery.Type = type;

            if (type == 1)
            {
                gallery.Name = Request["name"];
                gallery.Link = Request["link"];
                GM.Save();
            }
            else
            {
                gallery.Link = "/upload/gallery/gallery_thumb_" + gallery.ID + ".jpg";
                gallery.Link2 = "/upload/gallery/gallery_" + gallery.ID + ".jpg";
                GM.Save();

                string base64 = Request["base641"];
                if (!string.IsNullOrEmpty(base64))
                {
                    byte[] imageBytes = Convert.FromBase64String(base64);
                    MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                    ms.Write(imageBytes, 0, imageBytes.Length);
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                    string fileName = "gallery_thumb_" + gallery.ID + ".jpg";
                    image.Save(Path.Combine(Server.MapPath("~/upload/gallery"), fileName));
                }

                base64 = Request["base642"];
                if (!string.IsNullOrEmpty(base64))
                {
                    byte[] imageBytes = Convert.FromBase64String(base64);
                    MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                    ms.Write(imageBytes, 0, imageBytes.Length);
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                    string fileName = "gallery_" + gallery.ID + ".jpg";
                    image.Save(Path.Combine(Server.MapPath("~/upload/gallery"), fileName));
                }
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