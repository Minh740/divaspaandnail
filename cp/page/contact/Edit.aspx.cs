using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_contact_Edit : System.Web.UI.Page
{
    public ContactTBx EditContact = new ContactTBx();
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(Request["id"]);
        ContactManager CM = new ContactManager();
        EditContact = CM.GetByID(id);

    }
}