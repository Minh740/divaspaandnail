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
            ColorManager CM = new ColorManager();
            CM.Delete(id);
            context.Response.Write(JsonConvert.SerializeObject(new
            {
                success = 1,
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