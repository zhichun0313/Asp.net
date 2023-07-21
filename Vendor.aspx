<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Vendor.aspx.cs" Inherits="Myproject01.Vendor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript">
        function checkAddress(sender, args)
        {
            if (args.Value.search("號") == -1) 
            {
                args.IsValid = false;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            供應商管理 
            <asp:Button ID="Button1" runat="server" Text="回首頁" OnClick="Button1_Click1" ValidationGroup="a1" /> 
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="VendorNumber" DataSourceID="SqlDataSource1" Height="50px" CellPadding="4" ForeColor="#333333" GridLines="None" DefaultMode="Insert">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="VendorNumber" HeaderText="供應商編號" InsertVisible="False" ReadOnly="True" SortExpression="VendorNumber" />
                    <asp:TemplateField HeaderText="廠商名稱" SortExpression="VendorName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("VendorName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("VendorName") %>'></asp:TextBox>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="TextBox3" ErrorMessage="不可空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("VendorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Contact" HeaderText="聯絡人" SortExpression="Contact" />
                    <asp:BoundField DataField="FaxTelephone" HeaderText="傳真電話" SortExpression="FaxTelephone" />
                    <asp:TemplateField HeaderText="電話號碼" SortExpression="Phone">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Phone") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="不可空白" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2"
                             ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))" ErrorMessage="電話格式有誤"
                             Text='<%# Bind("Phone") %>'>
                            </asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Phone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="統一編號" SortExpression="UniformNumbering">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("UniformNumbering") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" MaxLength="8" Text='<%# Bind("UniformNumbering") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("UniformNumbering") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="帳單地址" SortExpression="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                             <asp:CustomValidator ID="CustomValidator1" runat="server" 
                             ControlToValidate="TextBox4" ErrorMessage="地址不得空白，須包含門牌號碼"
                             ValidateEmptyText="True" ClientValidationFunction="checkAddress">
                             </asp:CustomValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="銀行代碼" SortExpression="BankCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("BankCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" MaxLength="3" Text='<%# Bind("BankCode") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("BankCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="BankName" HeaderText="銀行名稱" SortExpression="BankName" />
                    <asp:BoundField DataField="AccountName" HeaderText="戶名" SortExpression="AccountName" />
                    <asp:TemplateField HeaderText="銀行帳號" SortExpression="Account">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Account") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" MaxLength="14" Text='<%# Bind("Account") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Account") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" ButtonType="Button" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerSettings PageButtonCount="5" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                DeleteCommand="DELETE FROM [Vendor] WHERE [VendorNumber] = @VendorNumber" 
                InsertCommand="INSERT INTO [Vendor] ([VendorName], [Contact], [FaxTelephone], [Phone], [UniformNumbering], [Address], [BankCode], [BankName], [AccountName], [Account]) VALUES (@VendorName, @Contact, @FaxTelephone, @Phone, @UniformNumbering,  @Address, @BankCode, @BankName, @AccountName, @Account)" 
                SelectCommand="SELECT * FROM [Vendor]" 
                UpdateCommand="UPDATE [Vendor] SET [VendorName] = @VendorName, [Contact] = @Contact, [FaxTelephone] = @FaxTelephone, [Phone] = @Phone, [UniformNumbering] = @UniformNumbering, [Address] = @Address, [BankCode] = @BankCode, [BankName] = @BankName, [AccountName] = @AccountName, [Account] = @Account WHERE [VendorNumber] = @VendorNumber">
                <DeleteParameters>
                    <asp:Parameter Name="VendorNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="VendorName" Type="String" />
                    <asp:Parameter Name="Contact" Type="String" />
                    <asp:Parameter Name="FaxTelephone" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="UniformNumbering" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="BankCode" Type="String" />
                    <asp:Parameter Name="BankName" Type="String" />
                    <asp:Parameter Name="AccountName" Type="String" />
                    <asp:Parameter Name="Account" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="VendorName" Type="String" />
                    <asp:Parameter Name="Contact" Type="String" />
                    <asp:Parameter Name="FaxTelephone" Type="String" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="UniformNumbering" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="BankCode" Type="String" />
                    <asp:Parameter Name="BankName" Type="String" />
                    <asp:Parameter Name="AccountName" Type="String" />
                    <asp:Parameter Name="Account" Type="String" />
                    <asp:Parameter Name="VendorNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="VendorNumber" DataSourceID="SqlDataSource1" PageSize="5" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1" />
                    <asp:BoundField DataField="VendorNumber" HeaderText="供應商編號" InsertVisible="False" ReadOnly="True" SortExpression="VendorNumber" />
                    <asp:BoundField DataField="VendorName" HeaderText="廠商名稱" SortExpression="VendorName" />
                    <asp:BoundField DataField="Contact" HeaderText="聯絡人" SortExpression="Contact" />
                    <asp:BoundField DataField="FaxTelephone" HeaderText="傳真電話" SortExpression="FaxTelephone" />
                    <asp:BoundField DataField="Phone" HeaderText="電話號碼" SortExpression="Phone" />
                    <asp:BoundField DataField="UniformNumbering" HeaderText="統一編號" SortExpression="UniformNumbering" />
                    <asp:BoundField DataField="Address" HeaderText="帳單地址" SortExpression="Address" />
                    <asp:BoundField DataField="BankCode" HeaderText="銀行代碼" SortExpression="BankCode" />
                    <asp:BoundField DataField="BankName" HeaderText="銀行名稱" SortExpression="BankName" />
                    <asp:BoundField DataField="AccountName" HeaderText="戶名" SortExpression="AccountName" />
                    <asp:BoundField DataField="Account" HeaderText="銀行帳號" SortExpression="Account" />
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
