<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Image.aspx.cs" Inherits="cp_page_image_Image" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .fileUpload {
            position: relative;
            width: fit-content;
        }

            .fileUpload .upload {
                position: absolute;
                top: 0;
                left: 0;
                margin: 0;
                padding: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
                opacity: 0;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp-image">Image</a></li>
        <li class="breadcrumb-item active">Add New Image</li>
    </ol>

    <div class="col-md-6 form-group">
        <img src="" id="preview" width="100%" />
        <div class="fileUpload btn btn-info btn-upload">
            <span>+ Thêm ảnh</span>
            <input type="file" onchange="Preview(event,this)" accept="image/*" class="upload" />
        </div>
        <button class="btn  btn-primary" onclick="Submit(this)">Upload</button>
    </div>

    <table class="table table-bordered">
        <tbody>
            <tr>
                <th class="text-center">ID</th>
                <th class="text-center">Name</th>
                <th class="text-center" width="400px">Image</th>
            </tr>
            <%
                var i = 1;
                foreach (var item in listFile)
                {%>
            <tr>
                <td><%=i++ %></td>
                <td>/upload/image/<%=item %></td>
                <td>
                    <img src="/upload/image/<%=item %>" width="100%" />
                </td>
            </tr>
            <%} %>
        </tbody>
    </table>




    <script>
        var base64 = "";
        function Preview(event) {
            var input = event.target;
            if (input.files) {
                var reader = new FileReader();
                reader.fileName = input.files[0].name;
                reader.onload = function (e) {
                    base64 = e.target.result.replace(/^data:image\/[a-z]+;base64,/, "");
                    $("#preview").attr("src", e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        };
        function Submit(input) {
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            ShowLoading();
            $.ajax({
                url: "/cp/do/image/add.aspx",
                method: "post",
                data: {
                    base64: base64,
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        location.href = "/cp-image";
                    }
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    HideLoading();
                },
                error: function (error) {
                    $(input).prop("disabled", false);
                    $(input).text("Submit");
                    console.log(error);
                    alertify.error("Error. Please try again");
                    HideLoading();
                }
            })
        }
    </script>
</asp:Content>


