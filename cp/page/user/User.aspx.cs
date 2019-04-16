using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cp_page_user_User : System.Web.UI.Page
{
    protected List<UsersTbx> listUser;
    protected void Page_Load(object sender, EventArgs e)
    {
        UserManager UM = new UserManager();
        listUser = UM.GetUserList();

    }
}