using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_add_new_contact : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string name = Request["name"];
        string phone = Request["phone"];
        string email = Request["email"];
        string content = Request["content"];
        string ip = Request["ip"];
       



        ContactManager CM = new ContactManager();
        ContactTBx addnewcontact = new ContactTBx();
        addnewcontact.Name = name;
        addnewcontact.Email = email;
        addnewcontact.Phone = phone;
        addnewcontact.Ip = ip;
        addnewcontact.BodyContent = content;
        addnewcontact.CreateDay = DateTime.Now;
        addnewcontact.Status = 1;
        CM.AddNew(addnewcontact);
        Response.Write(1);
    }
}