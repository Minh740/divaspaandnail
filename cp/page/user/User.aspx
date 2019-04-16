<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="cp_page_user_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">User</li>
    </ol>

    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Email</th>
                <th class="text-center">Phone</th>
                <th class="text-center">First Name</th>
                <th class="text-center">Last Name</th>
                <th class="text-center">Create date</th>
            </tr>
            <%foreach (var user in listUser)
                {
            %>
            <tr>

                <td><%=user.UserId%></td>
                <td><%=user.Email%></td>
                <td><%=user.PhoneNumber%></td>
                <td><%=user.FirstName%></td>
                <td><%=user.LastName%></td>
                <td><%=user.RegisterDate%></td>
            </tr>
            <%} %>
        </tbody>
    </table>
</asp:Content>

