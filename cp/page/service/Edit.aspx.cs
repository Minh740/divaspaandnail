using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_service_Edit : System.Web.UI.Page
{
    protected List<CategoryTBx> listCategory;
    protected ServicesTBx service;
    protected void Page_Load(object sender, EventArgs e)
    {
        CategoryManager CM = new CategoryManager();
        listCategory = CM.GetList();
        ServicesManager SM = new ServicesManager();
        int ID = Convert.ToInt32(Page.RouteData.Values["serviceID"]);
        service = SM.GetByID(ID);
    }
}