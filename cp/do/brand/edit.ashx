<%@ WebHandler Language="C#" Class="edit" %>

using System;
using System.Web;
using Newtonsoft.Json;

public class edit : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        context.Response.ContentType = "text/plain";
        try
        {
            string name = context.Request["name"];
            int ID = Convert.ToInt32(context.Request["id"]);
            BrandManager BM = new BrandManager();
            BrandTBx brand = BM.GetByID(ID);
            brand.Name = name;
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
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}