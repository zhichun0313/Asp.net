<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Level.aspx.cs" Inherits="Myproject01.Level" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            會員等級 <asp:Button ID="Button1" runat="server" Text="回首頁"  ValidationGroup="a1" OnClick="Button1_Click"/>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="MembershipLevel" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="MembershipLevel" HeaderText="會員等級" InsertVisible="False" ReadOnly="True" SortExpression="MembershipLevel" />
                    <asp:TemplateField HeaderText="分類等級代號" SortExpression="ClassificationRankCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClassificationRankCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClassificationRankCode") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassificationRankCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="RankName" HeaderText="等級名稱" SortExpression="RankName" />
                    <asp:BoundField DataField="MemberDiscounts" HeaderText="會員折扣" SortExpression="MemberDiscounts" />
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" DeleteCommand="DELETE FROM [MembershipLevel] WHERE [MembershipLevel] = @MembershipLevel" InsertCommand="INSERT INTO [MembershipLevel] ([ClassificationRankCode], [RankName], [MemberDiscounts]) VALUES (@ClassificationRankCode, @RankName, @MemberDiscounts)" SelectCommand="SELECT * FROM [MembershipLevel]" UpdateCommand="UPDATE [MembershipLevel] SET [ClassificationRankCode] = @ClassificationRankCode, [RankName] = @RankName, [MemberDiscounts] = @MemberDiscounts WHERE [MembershipLevel] = @MembershipLevel">
                <DeleteParameters>
                    <asp:Parameter Name="MembershipLevel" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ClassificationRankCode" Type="String" />
                    <asp:Parameter Name="RankName" Type="String" />
                    <asp:Parameter Name="MemberDiscounts" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ClassificationRankCode" Type="String" />
                    <asp:Parameter Name="RankName" Type="String" />
                    <asp:Parameter Name="MemberDiscounts" Type="Double" />
                    <asp:Parameter Name="MembershipLevel" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MembershipLevel" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"  ValidationGroup="a1"/>
                    <asp:BoundField DataField="MembershipLevel" HeaderText="會員等級" InsertVisible="False" ReadOnly="True" SortExpression="MembershipLevel" />
                    <asp:BoundField DataField="ClassificationRankCode" HeaderText="分類等級代號" SortExpression="ClassificationRankCode" />
                    <asp:BoundField DataField="RankName" HeaderText="等級名稱" SortExpression="RankName" />
                    <asp:BoundField DataField="MemberDiscounts" HeaderText="會員折扣" SortExpression="MemberDiscounts" />
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
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
