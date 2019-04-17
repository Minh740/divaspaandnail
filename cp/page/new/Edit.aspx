<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="cp_page_new_Edit" %>

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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="#">Dashboard</a>
        </li>
        <li class="breadcrumb-item"><a href="/cp/page/new/Edit.aspx"> Edit New</a></li>
        <li class="breadcrumb-item active">Edit New </li>
    </ol>
    <div class="col-md-12 form-group">
        <label>Name</label>
        <input type="text" id="txtName" value="<%=edit1.NewsName%>" class="form-control" />
    </div>
    <div class="col-md-12 form-group">
        <label>Description</label>
        <textarea class="form-control tinymce" id="txtDescription"><%=edit1.NewsContent%></textarea>
    </div>

    <div class="form-group">
        <a class="btn btn-danger" href="/cp/page/new/Edit.aspx">Cancel</a>
        <button class="btn btn-info" onclick="Submit(this,<%=edit1.NewsID%>)">Edit </button>
    </div>


    <script>


                function Submit(input,id) {
            ShowLoading();
            $(input).prop("disabled", true);
            $(input).text("Submitting");
            var name = $("#txtName").val();
           
            var description = tinymce.get("txtDescription").getContent();
            $.post("/cp/do/new/edit.aspx", {
                     
                id: id,
                name: name,
                description: description
                    
            }, function (data) {
                if (data == 1) {
                    alertify.alert("Success");
                    location.href = "/cp/page/new/New.aspx";
                }
                else {
                    alertify.alert("Error", data);
                  
                }
            });
        }
    </script>
</asp:Content>

