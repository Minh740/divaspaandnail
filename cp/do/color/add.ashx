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
            ColorTBx color = new ColorTBx();
            color.Name = context.Request["name"];
            color.BrandID = Convert.ToInt32(context.Request["brandID"]);
            color.Status = 1;
            color.HexCode = context.Request["hex"];
            ColorManager CM = new ColorManager();
            CM.Add(color);
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