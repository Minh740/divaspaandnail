using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class api_register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.AppendHeader("Access-Control-Allow-Origin", "*");
        string fname = Request["fname"];
        string lname = Request["lname"];
        string pass = Request["password"];
        string password = UTIL.Encrypt(pass, true);
        string email = Request["email"];
        string phonenumber = Request["phoneNumber"];
        string birthday = DateTime.Parse(Request["birthday"]).ToShortDateString();
        //string birthday = DateTime.Now;// DateTime.Parse(Request["birthday"]).ToShortDateString();
        try
        {
            DataClassesDataContext db = new DataClassesDataContext();
            UserManager um = new UserManager();
            UsersTbx user = um.GetUserByUserEmail(email);
            if (user != null)
            {
                if (user.Email != null)
                {
                    Response.Write(-1);
                    return;
                }
            }
            else
            {
                UsersTbx u = new UsersTbx();
                u.FirstName = fname;
                u.LastName = lname;
                u.Password = password;
                u.Email = email;
                u.PhoneNumber = phonenumber;
                u.Birthday = birthday;
                u.Active = true;
                u.Status = 1;
                u.UserLevel = 0;
                u.TotalReward = 0;
                u.UserCredit = 0;
                u.RegisterDate = DateTime.UtcNow;
                um.AddUser(u);
                db.SubmitChanges();
                Response.Write(1);
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());

        }
    }
}