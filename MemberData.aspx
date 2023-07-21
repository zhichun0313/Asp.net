<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberData.aspx.cs" Inherits="Myproject01.MemberData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div>
            會員管理<asp:Button ID="Button1" runat="server" Text="回首頁"  ValidationGroup="a1" OnClick="Button1_Click"/>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="MemberNumber" DataSourceID="SqlDataSource1" Height="50px" CellPadding="4" DefaultMode="Insert" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="MemberNumber" HeaderText="會員編號" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
                    <asp:TemplateField HeaderText="會員姓名" SortExpression="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="phoneNumber" HeaderText="手機電話" SortExpression="phoneNumber" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="birthdayDate" HeaderText="生日" SortExpression="birthdayDate" />
                    <asp:BoundField DataField="MembershipAddress" HeaderText="居住地" SortExpression="MembershipAddress" />
                    <asp:TemplateField HeaderText="星座" SortExpression="constellation">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("constellation") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource2" DataTextField="constellationName"
                                DataValueField="constellation" SelectedValue='<%# Bind("constellation") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [constellation]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("constellation") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="職業" SortExpression="Occupation">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Occupation") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                                DataSourceID="SqlDataSource3" DataTextField="JobName" DataValueField="Occupation" SelectedValue='<%# Bind("Occupation") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Occupation]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Occupation") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性別" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("gender") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="GenderName" DataValueField="gender" SelectedValue='<%# Bind("gender") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="喜好" SortExpression="Preference">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Preference") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="PreferenceName" DataValueField="Preference" SelectedValue='<%# Bind("Preference") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Preference]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Preference") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ElectronicInvoiceCarriers" HeaderText="手機條碼" SortExpression="ElectronicInvoiceCarriers" />
                    <asp:BoundField DataField="UniformNumbering" HeaderText="統一編號" SortExpression="UniformNumbering" />
                    <asp:TemplateField HeaderText="會員等級" SortExpression="MembershipLevel">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("MembershipLevel") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="RankName" DataValueField="MembershipLevel" SelectedValue='<%# Bind("MembershipLevel") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [MembershipLevel]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("MembershipLevel") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerSettings PageButtonCount="5" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>"
                DeleteCommand="DELETE FROM [memberData] WHERE [MemberNumber] = @MemberNumber"
                InsertCommand="INSERT INTO [memberData] ([Name], [phoneNumber], [Email], [birthdayDate], [MembershipAddress], [constellation], [Occupation], [gender], [Preference], [ElectronicInvoiceCarriers], [UniformNumbering], [MembershipLevel]) VALUES (@Name, @phoneNumber, @Email, @birthdayDate, @MembershipAddress, @constellation, @Occupation, @gender, @Preference, @ElectronicInvoiceCarriers, @UniformNumbering, @MembershipLevel)"
                SelectCommand="SELECT a.*,b.GenderName,c.PreferenceName,d.RankName,e.constellationName,f.JobName FROM [memberData] a
                left join [gender] b on a.gender=b.gender  
                left join [Preference] c on a.Preference=c.Preference
                left join  [MembershipLevel] d on a.MembershipLevel=d.MembershipLevel
                left join [constellation] e on a.constellation=e.constellation
                left join [Occupation] f on a.Occupation=f.Occupation"  
                UpdateCommand="UPDATE [memberData] SET [Name] = @Name, [phoneNumber] = @phoneNumber, [Email] = @Email, [birthdayDate] = @birthdayDate, [MembershipAddress] = @MembershipAddress, [constellation] = @constellation, [Occupation] = @Occupation, [gender] = @gender, [Preference] = @Preference, [ElectronicInvoiceCarriers] = @ElectronicInvoiceCarriers, [UniformNumbering] = @UniformNumbering, [MembershipLevel] = @MembershipLevel WHERE [MemberNumber] = @MemberNumber">
                <DeleteParameters>
                    <asp:Parameter Name="MemberNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="phoneNumber" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="birthdayDate" Type="DateTime" />
                    <asp:Parameter Name="MembershipAddress" Type="String" />
                    <asp:Parameter Name="constellation" Type="Int32" />
                    <asp:Parameter Name="Occupation" Type="Int32" />
                    <asp:Parameter Name="gender" Type="Int32" />
                    <asp:Parameter Name="Preference" Type="Int32" />
                    <asp:Parameter Name="ElectronicInvoiceCarriers" Type="String" />
                    <asp:Parameter Name="UniformNumbering" Type="String" />
                    <asp:Parameter Name="MembershipLevel" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="phoneNumber" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="birthdayDate" Type="DateTime" />
                    <asp:Parameter Name="MembershipAddress" Type="String" />
                    <asp:Parameter Name="constellation" Type="Int32" />
                    <asp:Parameter Name="Occupation" Type="Int32" />
                    <asp:Parameter Name="gender" Type="Int32" />
                    <asp:Parameter Name="Preference" Type="Int32" />
                    <asp:Parameter Name="ElectronicInvoiceCarriers" Type="String" />
                    <asp:Parameter Name="UniformNumbering" Type="String" />
                    <asp:Parameter Name="MembershipLevel" Type="Int32" />
                    <asp:Parameter Name="MemberNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MemberNumber" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" PageSize="5">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1" />
                    <asp:BoundField DataField="MemberNumber" HeaderText="會員編號" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
                    <asp:BoundField DataField="Name" HeaderText="會員姓名" SortExpression="Name" />
                    <asp:BoundField DataField="phoneNumber" HeaderText="手機電話" SortExpression="phoneNumber" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="birthdayDate" HeaderText="生日" SortExpression="birthdayDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="MembershipAddress" HeaderText="居住地" SortExpression="MembershipAddress" />
                    <asp:TemplateField HeaderText="星座" SortExpression="constellation">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSource4"
                                DataTextField="constellationName" DataValueField="constellation"  SelectedValue='<%# Bind("constellation") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [constellation]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label10" runat="server" Text='<%# Eval("constellationName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="職業" SortExpression="Occupation">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSource5" 
                                DataTextField="JobName" DataValueField="Occupation"  SelectedValue='<%# Bind("Occupation") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Occupation]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label11" runat="server" Text='<%# Eval("JobName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="性別" SortExpression="gender">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSource9"
                                DataTextField="GenderName" DataValueField="gender"  SelectedValue='<%# Bind("gender") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("GenderName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="喜好" SortExpression="Preference">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="SqlDataSource7" 
                                DataTextField="PreferenceName" DataValueField="Preference"  SelectedValue='<%# Bind("Preference") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Preference]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("PreferenceName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ElectronicInvoiceCarriers" HeaderText="手機條碼" SortExpression="ElectronicInvoiceCarriers" />
                    <asp:BoundField DataField="UniformNumbering" HeaderText="統一編號" SortExpression="UniformNumbering" />
                    <asp:TemplateField HeaderText="會員等級" SortExpression="MembershipLevel">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSource2" 
                                DataTextField="RankName" DataValueField="MembershipLevel"  SelectedValue='<%# Bind("MembershipLevel") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [MembershipLevel]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("RankName") %>'></asp:Label>
                            <br />
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
        </div>
    </form>
</body>
</html>
