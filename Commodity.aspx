<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Commodity.aspx.cs" Inherits="Myproject01.Commodity" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            商品管理
            <asp:Button ID="Button1" runat="server" Text="回首頁" ValidationGroup="a1" OnClick="Button1_Click" />
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" Height="50px" DefaultMode="Insert" OnPageIndexChanging="DetailsView1_PageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                <Fields>
                    <asp:BoundField DataField="ItemID" HeaderText="商品編號" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                    <asp:TemplateField HeaderText="國際書碼" SortExpression="InternationalBookCode">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("InternationalBookCode") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("InternationalBookCode") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("InternationalBookCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="書名" SortExpression="Title">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="分類" SortExpression="Classify">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Classify") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ClassificationStatusName" DataValueField="classify" SelectedValue='<%# Bind("Classify") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" SelectCommand="SELECT * FROM [Classify]"></asp:SqlDataSource>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Classify") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="出版社" SortExpression="PublishingHouse">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PublishingHouse") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("PublishingHouse") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Bind("PublishingHouse") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="作者" SortExpression="Author">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Author") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Bind("Author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Binding" HeaderText="裝訂方式" SortExpression="Binding" />
                    <asp:BoundField DataField="Specification" HeaderText="規格" SortExpression="Specification" />
                    <asp:TemplateField HeaderText="出版日" SortExpression="PublicationDate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("PublicationDate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("PublicationDate") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="不可為空白"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Bind("PublicationDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="readingAge" HeaderText="適讀年齡" SortExpression="readingAge" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerSettings PageButtonCount="5" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:annaConnectionString %>"
                DeleteCommand="DELETE FROM [Commodity] WHERE [ItemID] = @original_ItemID AND [InternationalBookCode] = @original_InternationalBookCode AND [Title] = @original_Title AND [Classify] = @original_Classify AND [PublishingHouse] = @original_PublishingHouse AND [Author] = @original_Author AND (([Binding] = @original_Binding) OR ([Binding] IS NULL AND @original_Binding IS NULL)) AND (([Specification] = @original_Specification) OR ([Specification] IS NULL AND @original_Specification IS NULL)) AND [PublicationDate] = @original_PublicationDate AND (([readingAge] = @original_readingAge) OR ([readingAge] IS NULL AND @original_readingAge IS NULL)) AND (([SetNumber] = @original_SetNumber) OR ([SetNumber] IS NULL AND @original_SetNumber IS NULL))"
                InsertCommand="INSERT INTO [Commodity] ([InternationalBookCode], [Title], [Classify], [PublishingHouse], [Author], [Binding], [Specification], [PublicationDate], [readingAge], [SetNumber]) VALUES (@InternationalBookCode, @Title, @Classify, @PublishingHouse, @Author, @Binding, @Specification, @PublicationDate, @readingAge, @SetNumber)"
                SelectCommand="SELECT a.*,b.ClassificationStatusName FROM [Commodity] a left join [Classify] b on a.Classify=b.classify"
                UpdateCommand="UPDATE [Commodity] SET [InternationalBookCode] = @InternationalBookCode, [Title] = @Title, [Classify] = @Classify, [PublishingHouse] = @PublishingHouse, [Author] = @Author, [Binding] = @Binding, [Specification] = @Specification, [PublicationDate] = @PublicationDate, [readingAge] = @readingAge, [SetNumber] = @SetNumber 
                WHERE ItemID = @ItemID" >
                <DeleteParameters>
                    <asp:Parameter Name="original_ItemID" Type="Int32" />
                    <asp:Parameter Name="original_InternationalBookCode" Type="String" />
                    <asp:Parameter Name="original_Title" Type="String" />
                    <asp:Parameter Name="original_Classify" Type="Int32" />
                    <asp:Parameter Name="original_PublishingHouse" Type="String" />
                    <asp:Parameter Name="original_Author" Type="String" />
                    <asp:Parameter Name="original_Binding" Type="String" />
                    <asp:Parameter Name="original_Specification" Type="String" />
                    <asp:Parameter Name="original_PublicationDate" Type="DateTime" />
                    <asp:Parameter Name="original_readingAge" Type="String" />
                    <asp:Parameter Name="original_SetNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="InternationalBookCode" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Classify" Type="Int32" />
                    <asp:Parameter Name="PublishingHouse" Type="String" />
                    <asp:Parameter Name="Author" Type="String" />
                    <asp:Parameter Name="Binding" Type="String" />
                    <asp:Parameter Name="Specification" Type="String" />
                    <asp:Parameter Name="PublicationDate" Type="DateTime" />
                    <asp:Parameter Name="readingAge" Type="String" />
                    <asp:Parameter Name="SetNumber" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="InternationalBookCode" Type="String" />
                    <asp:Parameter Name="Title" Type="String" />
                    <asp:Parameter Name="Classify" Type="Int32" />
                    <asp:Parameter Name="PublishingHouse" Type="String" />
                    <asp:Parameter Name="Author" Type="String" />
                    <asp:Parameter Name="Binding" Type="String" />
                    <asp:Parameter Name="Specification" Type="String" />
                    <asp:Parameter Name="PublicationDate" Type="DateTime" />
                    <asp:Parameter Name="readingAge" Type="String" />
                    <asp:Parameter Name="SetNumber" Type="Int32" />
                    <asp:Parameter Name="original_ItemID" Type="Int32" />
                    <asp:Parameter Name="original_InternationalBookCode" Type="String" />
                    <asp:Parameter Name="original_Title" Type="String" />
                    <asp:Parameter Name="original_Classify" Type="Int32" />
                    <asp:Parameter Name="original_PublishingHouse" Type="String" />
                    <asp:Parameter Name="original_Author" Type="String" />
                    <asp:Parameter Name="original_Binding" Type="String" />
                    <asp:Parameter Name="original_Specification" Type="String" />
                    <asp:Parameter Name="original_PublicationDate" Type="DateTime" />
                    <asp:Parameter Name="original_readingAge" Type="String" />
                    <asp:Parameter Name="original_SetNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource1" PageSize="5" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <Columns>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ShowEditButton="True" ValidationGroup="a1" />
                    <asp:BoundField DataField="ItemID" HeaderText="商品編號" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
                    <asp:BoundField DataField="InternationalBookCode" HeaderText="國際書碼" SortExpression="InternationalBookCode" />
                    <asp:BoundField DataField="Title" HeaderText="書名" SortExpression="Title" />
                    <asp:TemplateField HeaderText="分類" SortExpression="Classify">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" 
                                AutoPostBack="True" DataSourceID="SqlDataSource4"
                                DataTextField="ClassificationStatusName"
                                DataValueField="classify" SelectedValue='<%# Bind("Classify") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                ConnectionString="<%$ ConnectionStrings:annaConnectionString %>" 
                                SelectCommand="SELECT * FROM [Classify]"></asp:SqlDataSource>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="LabelClassify" runat="server" Text='<%# Eval("ClassificationStatusName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="PublishingHouse" HeaderText="出版社" SortExpression="PublishingHouse" />
                    <asp:BoundField DataField="Author" HeaderText="作者" SortExpression="Author" />
                    <asp:BoundField DataField="Binding" HeaderText="裝訂方式" SortExpression="Binding" />
                    <asp:BoundField DataField="Specification" HeaderText="規格" SortExpression="Specification" />
                    <asp:BoundField DataField="PublicationDate" HeaderText="出版日" SortExpression="PublicationDate" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="readingAge" HeaderText="適讀年齡" SortExpression="readingAge" />
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
