<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Preference.aspx.cs" Inherits="Myproject01.Preference" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            喜好興趣&nbsp; 
            <asp:Button ID="Button1" runat="server" Text="回首頁" OnClick="Button1_Click" ValidationGroup="a1" />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="Preference" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="Preference" HeaderText="序號" InsertVisible="False" ReadOnly="True" SortExpression="Preference" />
                    <asp:TemplateField HeaderText="喜好代碼" SortExpression="PreferenceCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PreferenceCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PreferenceCode") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PreferenceCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PreferenceName" HeaderText="喜好名稱" SortExpression="PreferenceName" />
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" DeleteCommand="DELETE FROM [Preference] WHERE [lPreferenceike] = @Preference" InsertCommand="INSERT INTO [Preference] ([PreferenceCode], [PreferenceName]) VALUES (@PreferenceCode, @PreferenceName)" SelectCommand="SELECT * FROM [Preference]" UpdateCommand="UPDATE [Preference] SET [PreferenceCode] = @PreferenceCode, [PreferenceName] = @PreferenceName WHERE [Preference] = @Preference">
                <DeleteParameters>
                    <asp:Parameter Name="Preference" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PreferenceCode" Type="String" />
                    <asp:Parameter Name="PreferenceName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PreferenceCode" Type="String" />
                    <asp:Parameter Name="PreferenceName" Type="String" />
                    <asp:Parameter Name="Preference" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Preference" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1" />
                    <asp:BoundField DataField="Preference" HeaderText="序號" InsertVisible="False" ReadOnly="True" SortExpression="Preference" />
                    <asp:BoundField DataField="PreferenceCode" HeaderText="喜好代碼" SortExpression="PreferenceCode" />
                    <asp:BoundField DataField="PreferenceName" HeaderText="喜好名稱" SortExpression="PreferenceName" />
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
            <br />
        </div>
    </form>
</body>
</html>
