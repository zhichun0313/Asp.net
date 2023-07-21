<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PleasePurchaseInboundManagement.aspx.cs" Inherits="Myproject01.PleasePurchaseInboundManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            採購入庫單
            <asp:Button ID="Button1" runat="server" Text="回首頁"  ValidationGroup="a1" OnClick="Button1_Click"/>
            <br />
           <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="PurchaseReceiptNumber" DataSourceID="SqlDataSource1" Height="50px" CellPadding="4" DefaultMode="Insert" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="PurchaseReceiptNumber" HeaderText="採購入庫單" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseReceiptNumber" />
                    <asp:TemplateField HeaderText="採購日期" SortExpression="purchaseDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("purchaseDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("purchaseDate") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ControlToValidate="TextBox7" ErrorMessage="不可為空白">
                             </asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" runat="server"  ControlToValidate="TextBox7" 
                                ErrorMessage="日期格式錯誤yyyy/mm/dd" OnServerValidate="CustomValidator1_ServerValidate">
                            </asp:CustomValidator>
                         </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("purchaseDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="採購狀態" SortExpression="PurchaseStatus">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PurchaseStatus") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource2" DataTextField="PurchaseStatusCodeName"
                                DataValueField="PurchaseStatus" SelectedValue='<%# Bind("PurchaseStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                                SelectCommand="SELECT * FROM [PurchaseStatus]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("PurchaseStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="員工姓名" SortExpression="EmployeeNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource3" DataTextField="EmployeeName" 
                                DataValueField="EmployeeNumber" SelectedValue='<%# Bind("EmployeeNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>"
                                SelectCommand="SELECT * FROM [PersonnelfinancelManagement]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("EmployeeNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="廠商名稱" SortExpression="VendorNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("VendorNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="VendorName" DataValueField="VendorNumber" SelectedValue='<%# Bind("VendorNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Vendor]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("VendorNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="付款方式" SortExpression="PaymentMethod">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PaymentMethod") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="PaymentName" DataValueField="PaymentMethod" SelectedValue='<%# Bind("PaymentMethod") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>"
                                SelectCommand="SELECT * FROM [PaymentMethod]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("PaymentMethod") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="入庫日期" SortExpression="shippingDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("shippingDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("shippingDate") %>'></asp:TextBox>
                             <asp:CustomValidator ID="CustomValidator2" runat="server"  ControlToValidate="TextBox1" 
                                ErrorMessage="日期格式錯誤yyyy/mm/dd" OnServerValidate="CustomValidator1_ServerValidate">
                            </asp:CustomValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("shippingDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發票號碼" SortExpression="InvoiceNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Text='<%# Bind("InvoiceNumber") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發票日期" SortExpression="InvoiceDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("InvoiceDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("InvoiceDate") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("InvoiceDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="付款條件" SortExpression="PaymentTerms">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PaymentTerms") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="PaymentCodeName" DataValueField="PaymentTerms" SelectedValue='<%# Bind("PaymentTerms") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PaymentTerms]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("PaymentTerms") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True"  />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerSettings PageButtonCount="5" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                DeleteCommand="DELETE FROM [PurchaseReceiptOrder] WHERE [PurchaseReceiptNumber] = @PurchaseReceiptNumber" 
                InsertCommand="INSERT INTO [PurchaseReceiptOrder] ([purchaseDate], [PurchaseStatus], [EmployeeNumber], [VendorNumber], [PaymentMethod], [shippingDate], [InvoiceNumber], [InvoiceDate], [PaymentTerms]) VALUES (@purchaseDate, @PurchaseStatus, @EmployeeNumber, @VendorNumber, @PaymentMethod, @shippingDate, @InvoiceNumber, @InvoiceDate, @PaymentTerms)" 
                SelectCommand="SELECT a.*,b.PurchaseStatusCodeName,c.EmployeeName,d.VendorName,e.PaymentName,h.PaymentCodeName
                FROM [PurchaseReceiptOrder] a
                left join [PurchaseStatus] b on a.PurchaseStatus=b.PurchaseStatus
                left join [PersonnelfinancelManagement] c on a.EmployeeNumber=c.EmployeeNumber
                left join [Vendor] d on a.VendorNumber=d.VendorNumber
                left join [PaymentMethod] e on a.PaymentMethod=e.PaymentMethod
                left join [PaymentTerms] h on a.PaymentTerms=h.PaymentTerms"
                UpdateCommand="UPDATE [PurchaseReceiptOrder] SET [purchaseDate] = @purchaseDate, [PurchaseStatus] = @PurchaseStatus, [EmployeeNumber] = @EmployeeNumber, [VendorNumber] = @VendorNumber, [PaymentMethod] = @PaymentMethod, [shippingDate] = @shippingDate, [InvoiceNumber] = @InvoiceNumber, [InvoiceDate] = @InvoiceDate, [PaymentTerms] = @PaymentTerms WHERE [PurchaseReceiptNumber] = @PurchaseReceiptNumber">
                <DeleteParameters>
                    <asp:Parameter Name="PurchaseReceiptNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="purchaseDate" Type="DateTime" />
                    <asp:Parameter Name="PurchaseStatus" Type="Int32" />
                    <asp:Parameter Name="EmployeeNumber" Type="Int32" />
                    <asp:Parameter Name="VendorNumber" Type="Int32" />
                    <asp:Parameter Name="PaymentMethod" Type="Int32" />
                    <asp:Parameter Name="shippingDate" Type="DateTime" />
                    <asp:Parameter Name="InvoiceNumber" Type="String" />
                    <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                    <asp:Parameter Name="PaymentTerms" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="purchaseDate" Type="DateTime" />
                    <asp:Parameter Name="PurchaseStatus" Type="Int32" />
                    <asp:Parameter Name="EmployeeNumber" Type="Int32" />
                    <asp:Parameter Name="VendorNumber" Type="Int32" />
                    <asp:Parameter Name="PaymentMethod" Type="Int32" />
                    <asp:Parameter Name="shippingDate" Type="DateTime" />
                    <asp:Parameter Name="InvoiceNumber" Type="String" />
                    <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                    <asp:Parameter Name="PaymentTerms" Type="Int32" />
                    <asp:Parameter Name="PurchaseReceiptNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PurchaseReceiptNumber" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1" ShowSelectButton="True" />
                    <asp:BoundField DataField="PurchaseReceiptNumber" HeaderText="採購入庫單號" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseReceiptNumber" />
                    <asp:BoundField DataField="purchaseDate" HeaderText="採購日期" SortExpression="purchaseDate" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderText="採購狀態" SortExpression="PurchaseStatus">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource2" DataTextField="PurchaseStatusCodeName" DataValueField="PurchaseStatus"  SelectedValue='<%# Bind("PurchaseStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PurchaseStatus]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("PurchaseStatusCodeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="員工姓名" SortExpression="EmployeeNumber">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource6" 
                                DataTextField="EmployeeName" DataValueField="EmployeeNumber" SelectedValue='<%# Bind("EmployeeNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PersonnelfinancelManagement]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("EmployeeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="廠商名稱" SortExpression="VendorNumber">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource7" 
                                DataTextField="VendorName" DataValueField="VendorNumber"  SelectedValue='<%# Bind("VendorNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Vendor]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("VendorName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="付款方式" SortExpression="PaymentMethod">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSource8"
                                DataTextField="PaymentName" DataValueField="PaymentMethod"  SelectedValue='<%# Bind("PaymentMethod") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource8" runat="server"
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                                SelectCommand="SELECT * FROM [PaymentMethod]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("PaymentName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="shippingDate" HeaderText="入庫日期" SortExpression="shippingDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="InvoiceNumber" HeaderText="發票號碼" SortExpression="InvoiceNumber" />
                    <asp:BoundField DataField="InvoiceDate" HeaderText="發票日期" SortExpression="InvoiceDate" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderText="付款條件" SortExpression="PaymentTerms">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="SqlDataSource9" 
                                DataTextField="PaymentCodeName" DataValueField="PaymentTerms"  SelectedValue='<%# Bind("PaymentTerms") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PaymentTerms]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("PaymentCodeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <br />
              <asp:DetailsView ID="DetailsView2" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="PurchaseInboundItems" DataSourceID="SqlDataSource11" DefaultMode="Insert">
                <Fields>
                    <asp:BoundField DataField="PurchaseInboundItems" HeaderText="採購入庫項次" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseInboundItems" />
                    <asp:TemplateField HeaderText="採購入庫單號" SortExpression="PurchaseReceiptNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PurchaseReceiptNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="PurchaseReceiptNumber"
                                DataValueField="PurchaseReceiptNumber" SelectedValue='<%# Bind("PurchaseReceiptNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PurchaseReceiptOrder]"></asp:SqlDataSource>
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
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="RestockingAmount" HeaderText="進貨金額" SortExpression="RestockingAmount" />
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True"  ValidationGroup="a1"/>
                </Fields>
            </asp:DetailsView>
            <br />
             <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="PurchaseInboundItems" DataSourceID="SqlDataSource11" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1"/>
                    <asp:BoundField DataField="PurchaseInboundItems" HeaderText="採購入庫項次" InsertVisible="False" ReadOnly="True" SortExpression="PurchaseInboundItems" />
                    <asp:BoundField DataField="PurchaseReceiptNumber" HeaderText="採購入庫單號" SortExpression="PurchaseReceiptNumber" />
                    <asp:TemplateField HeaderText="商品名稱" SortExpression="ItemID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSource4" 
                                DataTextField="Title" DataValueField="ItemID" Enabled="false" SelectedValue='<%# Bind("ItemID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Commodity]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource11" runat="server" 
                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>"
                SelectCommand="SELECT a.*,b.Title FROM [PurchaseInboundDetails] a
                left join [Commodity] b on a.ItemID=b.ItemID WHERE ([PurchaseReceiptNumber] = @PurchaseReceiptNumber)" 
                DeleteCommand="DELETE FROM [PurchaseInboundDetails] WHERE [PurchaseInboundItems] = @PurchaseInboundItems"
                InsertCommand="INSERT INTO [PurchaseInboundDetails] ([PurchaseReceiptNumber], [ItemID], [quantity], [RestockingAmount]) VALUES (@PurchaseReceiptNumber, @ItemID, @quantity, @RestockingAmount)" UpdateCommand="UPDATE [PurchaseInboundDetails] SET [PurchaseReceiptNumber] = @PurchaseReceiptNumber, [ItemID] = @ItemID, [quantity] = @quantity, [RestockingAmount] = @RestockingAmount WHERE [PurchaseInboundItems] = @PurchaseInboundItems">
                <DeleteParameters>
                    <asp:Parameter Name="PurchaseInboundItems" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="PurchaseReceiptNumber" Type="Int32" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="RestockingAmount" Type="Decimal" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="PurchaseReceiptNumber" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="PurchaseReceiptNumber" Type="Int32" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                    <asp:Parameter Name="quantity" Type="Int32" />
                    <asp:Parameter Name="RestockingAmount" Type="Decimal" />
                    <asp:Parameter Name="PurchaseInboundItems" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
       </div>
    </form>
</body>
</html>
