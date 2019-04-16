<%@ Page Title="" Language="C#" MasterPageFile="~/cp/MasterPage.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="cp_page_contact_Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="#"></a>Dashboard</li>
        <li class="breadcrumb-item active"><a href="Edit-Contact.aspx"></a></li>
        <li class="breadcrumb-item active">Edit-Contact</li>
    </ol>
    <form>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtName" class="form-control" placeholder="Name" value="<%=EditContact.Name %>" required="required" autofocus="autofocus" />
                        <label for="txtName">Name</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtPhone" class="form-control" placeholder="Phone" value="<%=EditContact.Phone %>" required="required" autofocus="autofocus" />
                        <label for="txtPhone">Phone</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtEmail" class="form-control" placeholder="Email" value="<%=EditContact.Email %>" required="required" autofocus="autofocus" />
                        <label for="txtEmail">Email</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-label-group">
                        <input type="text" id="txtIp" class="form-control" placeholder="Ip" value="<%=EditContact.Ip%>" required="required" autofocus="autofocus" />
                        <label for="txtIp">Ip</label>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="form-row">
                <div class="col-md-12">
                    <label for="txtBodyContent">Body Content</label>
                    <div class="form-label-group">
                        <textarea  id="txtBodyContent" class="form-control tinymce"><%=EditContact.BodyContent%></textarea>
                        
                    </div>
                </div>
            </div>
        </div>

        <button type="button" class="btn btn-primary" onclick="edit(<%=EditContact.Id%>)">Submit</button>
        <button type="button" class="btn btn-info" onclick="Cancel()">Cancel</button>

    </form>
    <script>
        function edit(id) {
            var name = $("#txtName").val();
            var phone = $("#txtPhone").val();
            var email = $("#txtEmail").val();
            var ip = $("#txtIp").val();
            var bodycontent = tinymce.get("txtBodyContent").getContent();

            $.post("/cp/do/contact/edit.aspx", {
                id: id,
                name: name,
                phone: phone,
                email: email,
                ip: ip,
                bodycontent: bodycontent,
            }, function (data) {
                if (data == 1) {
                    alertify.alert("Success");
                    location.href = "/cp/page/contact/Contact.aspx";
                }
                else {
                    alertify.alert("Error", data)
                }
            })

        }
        function Cancel() {
            location.href = "/cp/page/contact/Contact.aspx";
        }
    </script>
</asp:Content>

