using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_check_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        string email = Request["email"];
        string password = Request["password"];
        string UTILpassword = UTIL.Encrypt(password, true);
        
        UserManager um = new UserManager();
        UsersTbx user = um.GetUserByUserEmail(email);
        if(user.Email == email && user.Password == UTILpassword)
        {
            string token = UTIL.Encrypt((email +"**"+ password), true);
            Session["user"] = user;
            Response.Write(token);

        }
        else
        {
            Response.Write("");
        }

    }
}