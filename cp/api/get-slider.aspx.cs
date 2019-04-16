using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_get_slider : System.Web.UI.Page
{
    public List<SliderTBx> listslide;
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        SliderManager sm = new SliderManager();
        int id = Convert.ToInt32(Request["id"]);
        listslide = sm.GetList();
    }
}