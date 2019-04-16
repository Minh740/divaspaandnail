using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_imagecategory_delete : System.Web.UI.Page
{
    public ImageCategoryTBx delete;
    protected void Page_Load(object sender, EventArgs e)
    {
    
        try
        {
            int id = Convert.ToInt32(Request["id"]);
            ImageCategoryManager im = new ImageCategoryManager();
            delete = im.GetByID(id);
            delete.Status = -1;
            im.Save();
            Response.Write(1);
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}