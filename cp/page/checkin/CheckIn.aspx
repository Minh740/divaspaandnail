<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="CheckIn.aspx.cs" Inherits="cp_page_checkin_CheckIn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Page header -->
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">CheckIn</li>
    </ol>
   <%-- <a class="btn btn-success" href="/cp-add-gallery">Add New Gallery</a>--%>
    <p></p>
       <!-- ./ Page header -->

    <!-- BODY CONTENT -->
    <div class="panel panel-flat">
        <div class="panel-heading">
            <div class="col-md-6 col-md-offset-3">
            </div>

            <h7 class="panel-title" style="width: 150px"><span class="icon-user"></span>Users (<%=list.Count %>)</h7>
            <div class="heading-elements">
            </div>
        </div>

        <div class="table" id="tblUsers" style="height: 55vh; overflow: scroll">
            <table class="table">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>FirstName</th>
                        <th>LastName</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Check In Date</th>
                     

                    </tr>
                </thead>
                <tbody id="tbody-user">
                    <%
                        UserManager UM = new UserManager();
                        int pos = 0; 
                        foreach (var i in list)
                        {
                          UsersTbx user = UM.GetByID((int)i.UserId);
                          pos++;
                           %>
                    <tr>
                        <td><%= pos +"." %></td>
                        <td><%= user.FirstName  %></td>
                        <td><%= user.LastName  %></td>
                               <td><%= user.Email  %></td>
                               <td><%= user.PhoneNumber  %></td>
                               <td><%= i.CheckInDay  %></td>
                             
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!--.BODY CONTENT-->

</asp:Content>

