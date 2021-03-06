﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search-brand.aspx.cs" Inherits="cp_page_color_search_brand" %>
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
                <tbody>
                    <%foreach (var item in result1)
                        {%>
                    <tr>
                        <td><%=item.ID %></td>
                        <td><%=item.Name %></td>
                        <td data-id="<%=item.BrandID %>"><%=BM.GetByID((int)item.BrandID).Name %></td>
                        <%--<td data-id="<%=item.BrandID %>"><%=item.BrandID %></td>--%>
                        <td><%=item.HexCode %></td>
                        <td>
                            <a class="btn btn-info" onclick="OpenModal(<%=item.ID %>,this)"><i class="fa fa-edit" style="font-size: 15px; right: 10px"></i></a>
                            <button class="btn" onclick="Delete(<%=item.ID %>,this)"><i class="fa fa-trash" style="font-size: 15px"></i></button> 
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>
