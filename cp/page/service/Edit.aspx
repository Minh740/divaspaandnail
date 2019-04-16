<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="cp_page_service_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp-category">Service</a></li>
        <li class="breadcrumb-item active">Edit New Category</li>
    </ol>
    <div class="col-md-6 form-group">
        <label>Name</label>
        <input type="text" id="txtName" class="form-control" value="<%=service.Name %>" />
    </div>
    <div class="col-md-6 form-group">
        <label>Category</label>
        <select class="form-control" id="txtCategory">
            <%foreach (var item in listCategory)
                {
                    if (item.ID == service.CategoryID)
                    {
            %>
            <option value="<%=item.ID %>"><%=item.Name %></option>
            <%}
                else
                { %>
            <option value="<%=item.ID %>"><%=item.Name %></option>
            <%}
                } %>
        </select>
    </div>
    <div class="col-md-6 form-group">
        <label>Price</label>
        <input type="text" id="txtPrice" class="form-control" value="<%=service.Price %>" />
    </div>
    <div class="col-md-12 form-group">
        <label>Description</label>
        <textarea class="form-control tinymce" id="txtDescription"><%=service.Description %></textarea>
    </div>
    <div class="form-group">
        <a class="btn btn-danger" href="/cp-category">Cancel</a>
        <button id="disable" class="btn btn-info" onclick="Submit(<%=service.ID%>,this)">Submit</button>
    </div>

    <script>
        function Submit(ID, input) {
            ShowLoading();
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var name = $("#txtName").val();
            var categoryID = $("#txtCategory").val();
            var price = $("#txtPrice").val();
            var description = tinymce.get("txtDescription").getContent();
            $.ajax({
                url: "/cp/do/service/edit.aspx",
                method: "post",
                data: {
                    name: name,
                    categoryID: categoryID,
                    price: price,
                    description: description,
                    ID: ID
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        location.href = "/cp-service";
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

