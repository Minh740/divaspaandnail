using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_category_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            CategoryManager CM = new CategoryManager();
            CategoryTBx category = new CategoryTBx();
            category.Name = Request["name"];
            category.Order =Convert.ToInt32( Request["order"]);
            if (Convert.ToInt32(Request["parentID"]) != 0)
                category.ParentID = Convert.ToInt32(Request["parentID"]);
            category.Description = Request["description"];
         
            category.Status = 1;
            CM.AddNew(category);
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