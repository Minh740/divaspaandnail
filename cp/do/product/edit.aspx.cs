using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_product_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ProductManager PM = new ProductManager();
            int productID = Convert.ToInt32(Request["id"]);
            ProductTBx product = PM.GetByID(productID);
            product.Status = 1;
            product.Name = Request["name"];
            PM.Save();
            string base64 = Request["base64"];
            if (!string.IsNullOrEmpty(base64))
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                string fileName = "product_" + product.ID + ".jpg";
                image.Save(Path.Combine(Server.MapPath("~/upload/product"), fileName));
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