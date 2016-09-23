<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="panel.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="container">
            <form id="form1" runat="server">
                <h2>Bienvenido</h2>
                <p>Esta es una lista de tus empleados</p>
                <a href="create.aspx" class="btn btn-danger">Crear usuario</a>
                <br />
                <div class="table-responsive">
                    

                  
                    <asp:GridView ID="GridView1" cssClass="table" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AllowPaging="True" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                       <asp:BoundField DataField="user_name" HeaderText="NAME" SortExpression="user_name" />
                         <asp:BoundField DataField="email" HeaderText="EMAIL" SortExpression="email" />
                        <asp:BoundField DataField="phone" HeaderText="PHONE" SortExpression="phone" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:asistente_de_gerenciasConnectionString %>" DeleteCommand="DELETE FROM [workers] WHERE [id] = @id" InsertCommand="INSERT INTO [workers] ([user_name], [email], [phone]) VALUES (@user_name, @email, @phone)" SelectCommand="SELECT [user_name], [id], [email], [phone] FROM [workers] WHERE ([id_buildings] = @id_buildings)" UpdateCommand="UPDATE [workers] SET [user_name] = @user_name, [email] = @email, [phone] = @phone WHERE [id] = @id">
                        <DeleteParameters>
                            <asp:Parameter Name="id" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="user_name" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:SessionParameter Name="id_buildings" SessionField="user" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="user_name" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="id" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                <br />
                    

                </div>
            </form>
        </div>
    </div>
    </div>
</asp:Content>

