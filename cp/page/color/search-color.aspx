<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search-color.aspx.cs" Inherits="cp_page_color_search_color" %>
<link href="/cp/page/service/StyleSheet.css" rel="stylesheet" />
<script src="/cp/page/service/bootstrap-table-pagination.js"></script>
<script src="/cp/page/service/pagination.js"></script>
<table class="table table-bordered">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Brand</th>
                        <th>Color</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="developers">
                    <%foreach (var item in result)
                        {%>
                    <tr>
                        <td><%=item.ID %></td>
                        <td><%=item.Name %></td>
                        <td data-id="<%=item.BrandID %>"><%=BM.GetByID((int)item.BrandID).Name %></td>
                        <td><%=item.HexCode %></td>
                        <td>
                            <a class="btn btn-info" onclick="OpenModal(<%=item.ID %>,this)"><i class="fa fa-edit" style="font-size: 15px; right: 10px"></i></a>
                            <button class="btn" onclick="Delete(<%=item.ID %>,this)"><i class="fa fa-trash" style="font-size: 15px"></i></button>
                              
                       
                            
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
<div class="col-md-12 text-center">
	<ul class="pagination pagination-lg pager" id="developer_page"></ul>
</div>