using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_delete_contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var id = Convert.ToInt32(Request["id"]);
        ContactManager CM = new ContactManager();
        ContactTBx deletecontact = CM.GetByID(id);
        deletecontact.Status = -1;
        CM.Save();
        Response.Write(1);
    }
}