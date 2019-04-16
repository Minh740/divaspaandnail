<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Page.aspx.cs" Inherits="cp_page_page_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#">Dashboard</a></li>
        <li class="breadcrumb-item active">Page</li>
    </ol>

    <!--<a class="btn btn btn-success" href="/cp-add-page">Add New Page</a>-->
    <p></p>
    
        <table class="table table-bordered">
            <tbody>
                <tr>
                    <th class="text-center">Name</th>
                    <th class="text-center">Title</th>
                    <th colspan="2" class="text-center">Action</th>
                </tr>
                <%foreach (var page in listPage)
                    {
                %>
                <tr>
                    <td><%=page.Name%></td>
                    <td><%=page.Title%></td>
                    <td class="text-center">
                        <a class="btn btn-info" href="cp-edit-page-<%=page.ID %>">
                            <i class="fa fa-edit" style="font-size: 15px; right: 10px"></i>
                        </a>
                        <button  class="btn" onclick="Delete(this,<%=page.ID%>)">
                            <i class="fa fa-trash" style="font-size: 15px"></i>
                        </button>
                    </td>
                </tr>
                <%} %>
            </tbody>
        </table>
   
    <script>
        $(function () {
            tinymce.init({
                selector: "textarea.page",
                theme: "modern",
                height: 300,
                forced_root_block: "",
                plugins: [
                    ""
                ],
                toolbar: "",
                content_css: ["/cp/css-tiny/style.css"]
            });

        })
        function Delete(input, id) {
            $(input).prop("disable", true);
            ShowLoading();
            alertify.confirm('Are you sure Delete', function () {
                $.ajax({
                    url: "/cp/do/page/delete.aspx",
                    data: {
                        id: id
                    },
                    success: function (data) {
                        data = JSON.parse(data);
                        if (data.success == -1) {
                            console.log(data.error);
                            alertify.error("Error. Please try again");
                        }
                        else {
                            location.href = "/cp-page";
                        }
                        $(input).prop("disable", false);
                        HideLoading();
                    },
                    error: function (error) {
                        console.log(error);
                        $(input).prop("disable", false);
                        HideLoading();
                        alertify.error("Error. Please try again");
                    }
                })
            })


        }
    </script>

</asp:Content>

