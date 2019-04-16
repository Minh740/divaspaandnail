<%@ WebHandler Language="C#" Class="delete" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class delete : IHttpHandler {
    
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            int id = Convert.ToInt32(context.Request["id"]);
            BookingManager BM = new BookingManager();
            BM.GetByID(id).Status = -1;
            BM.Save();
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1
            }));
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