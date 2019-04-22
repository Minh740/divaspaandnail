<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search-service.aspx.cs" Inherits="cp_page_service_search_service" %>

<link href="/cp/page/service/StyleSheet.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
    <script src="/cp/page/service/bootstrap-table-pagination.js"></script>
    <script src="/cp/page/service/pagination.js"></script>
<table class="table table-bordered">
        <tbody id="developers">
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
           <td><%=i.CategoryTBx.Name%></td>
         
            <td>
                <a class="btn btn-info" href="/cp-edit-service-<%=i.ID %>">
                        <i class="fa fa-edit" style="font-size: 15px; right: 10px" aria-disabled="true"></i>
                    </a>
                    <a class="btn" onclick="Delete(this,<%=i.ID%>)" value="disable">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </a>
                <%--<button class="btn btn-primary" onclick="Edit(<%=i.RewardID%>)">Edit</button>--%>
            </td>
        </tr>
        <% }
            }%>
    </tbody>
</table>
<div class="col-md-12 text-center">
			    <ul class="pagination pagination-lg pager" id="developer_page"></ul>
</div>