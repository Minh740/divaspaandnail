using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_user_User : System.Web.UI.Page
{

    public List<UsersTbx> list;
    protected string[] level;

    protected void Page_Load(object sender, EventArgs e)
    {
        UserManager um = new UserManager();
        list = um.GetUserList();
        list.Reverse();
        list = list.ToList();
        Page.Title = "Users";
        level = new string[4] { "-", "Silver", "Gold", "Platinum" };
    }
}