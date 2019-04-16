using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_coupons_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            CouponsManager CM = new CouponsManager();
            int id = Convert.ToInt32(Request["id"]);
            CouponsTBx coupons = CM.GetByID(id);
            int type = Convert.ToInt32(Request["type"]);
            coupons.Status = 1;
            coupons.Type = type;

            if (type == 1)
            {
                coupons.Name = Request["name"];
                coupons.Link = Request["link"];
                CM.Save();
            }
            else
            {
                coupons.Link = "/upload/gallery/galleryy_thumb_" + coupons.Id + ".jpg";
                coupons.Link2 = "/upload/gallery/galleryy_" + coupons.Id + ".jpg";
                CM.Save();

                string base64 = Request["base641"];
                if (!string.IsNullOrEmpty(base64))
                {
                    byte[] imageBytes = Convert.FromBase64String(base64);
                    MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                    ms.Write(imageBytes, 0, imageBytes.Length);
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                    string fileName = "galleryy_thumb_" + coupons.Id + ".jpg";
                    image.Save(Path.Combine(Server.MapPath("~/upload/gallery"), fileName));
                }

                base64 = Request["base642"];
                if (!string.IsNullOrEmpty(base64))
                {
                    byte[] imageBytes = Convert.FromBase64String(base64);
                    MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                    ms.Write(imageBytes, 0, imageBytes.Length);
                    System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                    string fileName = "galleryy_" + coupons.Id + ".jpg";
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