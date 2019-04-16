using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_imagecategory_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int cat = Convert.ToInt32(Request["categoryID"]);

            ImageCategoryManager IM = new ImageCategoryManager();
            ImageCategoryTBx imageAdd = new ImageCategoryTBx();
            imageAdd.Status = 1;
            imageAdd.CategoryID = cat;
            imageAdd.Link = "a";
            imageAdd.Link2 = "a";
            IM.AddNew(imageAdd);
            imageAdd.Link = "/upload/service/image_" + imageAdd.ID + ".jpg";
            imageAdd.Link2 = "/upload/service/image_" + imageAdd.ID + "_1.jpg";
            IM.Save();

            string base64 = Request["base641"];
            if (!string.IsNullOrEmpty(base64))
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                System.IO.MemoryStream ms = new System.IO.MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image1 = System.Drawing.Image.FromStream(ms, true);
                string fileName = "image_" + imageAdd.ID + ".jpg";
                image1.Save(System.IO.Path.Combine(Server.MapPath("~/upload/service/"), fileName));
            }

            base64 = Request["base642"];
            if (!string.IsNullOrEmpty(base64))
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                System.IO.MemoryStream ms = new System.IO.MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image1 = System.Drawing.Image.FromStream(ms, true);
                string fileName = "image_" + imageAdd.ID + "_1.jpg";
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