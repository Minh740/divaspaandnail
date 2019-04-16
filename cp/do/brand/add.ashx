<%@ WebHandler Language="C#" Class="add" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class add : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            string name = context.Request["name"];
            BrandManager BM = new BrandManager();
            BrandTBx brand = new BrandTBx();
            brand.Name = name;
            brand.Status = 1;
            BM.Add(brand);
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}