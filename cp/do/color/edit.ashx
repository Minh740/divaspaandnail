<%@ WebHandler Language="C#" Class="edit" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class edit : IHttpHandler {
    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        try
        {
            int ID = Convert.ToInt32(context.Request["id"]);
            ColorManager CM = new ColorManager();
            ColorTBx color = CM.GetByID(ID);
            color.Name = context.Request["name"];
            color.BrandID = Convert.ToInt32(context.Request["brandID"]);
            color.HexCode = context.Request["hex"];
            CM.Save();
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