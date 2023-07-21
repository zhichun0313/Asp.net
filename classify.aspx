<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="classify.aspx.cs" Inherits="Myproject01.classify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            分類 
            <asp:Button ID="Button1" runat="server" Text="回首頁" OnClick="Button1_Click" ValidationGroup="a1" />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="classify" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="classify" HeaderText="分類" InsertVisible="False" ReadOnly="True" SortExpression="classify" />
                    <asp:TemplateField HeaderText="分類狀況碼" SortExpression="ClassificationStatusCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClassificationStatusCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClassificationStatusCode") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可空白" Text='<%# Eval("ClassificationStatusCode") %>'></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassificationStatusCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ClassificationStatusName" HeaderText="分類狀況碼名稱" SortExpression="ClassificationStatusName" />
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" DeleteCommand="DELETE FROM [Classify] WHERE [classify] = @classify" InsertCommand="INSERT INTO [Classify] ([ClassificationStatusCode], [ClassificationStatusName]) VALUES (@ClassificationStatusCode, @ClassificationStatusName)" SelectCommand="SELECT * FROM [Classify]" UpdateCommand="UPDATE [Classify] SET [ClassificationStatusCode] = @ClassificationStatusCode, [ClassificationStatusName] = @ClassificationStatusName WHERE [classify] = @classify">
                <DeleteParameters>
                    <asp:Parameter Name="classify" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ClassificationStatusCode" Type="String" />
                    <asp:Parameter Name="ClassificationStatusName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ClassificationStatusCode" Type="String" />
                    <asp:Parameter Name="ClassificationStatusName" Type="String" />
                    <asp:Parameter Name="classify" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="classify" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"  ValidationGroup="a1"/>
                    <asp:BoundField DataField="classify" HeaderText="分類" InsertVisible="False" ReadOnly="True" SortExpression="classify" />
                    <asp:BoundField DataField="ClassificationStatusCode" HeaderText="分類狀況碼" SortExpression="ClassificationStatusCode" />
                    <asp:BoundField DataField="ClassificationStatusName" HeaderText="分類狀況碼名稱" SortExpression="ClassificationStatusName" />
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
