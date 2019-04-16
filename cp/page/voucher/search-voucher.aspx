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
                <div class="dropdown">
                                <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Action
                                            <span class="caret"></span></button>

                                    <ul class="dropdown-menu" style="padding:5px">
                                        <li style="float:left;margin-left:5px"><button class="btn btn-success" onclick="Edit(<%=i.VoucherID%>)">Edit</button></li>
                                        <li style="float:left;margin-left:5px"><button class="btn btn-danger" onclick="Delete(<%=i.VoucherID%>)">Delete</button></li>
                                    </ul>
                                
                                </div>
                <%--<button class="btn btn-primary" onclick="Edit(<%=i.RewardID%>)">Edit</button>--%>
            </td>
        </tr>
        <% }
            }%>
    </tbody>
</table>
