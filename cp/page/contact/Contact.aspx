<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="cp_page_contact_Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Breadcrumbs-->
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">Contact</li>
    </ol>



    <button class="btn btn-success" onclick="location.href='/cp/page/contact/Add.aspx'">Add New Contact</button>
    <p></p>

    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">Name</th>
                <th class="text-center">Email</th>
                <th class="text-center">Phone</th>
               
                <th class="text-center">Ip</th>
                <th class="text-center">Createday</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%for (int i = listContact.Count - 1; i > -1; i--)
                { %>
            <tr>

                <td><%=listContact[i].Name%></td>
                <td><%=listContact[i].Email%></td>
                <td><%=listContact[i].Phone%></td>
           
                <td><%=listContact[i].Ip%></td>
                <td><%=listContact[i].CreateDay%></td>

                <td class="text-center">
                    <button type="button"><i class="fa fa-edit" style="font-size: 15px; right: 10px" onclick="Edit(<%=listContact[i].Id%>)"></i></button>
                    <button type="button"><i class="fa fa-trash" style="font-size: 15px" onclick="clickdelete(<%=listContact[i].Id%>)"></i></button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>
    <script>
        function clickdelete(id) {
            alertify.confirm('Are you sure Delete?', function () {
                $.post("/cp/do/contact/delete-contact.aspx", {
                    id: id
                }, function (data) {
                    if (data == 1) {
                        alertify.success('Delete!');
                        location.href = "/cp/page/contact/Contact.aspx";
                    }

                    else {
                        alertify.alert("Error",data);
                    }
                });
            })
        }
        function Edit(id) {
            location.href ="/cp/page/contact/Edit.aspx?id=" + id;
        }

    </script>

</asp:Content>

