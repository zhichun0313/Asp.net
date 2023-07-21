<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="Myproject01.ItemDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            訂單明細 
            <asp:Button ID="Button1" runat="server" Text="回首頁"  ValidationGroup="a1" OnClick="Button1_Click"/>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="NumberOfLineItems" DataSourceID="SqlDataSource1" DefaultMode="Insert" Height="50px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="NumberOfLineItems" HeaderText="訂單項次" InsertVisible="False" ReadOnly="True" SortExpression="NumberOfLineItems" />
                    <asp:TemplateField HeaderText="訂單號碼" SortExpression="OrderNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="OrderNumber" DataValueField="OrderNumber" SelectedValue='<%# Bind("OrderNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [OrderSalesManagement]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("OrderNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品名稱" SortExpression="ItemID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Title" DataValueField="ItemID" SelectedValue='<%# Bind("ItemID") %>'>
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
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可空值" ></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="amounts" HeaderText="銷售金額" SortExpression="amounts" />
                    <asp:BoundField DataField="remark" HeaderText="備註" SortExpression="remark" />
                    <asp:CommandField ShowInsertButton="True" ShowDeleteButton="True" ShowEditButton="True"  />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                DeleteCommand="DELETE FROM [ItemDetails] WHERE [NumberOfLineItems] = @NumberOfLineItems" 
                InsertCommand="INSERT INTO [ItemDetails] ([OrderNumber], [ItemID], [quantity], [amounts], [remark]) VALUES (@OrderNumber, @ItemID, @quantity, @amounts, @remark)" SelectCommand="SELECT * FROM [ItemDetails]" 
                UpdateCommand="UPDATE [ItemDetails] SET [OrderNumber] = @OrderNumber, [ItemID] = @ItemID, [quantity] = @quantity, [amounts] = @amounts, [remark] = @remark WHERE [NumberOfLineItems] = @NumberOfLineItems">
                <DeleteParameters>
                    <asp:Parameter Name="NumberOfLineItems" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="OrderNumber" Type="Int32" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="amounts" Type="Decimal" />
                    <asp:Parameter Name="remark" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="OrderNumber" Type="Int32" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="amounts" Type="Decimal" />
                    <asp:Parameter Name="remark" Type="String" />
                    <asp:Parameter Name="NumberOfLineItems" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="NumberOfLineItems" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"  ValidationGroup="a1"/>
                    <asp:BoundField DataField="NumberOfLineItems" HeaderText="訂單項次" InsertVisible="False" ReadOnly="True" SortExpression="NumberOfLineItems" />
                    <asp:BoundField DataField="OrderNumber" HeaderText="訂單單號" SortExpression="OrderNumber" />
                    <asp:BoundField DataField="ItemID" HeaderText="商品名稱" SortExpression="ItemID" />
                    <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
                    <asp:BoundField DataField="amounts" HeaderText="銷售金額" SortExpression="amounts" />
                    <asp:BoundField DataField="remark" HeaderText="備註" SortExpression="remark" />
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
