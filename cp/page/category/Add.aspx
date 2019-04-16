<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="cp_page_category_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp-category">Category</a></li>
        <li class="breadcrumb-item active">Add New Category</li>
    </ol>
    <div class="col-md-6 form-group">
        <label>Name</label>
        <input type="text" id="txtName" class="form-control" />
    </div>
    <div class="col-md-6 form-group">
        <label>MAIN CATEGORY</label>

        <select class="form-control" id="txtParent">
            <option value="0">NONE</option>
            <%foreach (var item in listParent)
                {%>
            <option value="<%=item.ID %>"><%=item.Name %></option>
            <%} %>
        </select>
    </div>
    <div class="col-md-12 form-group">
        <label>Description</label>
        <textarea class="form-control tinymce" id="txtDescription"></textarea>
    </div>
    <div class="col-md-6 form-group">
        <label>Order</label>
        <input type="text" id="txtOrder" class="form-control" />
    </div>
    <div class="form-group">
        <a class="btn btn-danger" href="/cp-category">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this)">Submit</button>
    </div>

    <script>
        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            ShowLoading();
             var order = $("#txtOrder").val();
            var name = $("#txtName").val();
            var parentID = $("#txtParent").val();
            var description = $("#txtDescription").val();
            $.ajax({
                url: "/cp/do/category/add.aspx",
                method: "post",
                data: {
                    order: order,
                    name: name,
                    parentID: parentID,
                    description: description
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        location.href = "/cp-category";
                    }
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    HideLoading();
                },
                error: function (error) {
                    console.log(error);
                    alertify.error("Error. Please try again");
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    HideLoading();
                }
            })
        }

    </script>
</asp:Content>

