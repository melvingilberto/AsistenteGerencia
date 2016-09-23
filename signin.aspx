<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="sigin">
            <h2>REGISTRATE!</h2>
            <p>Eficiencia y eficacia en la administración de tus empleados</p>
            <%
                string msg = Request.QueryString["msg"];
                if (msg != null)
                {
                    Response.Write("<h3 class='text-danger'>Error "+msg+"</h3>");
                }
            %>
        </div>
    </div>
    <div class="sigin-form">
        <div class="container">
            <div class="col-md-5 col-md-offset-3">
                <form id="form1" runat="server">
                    <div class="form-group">
                        <label>First Name</label>
                        <asp:TextBox ID="fname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Ingrese su primer nombre" CssClass="text-danger" ControlToValidate="fname"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <asp:TextBox ID="lname" runat="server" CssClass="form-control" ControlToValidate="fname"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese su apellido" CssClass="text-danger" ControlToValidate="lname"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese su correo" CssClass="text-danger" ControlToValidate="email"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Debe tener formato de correo electronico" CssClass="text-warning" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <asp:TextBox ID="Password" TextMode="Password" name="password" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Company name</label>
                        <asp:TextBox ID="cname" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Ingrese el nombre de la compañia" CssClass="text-danger" ControlToValidate="cname"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Company email</label>
                        <asp:TextBox ID="cemail" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Ingrese el correo de la compañia" CssClass="text-danger" ControlToValidate="cemail"></asp:RequiredFieldValidator><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Debe tener formato de correo electronico" CssClass="text-warning" ControlToValidate="cemail" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator></div>
                    <div class="form-group">
                        <asp:Button ID="btnSignin" runat="server" Text="Enviar" CssClass="btn btn-default" OnClick="btnSignin_Click" />
                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>

