using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_service_search_service : System.Web.UI.Page
{
    public List<ServicesTBx> result = new List<ServicesTBx>();
    protected void Page_Load(object sender, EventArgs e)
    {
        ServicesManager SM = new ServicesManager();
        string name = Request["name"];
        ServicesManager r = new ServicesManager();
        result = SM.GetServiceByServiceName(name);

    }
}