<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="cp_page_category_Edit" %>

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
        <input type="text" id="txtName" class="form-control" value="<%=category.Name %>" />
    </div>
    <div class="col-md-6 form-group">
        <label>Parent</label>

        <select class="form-control" id="txtParent">
            <option value="0">NONE</option>
            <%foreach (var item in listParent)
                {
                    if (item.ID == category.ParentID)
                    {
            %>
            <option value="<%=item.ID %>" selected><%=item.Name %></option>
            <%}
                else
                { %>
            <option value="<%=item.ID %>"><%=item.Name %></option>
            <%}
                } %>
        </select>
    </div>
    <div class="col-md-12 form-group">
        <label>Description</label>
        <textarea class="form-control tinymce" id="txtDescription"><%=category.Description %></textarea>
    </div>
    <div class="col-md-6 form-group">
        <label>Order</label>
        <input type="text" id="txtOrder" class="form-control" value="<%=category.Order%>" />
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp-category">Cancel</a>
        <button class="btn btn-info" onclick="Submit(<%=category.ID%>,this)">Submit</button>
    </div>

    <script>
        function Submit(ID, input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            ShowLoading();
            
            var order= $("#txtOrder").val();
            var name = $("#txtName").val();
            var parentID = $("#txtParent").val();
            var description = tinymce.get("txtDescription").getContent();
            $.ajax({
                url: "/cp/do/category/edit.aspx",
                method: "post",
                data: {
                    order:order,
                    name: name,
                    parentID: parentID,
                    description: description,
                    ID: ID
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
                    HideLoading();
                    console.log(error);
                    alertify.error("Error. Please try again");
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                }
            })
        }

    </script>
</asp:Content>

