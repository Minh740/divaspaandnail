using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_imagecategory_Add : System.Web.UI.Page
{
    public ImageCategoryTBx editimage;
    public CategoryTBx addcatid = new CategoryTBx();
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            int id = Convert.ToInt32(Request["id"]);
            int cat = Convert.ToInt32(Request["categoryID"]);

            ImageCategoryManager IM = new ImageCategoryManager();
            editimage = IM.GetByID(id);
            editimage.CategoryID = cat;
            editimage.Link = "/upload/service/image_" + editimage.ID + ".jpg";
            editimage.Link2 = "/upload/service/image_" + editimage.ID + "_1.jpg";
            IM.Save();
            string base64 = Request["base641"];
            if (!string.IsNullOrEmpty(base64))
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                System.IO.MemoryStream ms = new System.IO.MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image1 = System.Drawing.Image.FromStream(ms, true);
                string fileName = "image_" + editimage.ID + ".jpg";
                image1.Save(System.IO.Path.Combine(Server.MapPath("~/upload/service/"), fileName));
            }

            base64 = Request["base642"];
            if (!string.IsNullOrEmpty(base64))
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                System.IO.MemoryStream ms = new System.IO.MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image1 = System.Drawing.Image.FromStream(ms, true);
                string fileName = "image_" + editimage.ID + "_1.jpg";
                image1.Save(System.IO.Path.Combine(Server.MapPath("~/upload/service/"), fileName));
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
