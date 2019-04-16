using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_category_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int order = Convert.ToInt32(Request["order"]);
            string name = Request["name"];
            string description = Request["description"];
            int categoryID = Convert.ToInt32(Request["ID"]);
            CategoryManager CM = new CategoryManager();
            CategoryTBx category = CM.GetByID(categoryID);
            category.Name = Request["name"];
            if (Convert.ToInt32(Request["parentID"]) != 0)
                category.ParentID = Convert.ToInt32(Request["parentID"]);
            category.Description = Request["description"];
            category.Order = order;
            category.Status = 1;
            category.Description = description;
            category.Name = name;
            CM.Save();
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