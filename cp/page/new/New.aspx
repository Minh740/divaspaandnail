<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="New.aspx.cs" Inherits="cp_page_new_New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item active">New</li>
    </ol>
    <a class="btn btn-success" href="/cp/page/new/AddNew.aspx">Add New</a>
    <p></p>
    <table class="table table-bordered">
        <tbody>
            <tr>
                <th id="txtId"  class="text-center">ID</th>
                <th id="txtName" class="text-center">Name</th>
                <th id="txtContent" class="text-center" width="200px">Content</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <%foreach (var new2 in list)
                {
            %>
            <tr>
                <td><%=new2.NewsID%></td>
                <td><%=new2.NewsName%></td>
                <td>
                    <%=new2.NewsContent%>
                </td>
                <td class="text-center">
                    <a class="btn btn-info" href="/cp-edit-new-<%=new2.NewsID%>" >
                        <i class="fa fa-edit" style="font-size: 15px"></i>
                    </a>
                    <button class="btn" onclick="Delete(this,<%=new2.NewsID%>)">
                        <i class="fa fa-trash" style="font-size: 15px"></i>
                    </button>
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>


    <script>
    
         function Delete(input, id) {
            alertify.confirm("Are you sure Delete", function () {
                $(input).prop("disabled", true);
                ShowLoading();
                $.ajax({
                    url: "/cp/do/new/deletenew.aspx",
                    method: "post",
                    data: {
                        id: id,
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            alertify.error("Error. Please try again");
                            console.log(data);
                        }
                        else {
                            location.href = "/cp/page/new/New.aspx";
                        }
                      
                    }
                })
            });

        }
    </script>
</asp:Content>

