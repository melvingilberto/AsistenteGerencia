<%@ Page Title="" Language="C#" MasterPageFile="~/administrator.master" AutoEventWireup="true" CodeFile="panel_admin.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <form id="form1" runat="server">
            <div class="container">
                <h2>Bienvenido Administrador</h2>
            </div>
            <div class="table-responsive">

                <asp:GridView cssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                        <asp:BoundField DataField="email" HeaderText="EMAIL" SortExpression="email" />
                        <asp:BoundField DataField="fname" HeaderText="NOMBRES" SortExpression="fname" />
                        <asp:BoundField DataField="lname" HeaderText="APELLIDOS" SortExpression="lname" />
                        <asp:BoundField DataField="user_name" HeaderText="NOMBRE COMPLETO" SortExpression="user_name" />
                        <asp:BoundField DataField="company" HeaderText="COMPAÑIA" SortExpression="company" />
                        <asp:BoundField DataField="comp_email" HeaderText="EMAIL COMPAÑIA" SortExpression="comp_email" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asistente_de_gerenciasConnectionString %>" DeleteCommand="DELETE FROM [users] WHERE [id] = @id" InsertCommand="INSERT INTO [users] ([email], [fname], [lname], [user_name], [company], [comp_email]) VALUES (@email, @fname, @lname, @user_name, @company, @comp_email)" SelectCommand="SELECT [id], [email], [fname], [lname], [user_name], [company], [comp_email] FROM [users] WHERE ([type] &lt;&gt; @type)" UpdateCommand="UPDATE [users] SET [email] = @email, [fname] = @fname, [lname] = @lname, [user_name] = @user_name, [company] = @company, [comp_email] = @comp_email WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="user_name" Type="String" />
                        <asp:Parameter Name="company" Type="String" />
                        <asp:Parameter Name="comp_email" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="type" QueryStringField="0" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="fname" Type="String" />
                        <asp:Parameter Name="lname" Type="String" />
                        <asp:Parameter Name="user_name" Type="String" />
                        <asp:Parameter Name="company" Type="String" />
                        <asp:Parameter Name="comp_email" Type="String" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

            </div>
            </form>
    </div>
</asp:Content>

