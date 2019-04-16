<%@ WebHandler Language="C#" Class="add" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class add : IHttpHandler {
    
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            string email = context.Request["email"];
            UserManager UM = new UserManager();
            if (UM.GetUserByUserEmail(email) == null)
            {
                UsersTbx user = new UsersTbx();
                user.Email = email;
                user.FirstName = context.Request["fName"];
                user.LastName = context.Request["lName"];
                user.Password = UTIL.Encrypt(context.Request["password"], true);
                user.PhoneNumber = context.Request["phone"];
                user.TotalReward = Convert.ToInt32(context.Request["reward"]);
                user.Birthday = DateTime.Parse(context.Request["birthday"]).ToShortDateString();
                user.UserLevel = 0;
                user.UserCredit = 0;
                user.Token = UTIL.RemoveSpecial(UTIL.Encrypt(email, true));
                user.Active = true;
                user.RegisterDate = DateTime.Now;
                user.Status = 1;
                UM.AddUser(user);
                context.Response.Write(JsonConvert.SerializeObject(new
                {
                    success = 1
                }));
            }
            else
            {
                context.Response.Write(JsonConvert.SerializeObject(new
                {
                    success = 0
                }));

            }
        }
        catch (Exception ex)
        {
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = -1,
                error = ex
            }));
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}