using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_service_Service : System.Web.UI.Page
{
    protected List<ServicesTBx> listService;
    protected List<CategoryTBx> listCategory;
    protected void Page_Load(object sender, EventArgs e)
    {
        ServicesManager SM = new ServicesManager();
        listService = SM.GetList();
    }
}