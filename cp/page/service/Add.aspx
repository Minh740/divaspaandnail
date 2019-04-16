<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" ValidateRequest="false" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="cp_page_service_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp-service">Service</a></li>
        <li class="breadcrumb-item active">Add New Service</li>
    </ol>
    <div class="col-md-6 form-group">
        <label>Name</label>
        <input type="text" id="txtName" class="form-control" />
    </div>
    <div class="col-md-6 form-group">
        <label>Category</label>
        <select class="form-control" id="txtCategory">
            <%foreach (var item in listCategory)
                {%>
            <option value="<%=item.ID %>"><%=item.Name %></option>
            <%} %>
        </select>
    </div>
    <div class="col-md-6 form-group">
        <label>Price</label>
        <input type="text" id="txtPrice" class="form-control" />
    </div>
    <div class="col-md-12 form-group">
        <label>Description</label>
        <textarea class="form-control tinymce" id="txtDescription"></textarea>
    </div>
    <div class="form-group">
        <a class="btn btn-danger" href="/cp-service">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this) ">Submit</button>
    </div>

    <script>
        function Submit(input) {
            ShowLoading();
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var name = $("#txtName").val();
            var categoryID = $("#txtCategory").val();
            var price = $("#txtPrice").val();
            var description = tinymce.get("txtDescription").getContent();
            $.ajax({
                url: "/cp/do/service/add.aspx",
                method: "post",
                data: {
                    name: name,
                    categoryID: categoryID,
                    price: price,
                    description: description
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


