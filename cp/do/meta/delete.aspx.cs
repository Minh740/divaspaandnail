using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_delete_meta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        MetaManager MM = new MetaManager();
        MetaTBx meta = MM.GetByID(id);
        meta.Status = -1;
        MM.Save();
        Response.Write(1);
    }
}