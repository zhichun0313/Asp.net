<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PersonnelFinancelManagement.aspx.cs" Inherits="Myproject01.PersonnelFinancelManagement" %>

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
            人事管理 <asp:Button ID="Button1" runat="server" Text="回首頁" OnClick="Button1_Click" ValidationGroup="a1"/>
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="EmployeeNumber" DataSourceID="SqlDataSource1" Height="50px" CellPadding="4" DefaultMode="Insert" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                <EditRowStyle BackColor="#999999" />
                <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="EmployeeNumber" HeaderText="員工編碼" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeNumber" />
                    <asp:TemplateField HeaderText="部門名稱" SortExpression="DepartmentNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("DepartmentNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="DepartmentName" DataValueField="DepartmentNumber" SelectedValue='<%# Bind("DepartmentNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Department]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("DepartmentNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="員工代碼" SortExpression="EmployeeCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="員工姓名" SortExpression="EmployeeName">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"  ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("EmployeeName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="職稱" SortExpression="titleNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("titleNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="JobTitle" DataValueField="titleNumber" SelectedValue='<%# Bind("titleNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [TitleName]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("titleNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="居住地" SortExpression="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                            <asp:CustomValidator ID="CustomValidator2" runat="server"  
                             ControlToValidate="TextBox3" ErrorMessage="*地址不得空白，須包含門牌號碼"
                             ValidateEmptyText="True" ClientValidationFunction="checkAddress">
                             </asp:CustomValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="生日" SortExpression="Birthday">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Birthday") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Birthday") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                                ControlToValidate="TextBox4" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"
                              ControlToValidate="TextBox4" ErrorMessage="日期格式錯誤(yyyy/mm/dd)"
                              ValidationExpression="^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$">
                             </asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Bind("Birthday") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性別" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource4" DataTextField="GenderName" DataValueField="gender" AutoPostBack="True" SelectedValue='<%# Bind("gender") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [gender]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="手機號碼" SortExpression="phoneNumber">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                ControlToValidate="TextBox5" 
                                ValidationExpression="((\d{10})|(((\(\d{2}\))|(\d{2}-))?\d{4}(-)?\d{3}(\d)?))" 
                                ErrorMessage="手機格式有誤"></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="到職日" SortExpression="ArrivalDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("ArrivalDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ArrivalDate") %>'></asp:TextBox>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                              ControlToValidate="TextBox6" ErrorMessage="日期格式錯誤(yyyy/mm/dd)"
                              ValidationExpression="^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$">
                            </asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Bind("ArrivalDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="離職日" SortExpression="DepartureDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("DepartureDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("DepartureDate") %>'></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                              ControlToValidate="TextBox7" ErrorMessage="日期格式錯誤(yyyy/mm/dd)"
                              ValidationExpression="^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$">
                             </asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Bind("DepartureDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="就職狀態" SortExpression="JobStatus">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("JobStatus") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource5" DataTextField="JobStatusTitleName" DataValueField="JobStatus" SelectedValue='<%# Bind("JobStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [JobStatus]">
                            </asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("JobStatus") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                DeleteCommand="DELETE FROM [PersonnelfinancelManagement] WHERE [EmployeeNumber] = @EmployeeNumber" 
                InsertCommand="INSERT INTO [PersonnelfinancelManagement] ([DepartmentNumber], [EmployeeCode], [EmployeeName], [titleNumber], [Address], [Birthday], [gender], [phoneNumber], [ArrivalDate], [DepartureDate], [JobStatus]) VALUES (@DepartmentNumber, @EmployeeCode, @EmployeeName, @titleNumber, @Address, @Birthday, @gender, @phoneNumber, @ArrivalDate, @DepartureDate, @JobStatus)" 
                SelectCommand="SELECT a.*,b.DepartmentName,c.JobTitle ,d.GenderName,e.JobStatusTitleName
                FROM [PersonnelfinancelManagement] a
                left join [Department] b on a.DepartmentNumber=b.DepartmentNumber
                left join [TitleName] c on a.titleNumber=c.titleNumber
                left join [gender] d on a.gender=d.gender
                left join [JobStatus] e on a.JobStatus=e.JobStatus"
                UpdateCommand="UPDATE [PersonnelfinancelManagement] SET [DepartmentNumber] = @DepartmentNumber, [EmployeeCode] = @EmployeeCode, [EmployeeName] = @EmployeeName, [titleNumber] = @titleNumber, [Address] = @Address, [Birthday] = @Birthday, [gender] = @gender, [phoneNumber] = @phoneNumber, [ArrivalDate] = @ArrivalDate, [DepartureDate] = @DepartureDate, [JobStatus] = @JobStatus WHERE [EmployeeNumber] = @EmployeeNumber">
                <DeleteParameters>
                    <asp:Parameter Name="EmployeeNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="DepartmentNumber" Type="Int32" />
                    <asp:Parameter Name="EmployeeCode" Type="String" />
                    <asp:Parameter Name="EmployeeName" Type="String" />
                    <asp:Parameter Name="titleNumber" Type="Int32" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Birthday" Type="DateTime" />
                    <asp:Parameter Name="gender" Type="Int32" />
                    <asp:Parameter Name="phoneNumber" Type="String" />
                    <asp:Parameter Name="ArrivalDate" Type="DateTime" />
                    <asp:Parameter Name="DepartureDate" Type="DateTime" />
                    <asp:Parameter Name="JobStatus" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="DepartmentNumber" Type="Int32" />
                    <asp:Parameter Name="EmployeeCode" Type="String" />
                    <asp:Parameter Name="EmployeeName" Type="String" />
                    <asp:Parameter Name="titleNumber" Type="Int32" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="Birthday" Type="DateTime" />
                    <asp:Parameter Name="gender" Type="Int32" />
                    <asp:Parameter Name="phoneNumber" Type="String" />
                    <asp:Parameter Name="ArrivalDate" Type="DateTime" />
                    <asp:Parameter Name="DepartureDate" Type="DateTime" />
                    <asp:Parameter Name="JobStatus" Type="Int32" />
                    <asp:Parameter Name="EmployeeNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="EmployeeNumber" DataSourceID="SqlDataSource1" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1"/>
                    <asp:BoundField DataField="EmployeeNumber" HeaderText="員工編號" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeNumber" />
                    <asp:TemplateField HeaderText="部門名稱" SortExpression="DepartmentNumber">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource2" 
                            DataTextField="DepartmentName" DataValueField="DepartmentNumber" SelectedValue='<%# Bind("DepartmentNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Department]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("DepartmentName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="EmployeeCode" HeaderText="員工代碼" SortExpression="EmployeeCode" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="員工姓名" SortExpression="EmployeeName" />
                    <asp:TemplateField HeaderText="職稱" SortExpression="titleNumber">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSource3"
                                DataTextField="JobTitle" DataValueField="titleNumber"  SelectedValue='<%# Bind("titleNumber") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [TitleName]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("JobTitle") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Address" HeaderText="居住地" SortExpression="Address" />
                    <asp:BoundField DataField="Birthday" HeaderText="生日" SortExpression="Birthday" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderText="性別" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="SqlDataSource4" 
                                DataTextField="GenderName" DataValueField="gender"  SelectedValue='<%# Bind("gender") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Eval("GenderName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="phoneNumber" HeaderText="手機號碼" SortExpression="phoneNumber" />
                    <asp:BoundField DataField="ArrivalDate" HeaderText="到職日" SortExpression="ArrivalDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="DepartureDate" HeaderText="離職日" SortExpression="DepartureDate" DataFormatString="{0:d}" />
                    <asp:TemplateField HeaderText="就職狀態" SortExpression="JobStatus">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSource5" 
                                DataTextField="JobStatusTitleName" DataValueField="JobStatus"  SelectedValue='<%# Bind("JobStatus") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [JobStatus]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label13" runat="server" Text='<%# Eval("JobStatusTitleName") %>'></asp:Label>
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
        </div>
    </form>
</body>
</html>
