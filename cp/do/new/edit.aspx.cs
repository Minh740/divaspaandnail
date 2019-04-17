using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_do_new_edit : System.Web.UI.Page
{
    public NewsTBx edit;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(Request["id"]);
            string name = Request["name"];
            string content = Request["description"];
            NewManager NM = new NewManager();
            edit = NM.GetByID(id);
            edit.NewsName = name;
            edit.NewsContent = content;
            NM.Save();
            Response.Write(1);
        }
        catch (Exception ex)
        {

           Response.Write(ex);
        }
    }
}