<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Purchase inbound details.aspx.cs" Inherits="Myproject01.Purchase_inbound_details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
          <div>
            採購明細單&nbsp; 
            <asp:Button ID="Button1" runat="server" Text="回首頁" ValidationGroup="a1" OnClick="Button1_Click" />
            <br />
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="PurchaseInboundItems" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="PurchaseInboundItems" HeaderText="採購入庫項次" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseInboundItems" />
                    <asp:TemplateField HeaderText="採購入庫單號" SortExpression="PurchaseReceiptNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PurchaseReceiptNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PurchaseReceiptNumber" DataValueField="PurchaseReceiptNumber" SelectedValue='<%# Bind("PurchaseReceiptNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Purchase Receipt  order]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PurchaseReceiptNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名稱" SortExpression="ItemID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Title" DataValueField="ItemID" SelectedValue='<%# Bind("ItemID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Commodity]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ItemID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="數量" SortExpression="quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="不可空值"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="RestockingAmount" HeaderText="進貨金額" SortExpression="RestockingAmount" />
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" DeleteCommand="DELETE FROM [Purchase inbound details] WHERE [PurchaseInboundItems] = @PurchaseInboundItems" InsertCommand="INSERT INTO [Purchase inbound details] ([PurchaseReceiptNumber], [ItemID], [quantity], [RestockingAmount]) VALUES (@PurchaseReceiptNumber, @ItemID, @quantity, @RestockingAmount)" SelectCommand="SELECT * FROM [Purchase inbound details]" UpdateCommand="UPDATE [Purchase inbound details] SET [PurchaseReceiptNumber] = @PurchaseReceiptNumber, [ItemID] = @ItemID, [quantity] = @quantity, [RestockingAmount] = @RestockingAmount WHERE [PurchaseInboundItems] = @PurchaseInboundItems">
                <DeleteParameters>
                    <asp:Parameter Name="PurchaseInboundItems" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PurchaseReceiptNumber" Type="Int32" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="RestockingAmount" Type="Decimal" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PurchaseReceiptNumber" Type="Int32" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="RestockingAmount" Type="Decimal" />
                    <asp:Parameter Name="PurchaseInboundItems" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PurchaseInboundItems" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1"/>
                    <asp:BoundField DataField="PurchaseInboundItems" HeaderText="採購入庫項次" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseInboundItems" />
                    <asp:BoundField DataField="PurchaseReceiptNumber" HeaderText="採購入庫單號" SortExpression="PurchaseReceiptNumber" />
                    <asp:BoundField DataField="ItemID" HeaderText="商品名稱" SortExpression="ItemID" />
                    <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
                    <asp:BoundField DataField="RestockingAmount" HeaderText="進貨金額" SortExpression="RestockingAmount" />
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
