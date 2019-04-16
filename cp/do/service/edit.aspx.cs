using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_service_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            ServicesManager SM = new ServicesManager();
            int ID = Convert.ToInt32(Request["ID"]);
            ServicesTBx service = SM.GetByID(ID);
            service.Name = Request["name"];
            service.CategoryID = Convert.ToInt32(Request["categoryID"]);
            service.Description = Request["description"];
            service.Price = Request["price"];
            SM.Save();
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