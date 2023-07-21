<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Myproject01.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/PersonnelFinancelManagement.aspx">人事管理</asp:LinkButton>
         <br />
        <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Vendor.aspx">供應商管理</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/Commodity.aspx">商品管理</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/MemberData.aspx" >會員管理</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/PleasePurchaseInboundManagement.aspx">採購入庫管理</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/OrderSalesManagement.aspx">訂單銷售管理</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton8" runat="server" PostBackUrl="~/Level.aspx">會員等級</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton9" runat="server" PostBackUrl="~/ReturnRequest.aspx">退貨因素</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton10" runat="server" PostBackUrl="~/classify.aspx">分類</asp:LinkButton>
        <br />
        <asp:LinkButton ID="LinkButton11" runat="server" PostBackUrl="~/Preference.aspx">喜好興趣</asp:LinkButton>
    </form>
</body>
</html>
