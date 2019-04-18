<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search-service.aspx.cs" Inherits="cp_page_service_search_service" %>
<table class="table">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center">Order</th>
                <th class="text-center">Price</th>
                <th class="text-center">Category</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>


        <%if (result.Count == 0)
            {%>
        <tr>
            <td>No result</td>
        </tr>
        <%}
            else
            {
                ServicesManager sm = new ServicesManager();
                            
                foreach (var i in result)
                { %>
        <tr >

            <td><%=i.ID %></td>
            <td><%=i.Name %></td>
            <td><%=i.Order %></td>
            <td><%=i.Price %></td>
           <td><%=i.CategoryID%></td>
         
            <td>

                        <a class="btn btn-info" onclick="Edit(<%=i.ID%>)">
                            <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                        </a>
                         <a class="btn" onclick="Delete(<%=i.ID%>)">
                             <i class="fa fa-trash" style="font-size: 15px"></i>
                         </a>
                <%--<button class="btn btn-primary" onclick="Edit(<%=i.RewardID%>)">Edit</button>--%>
            </td>
        </tr>
        <% }
            }%>
    </tbody>
</table>