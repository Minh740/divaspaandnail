using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class do_edit_contact : System.Web.UI.Page
{
    public ContactTBx editcontact1 = new ContactTBx();
    protected void Page_Load(object sender, EventArgs e)
    {
       
            int id = Convert.ToInt32(Request["id"]);
            string name = Request["name"];
            string phone = Request["phone"];
            string email = Request["email"];
            string ip = Request["ip"];
            string bodycontent = Request["bodycontent"];
            ContactManager CM = new ContactManager();
            editcontact1 = CM.GetByID(id);

        
        {
            editcontact1.Name = name;
            editcontact1.Email = email;
            editcontact1.Phone = phone;
            editcontact1.Ip = ip;
            editcontact1.BodyContent = bodycontent;
        
           
            CM.Save();
            Response.Write(1);
        }
    }
}