<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <h2>Crea usuarios para tu empresa</h2>
        <div class="col-md-7 col-md-offset-2">
            <form id="form1" runat="server">
                <div class="form-group">
                    <label>Nombre</label>
                    <asp:TextBox ID="nombre" runat="server" CssClass="form-control" ControlToValidate="fname"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Ingrese su nombre" CssClass="text-danger" ControlToValidate="nombre"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Ingrese su correo" CssClass="text-danger" ControlToValidate="email"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Debe tener formato de correo electronico" CssClass="text-warning" ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label>Phone</label>
                    <asp:TextBox ID="phone" name="phone" class="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="phone"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnCreate" runat="server" Text="Crear" CssClass="btn btn-success" OnClick="btnCreate_Click" />
                </div>
            </form>
        </div>
    </div>
</asp:Content>

