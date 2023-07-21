<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReturnRequest.aspx.cs" Inherits="Myproject01.ReturnRequest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            退貨申請 
            <asp:Button ID="Button1" runat="server" Text="回首頁"  ValidationGroup="a1" OnClick="Button1_Click"/>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ReturnRequest" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="ReturnRequest" HeaderText="退貨序號" InsertVisible="False" ReadOnly="True" SortExpression="ReturnRequest" />
                    <asp:TemplateField HeaderText="退貨因素" SortExpression="ReturnFactors">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReturnFactors") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ReturnFactors") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可空白" Text='<%# Eval("ReturnFactors") %>'></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ReturnFactors") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" DeleteCommand="DELETE FROM [ReturnFactors] WHERE [ReturnRequest] = @ReturnRequest" InsertCommand="INSERT INTO [ReturnFactors] ([ReturnFactors]) VALUES (@ReturnFactors)" SelectCommand="SELECT * FROM [ReturnFactors]" UpdateCommand="UPDATE [ReturnFactors] SET [ReturnFactors] = @ReturnFactors WHERE [ReturnRequest] = @ReturnRequest">
                <DeleteParameters>
                    <asp:Parameter Name="ReturnRequest" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ReturnFactors" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ReturnFactors" Type="String" />
                    <asp:Parameter Name="ReturnRequest" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ReturnRequest" DataSourceID="SqlDataSource1" PageSize="5" style="margin-right: 0px">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1" />
                    <asp:BoundField DataField="ReturnRequest" HeaderText="退貨序號" InsertVisible="False" ReadOnly="True" SortExpression="ReturnRequest" />
                    <asp:BoundField DataField="ReturnFactors" HeaderText="退貨因素" SortExpression="ReturnFactors" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerSettings PageButtonCount="5" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
