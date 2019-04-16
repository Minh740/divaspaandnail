<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="AddNew.aspx.cs" Inherits="cp_page_new_AddNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp/page/new/New.aspx">New</a></li>
        <li class="breadcrumb-item active">Add New </li>
    </ol>
    <div class="col-md-12 form-group">
        <label>Name</label>
        <input type="text" id="txtName" class="form-control" />
    </div>
    <div class="col-md-12 form-group">
        <label>Description</label>
        <textarea class="form-control tinymce" id="txtDescription"></textarea>
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/new/New.aspx">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this)">Submit</button>
    </div>


    <script>
                function Submit(input) {
            ShowLoading();
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var name = $("#txtName").val();
           
            var description = tinymce.get("txtDescription").getContent();
            $.ajax({
                url: "/cp/do/new/addnew.aspx",
                method: "post",
                data: {
                    name: name,                   
                    description: description
                },
                success: function (data) {
                    data = JSON.parse(data);
                    if (data.success == -1) {
                        console.log(data.error);
                        alertify.error("Error. Please try again");
                    } else {
                        location.href = "/cp/page/new/New.aspx";
                         alertify.error("Susses");
                    }
                    
                }
            })
        }
    </script>
</asp:Content>

