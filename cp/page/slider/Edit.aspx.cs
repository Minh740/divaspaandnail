using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_slider_Edit : System.Web.UI.Page
{
    protected SliderTBx slider;
    protected void Page_Load(object sender, EventArgs e)
    {
        int sliderID = Convert.ToInt32(Page.RouteData.Values["sliderID"]);
        SliderManager SM = new SliderManager();
        slider = SM.GetByID(sliderID);
    }
}