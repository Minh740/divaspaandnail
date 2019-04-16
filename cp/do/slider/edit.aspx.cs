using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_slider_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            SliderManager SM = new SliderManager();
            int sliderID = Convert.ToInt32(Request["sliderID"]);
            SliderTBx slider = SM.GetByID(sliderID);
            slider.Status = 1;
            slider.Title = Request["title"];
            slider.ShortDesc = Request.Unvalidated["shortDesc"];
            SM.Save();
            string base64 = Request["base64"];
            if (!string.IsNullOrEmpty(base64))
            {
                byte[] imageBytes = Convert.FromBase64String(base64);
                MemoryStream ms = new MemoryStream(imageBytes, 0, imageBytes.Length);
                ms.Write(imageBytes, 0, imageBytes.Length);
                System.Drawing.Image image = System.Drawing.Image.FromStream(ms, true);
                string fileName = "slider_" + slider.ID + ".jpg";
                image.Save(Path.Combine(Server.MapPath("~/upload/slider"), fileName));
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