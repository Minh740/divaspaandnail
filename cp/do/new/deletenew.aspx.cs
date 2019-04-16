using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
public partial class cp_do_new_deletenew : System.Web.UI.Page
{
    public NewsTBx delete;
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            int id = Convert.ToInt32(Request["id"]);
            NewManager cm = new NewManager();
            delete = cm.GetByID(id);
            delete.NewsStatus = -1;
            cm.Save();
            Response.Write(1);
        }
        catch (Exception ex)
        {
            Response.Write(ex);
        }
    }
}