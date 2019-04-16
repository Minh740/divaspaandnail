<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search-voucher.aspx.cs" Inherits="cp_page_voucher_search_voucher" %>
<table class="table">
    <thead>
        <tr>
            <th>VoucherID</th>
            <th>VoucherName</th>
            <th>VoucherMinCost</th>
            <th>VoucherDefaultCost</th>
            <th>VoucherCode</th>
            <th>UserId</th>
            <th>Action</th>
            
        </tr>
    </thead>
    <tbody>
        <%if (result.Count == 0)
            {%>
        <tr>
            <td>No result</td>
        </tr>
        <%}
            else
            {
                UserManager um = new UserManager();
                
                VoucherManager r = new VoucherManager();
                foreach (var i in result)
                { %>
        <tr class="model_<%=i.VoucherID %>">

            <td><%=i.VoucherID %></td>
            <td><%=i.VoucherName %></td>
            <td><%=i.VoucherMinCost %></td>
            <td><%=i.VoucherDefaultCost %></td>
           <td><%=i.VoucherCode%></td>
           <td><%=i.UserId%></td>
            <td>

                        <a class="btn btn-info" onclick="Edit(<%=i.VoucherID%>)">
                            <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                        </a>
                         <a class="btn" onclick="Delete(<%=i.VoucherID%>)">
                             <i class="fa fa-trash" style="font-size: 15px"></i>
                         </a>
                <%--<button class="btn btn-primary" onclick="Edit(<%=i.RewardID%>)">Edit</button>--%>
            </td>
        </tr>
        <% }
            }%>
    </tbody>
</table>
