using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_slider_Slider : System.Web.UI.Page
{
    protected List<SliderTBx> listSlider;
    protected void Page_Load(object sender, EventArgs e)
    {
        SliderManager SM = new SliderManager();
        listSlider = SM.GetList();
    }
}