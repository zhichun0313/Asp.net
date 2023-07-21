<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSalesManagement.aspx.cs" Inherits="Myproject01.OrderSalesManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            訂單銷售管理
        <asp:Button ID="Button1" runat="server" Text="回首頁"  ValidationGroup="a1" OnClick="Button1_Click"/>
        <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="OrderNumber" DataSourceID="SqlDataSource1" DefaultMode="Insert" ForeColor="#333333" GridLines="None" Height="50px" style="margin-right: 5px">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="OrderNumber" HeaderText="訂單號碼" InsertVisible="False" ReadOnly="True" SortExpression="OrderNumber" />
                    <asp:TemplateField HeaderText="會員姓名" SortExpression="MemberNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("MemberNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server"
                                DataSourceID="SqlDataSource4" DataTextField="Name"
                                DataValueField="MemberNumber" SelectedValue='<%# Bind("MemberNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" 
                                runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>"
                                SelectCommand="SELECT * FROM [memberData]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("MemberNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="員工姓名" SortExpression="EmployeeNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource5" DataTextField="EmployeeName" DataValueField="EmployeeNumber" SelectedValue='<%# Bind("EmployeeNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                                SelectCommand="SELECT * FROM [PersonnelfinancelManagement]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmployeeNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="訂單日期" SortExpression="OrderDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox12" runat="server" Text='<%# Eval("OrderDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("OrderDate") %>'></asp:TextBox>
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="TextBox2" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>                                                 
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("OrderDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="訂單狀態" SortExpression="OrderStatus">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("OrderStatus") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource6" DataTextField="OrderStatusName" DataValueField="OrderStatus" SelectedValue='<%# Bind("OrderStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                                SelectCommand="SELECT * FROM [OrderStatus]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("OrderStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="付款狀態" SortExpression="PaymentStatus">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("PaymentStatus") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSource7" DataTextField="PaymentStatusName" DataValueField="PaymentStatus" SelectedValue='<%# Bind("PaymentStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PaymentStatus]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("PaymentStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="付款方法" SortExpression="PaymentMethod">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PaymentMethod") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSource9" DataTextField="PaymentName" DataValueField="PaymentMethod" SelectedValue='<%# Bind("PaymentMethod") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PaymentMethod]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PaymentMethod") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發票形式" SortExpression="InvoiceForm">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("InvoiceForm") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList13" runat="server" DataSourceID="SqlDataSource10" DataTextField="invoiceFormName" DataValueField="InvoiceForm" SelectedValue='<%# Bind("InvoiceForm") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [InvoiceForm]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("InvoiceForm") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發票號碼" SortExpression="InvoiceNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" MaxLength="10" Text='<%# Bind("InvoiceNumber") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Bind("InvoiceNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發票日期" SortExpression="InvoiceDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("InvoiceDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("InvoiceDate") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("InvoiceDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ConsigneeName" HeaderText="收件人姓名" SortExpression="ConsigneeName" />
                    <asp:BoundField DataField="Address" HeaderText="收貨地址" SortExpression="Address" />
                    <asp:TemplateField HeaderText="收件人電話" SortExpression="ConsigneePhone">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ConsigneePhone") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("ConsigneePhone") %>'></asp:TextBox>
                              <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"  
                             ControlToValidate="TextBox7"  
                             ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))"  
                             ErrorMessage="電話格式有誤"
                             ></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("ConsigneePhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="取貨方法" SortExpression="PickupMethod">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("PickupMethod") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList15" runat="server" DataSourceID="SqlDataSource11" DataTextField="PickupCodeName" DataValueField="PickupMethod" SelectedValue='<%# Bind("PickupMethod") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PickupMethod]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("PickupMethod") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發貨狀態" SortExpression="ShipmentStatus">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("ShipmentStatus") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList17" runat="server" DataSourceID="SqlDataSource12" DataTextField="ShippingStatusName" DataValueField="ShipmentStatus" SelectedValue='<%# Bind("ShipmentStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [ShipmentStatus]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("ShipmentStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="退貨申請" SortExpression="ReturnRequest">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("ReturnRequest") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList20" runat="server"  AppendDataBoundItems="true" DataSourceID="SqlDataSource13" DataTextField="ReturnFactors" DataValueField="ReturnRequest" SelectedValue='<%# Bind("ReturnRequest") %>'>
                                 <asp:ListItem ></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource13" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [ReturnFactors]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("ReturnRequest") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                DeleteCommand="DELETE FROM [OrderSalesManagement] WHERE [OrderNumber] = @OrderNumber" 
                InsertCommand="INSERT INTO [OrderSalesManagement] ([MemberNumber], [EmployeeNumber], [OrderDate], [OrderStatus], [PaymentStatus], [PaymentMethod], [InvoiceForm], [InvoiceNumber], [InvoiceDate], [ConsigneeName], [Address], [ConsigneePhone], [PickupMethod], [ShipmentStatus], [ReturnRequest]) VALUES (@MemberNumber, @EmployeeNumber, @OrderDate, @OrderStatus, @PaymentStatus, @PaymentMethod, @InvoiceForm, @InvoiceNumber, @InvoiceDate, @ConsigneeName, @Address, @ConsigneePhone, @PickupMethod, @ShipmentStatus, @ReturnRequest)" 
                SelectCommand="SELECT a.* ,c.Name,b.EmployeeName,d.OrderStatusName,e.PaymentStatusName,
                f.PaymentName,g.invoiceFormName,h.PickupCodeName,a1.ShippingStatusName,a2.ReturnFactors
                FROM [OrderSalesManagement] a
                left join [PersonnelfinancelManagement] b on a.EmployeeNumber=b.EmployeeNumber
                left join [memberData] c on a.MemberNumber=c.MemberNumber
                left join [OrderStatus] d on a.OrderStatus=d.OrderStatus
                left join [PaymentStatus] e on a.PaymentMethod=e.PaymentStatus
                left join [PaymentMethod] f on a.PaymentMethod=f.PaymentMethod
                left join [InvoiceForm] g on a.InvoiceForm=g.InvoiceForm
                left join [PickupMethod] h on a.PickupMethod=h.PickupMethod
                left join [ShipmentStatus] a1 on a.ShipmentStatus=a1.ShipmentStatus
				left join [ReturnFactors] a2 on a.ReturnRequest=a2.ReturnRequest" 
                UpdateCommand="UPDATE [OrderSalesManagement] SET [MemberNumber] = @MemberNumber, [EmployeeNumber] = @EmployeeNumber, [OrderDate] = @OrderDate, [OrderStatus] = @OrderStatus, [PaymentStatus] = @PaymentStatus, [PaymentMethod] = @PaymentMethod, [InvoiceForm] = @InvoiceForm, [InvoiceNumber] = @InvoiceNumber, [InvoiceDate] = @InvoiceDate, [ConsigneeName] = @ConsigneeName, [Address] = @Address, [ConsigneePhone] = @ConsigneePhone, [PickupMethod] = @PickupMethod, [ShipmentStatus] = @ShipmentStatus, [ReturnRequest] = @ReturnRequest 
                WHERE [OrderNumber] = @OrderNumber">
                <DeleteParameters>
                 <asp:Parameter Name="OrderNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MemberNumber" Type="Int32" />
                    <asp:Parameter Name="EmployeeNumber" Type="Int32" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                    <asp:Parameter Name="OrderStatus" Type="Int32" />
                    <asp:Parameter Name="PaymentStatus" Type="Int32" />
                    <asp:Parameter Name="PaymentMethod" Type="Int32" />
                    <asp:Parameter Name="InvoiceForm" Type="Int32" />
                    <asp:Parameter Name="InvoiceNumber" Type="String" />
                    <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                    <asp:Parameter Name="ConsigneeName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="ConsigneePhone" Type="String" />
                    <asp:Parameter Name="PickupMethod" Type="Int32" />
                    <asp:Parameter Name="ShipmentStatus" Type="Int32" />
                    <asp:Parameter Name="ReturnRequest" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MemberNumber" Type="Int32" />
                    <asp:Parameter Name="EmployeeNumber" Type="Int32" />
                    <asp:Parameter Name="OrderDate" Type="DateTime" />
                    <asp:Parameter Name="OrderStatus" Type="Int32" />
                    <asp:Parameter Name="PaymentStatus" Type="Int32" />
                    <asp:Parameter Name="PaymentMethod" Type="Int32" />
                    <asp:Parameter Name="InvoiceForm" Type="Int32" />
                    <asp:Parameter Name="InvoiceNumber" Type="String" />
                    <asp:Parameter Name="InvoiceDate" Type="DateTime" />
                    <asp:Parameter Name="ConsigneeName" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="ConsigneePhone" Type="String" />
                    <asp:Parameter Name="PickupMethod" Type="Int32" />
                    <asp:Parameter Name="ShipmentStatus" Type="Int32" />
                    <asp:Parameter Name="ReturnRequest" Type="Int32" />
                    <asp:Parameter Name="OrderNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="OrderNumber" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"  ValidationGroup="a1" ShowSelectButton="True"/>
                    <asp:BoundField DataField="OrderNumber" HeaderText="訂單號碼" InsertVisible="False" ReadOnly="True" SortExpression="OrderNumber" />
                    <asp:TemplateField HeaderText="會員姓名" SortExpression="MemberNumber">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" 
                                DataSourceID="SqlDataSource4"  AutoPostBack="true" DataTextField="Name"
                                DataValueField="MemberNumber" SelectedValue='<%# Bind("MemberNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                                SelectCommand="SELECT * FROM [memberData]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="員工姓名" SortExpression="EmployeeNumber">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource5" DataTextField="EmployeeName"
                                DataValueField="EmployeeNumber"   SelectedValue='<%# Bind("EmployeeNumber") %>' AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PersonnelfinancelManagement]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelEmployeeName" runat="server" Text='<%# Eval("EmployeeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="OrderDate" DataFormatString="{0:d}" HeaderText="訂單日期" SortExpression="OrderDate" />
                    <asp:TemplateField HeaderText="訂單狀態" SortExpression="OrderStatus">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource6" DataTextField="OrderStatusName" DataValueField="OrderStatus"  SelectedValue='<%# Bind("OrderStatus") %>' AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [OrderStatus]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("OrderStatusName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="付款狀態" SortExpression="PaymentStatus">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList10"  runat="server" DataSourceID="SqlDataSource7" DataTextField="PaymentStatusName" DataValueField="PaymentStatus"  SelectedValue='<%# Bind("PaymentStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PaymentStatus]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("PaymentStatusName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="付款方法" SortExpression="PaymentMethod">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList12" runat="server" DataSourceID="SqlDataSource9" DataTextField="PaymentName" DataValueField="PaymentMethod"  SelectedValue='<%# Bind("PaymentMethod") %>' AutoPostBack="True">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PaymentMethod]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label14" runat="server" Text='<%# Eval("PaymentName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發票形式" SortExpression="InvoiceForm">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList14" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource10" DataTextField="invoiceFormName" DataValueField="InvoiceForm"  SelectedValue='<%# Bind("InvoiceForm") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource10" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [InvoiceForm]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label15" runat="server" Text='<%# Eval("invoiceFormName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="InvoiceNumber" HeaderText="發票號碼" SortExpression="InvoiceNumber" />
                    <asp:BoundField DataField="InvoiceDate" DataFormatString="{0:d}" HeaderText="發票日期" SortExpression="InvoiceDate" />
                    <asp:BoundField DataField="ConsigneeName" HeaderText="收件人姓名" SortExpression="ConsigneeName" />
                    <asp:BoundField DataField="Address" HeaderText="收貨地址" SortExpression="Address" />
                    <asp:BoundField DataField="ConsigneePhone" HeaderText="收件人電話" SortExpression="ConsigneePhone" />
                    <asp:TemplateField HeaderText="取貨方法" SortExpression="PickupMethod">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList16" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource11" DataTextField="PickupCodeName" DataValueField="PickupMethod"  SelectedValue='<%# Bind("PickupMethod") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [PickupMethod]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label16" runat="server" Text='<%# Eval("PickupCodeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="發貨狀態" SortExpression="ShipmentStatus">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList18" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource12" DataTextField="ShippingStatusName" DataValueField="ShipmentStatus"  SelectedValue='<%# Bind("ShipmentStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource12" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [ShipmentStatus]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label17" runat="server" Text='<%# Eval("ShippingStatusName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="退貨申請" SortExpression="ReturnRequest">
                        <EditItemTemplate>                            
                            <asp:DropDownList ID="DropDownList21" runat="server" AppendDataBoundItems="True"
                                DataSourceID="SqlDataSource14" DataTextField="ReturnFactors"
                                DataValueField="ReturnRequest" SelectedValue='<%# Bind("ReturnFactors") %>'>
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource14" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [ReturnFactors]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label18" runat="server" Text='<%# Eval("ReturnFactors") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="NumberOfLineItems" DataSourceID="SqlDataSource111" DefaultMode="Insert" Height="99px" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                <EditRowStyle BackColor="#2461BF" />
                <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="NumberOfLineItems" HeaderText="訂單項次" InsertVisible="False" ReadOnly="True" SortExpression="NumberOfLineItems" />
                    <asp:TemplateField HeaderText="訂單號碼" SortExpression="OrderNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("OrderNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList22" runat="server" DataSourceID="SqlDataSource2" DataTextField="OrderNumber" DataValueField="OrderNumber" SelectedValue='<%# Bind("OrderNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [OrderSalesManagement]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("OrderNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="書名" SortExpression="ItemID">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ItemID") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList23" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Title" DataValueField="ItemID" SelectedValue='<%# Bind("ItemID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Commodity]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemID") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="數量" SortExpression="quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("quantity") %>'></asp:TextBox>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="amounts" HeaderText="銷售金額" SortExpression="amounts" />
                    <asp:BoundField DataField="remark" HeaderText="備註" SortExpression="remark" />
                    <asp:CommandField ButtonType="Button" ShowInsertButton="True"  ValidationGroup="a2"/>
                </Fields>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
            </asp:DetailsView>
            <br />
              <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="NumberOfLineItems" DataSourceID="SqlDataSource111" PageSize="5" style="margin-top: 0px">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True"  ValidationGroup="a1"/>
                    <asp:BoundField DataField="NumberOfLineItems" HeaderText="訂單項次" InsertVisible="False" ReadOnly="True" SortExpression="NumberOfLineItems" />
                    <asp:BoundField DataField="OrderNumber" HeaderText="訂單號碼" SortExpression="OrderNumber" />
                    <asp:TemplateField HeaderText="書名" SortExpression="ItemID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList24" runat="server" DataSourceID="SqlDataSource4" DataTextField="Title" DataValueField="ItemID" SelectedValue='<%# Bind("ItemID") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                             ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                             SelectCommand="SELECT * FROM [Commodity]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
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
            <asp:SqlDataSource ID="SqlDataSource111" runat="server"
                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>"
                SelectCommand="SELECT a.*,b.Title FROM [ItemDetails] a
                left join [Commodity] b on a.ItemID=b.ItemID WHERE ([OrderNumber] = @OrderNumber)" 
                DeleteCommand="DELETE FROM [ItemDetails] WHERE [NumberOfLineItems] = @NumberOfLineItems" 
                InsertCommand="INSERT INTO [ItemDetails] ([OrderNumber], [ItemID], [quantity], [amounts], [remark]) VALUES (@OrderNumber, @ItemID, @quantity, @amounts, @remark)" 
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
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="OrderNumber" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
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
        </div>  
    </form>
</body>
</html>
