<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="Electronic_Health_Record.temp.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:CheckBoxList
                ID="cblManufacturer"
                runat="server"
                DataSourceID="SqlDataSource1"
                DataTextField="Manufacturer"
                DataValueField="Manufacturer">
            </asp:CheckBoxList>

            <asp:Button ID="btnGetSubs" runat="server" Text="Get Subs" OnClick="GetModels" />
            <br />
            <br />
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
            <br />
            <asp:HiddenField ID="hfManu" runat="server" />
        </div>
    </form>
    <asp:SqlDataSource
        ID="SqlDataSource1"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ForumConnectionString1 %>"
        ProviderName="<%$ ConnectionStrings:ForumConnectionString1.ProviderName %>"
        SelectCommand="SELECT DISTINCT Manufacturer FROM Manufacturers"></asp:SqlDataSource>


    <asp:SqlDataSource
        ID="SqlDataSource2"
        runat="server"
        ConnectionString="<%$ ConnectionStrings:ForumConnectionString1 %>"
        ProviderName="<%$ ConnectionStrings:ForumConnectionString1.ProviderName %>"
        SelectCommand="SELECT DISTINCT Model FROM Models WHERE Manufacturer = @Manufacturer">
        <SelectParameters>
            <asp:ControlParameter Name="Manufacturer" ControlID="hfManu" PropertyName="Value" />
        </SelectParameters>
    </asp:SqlDataSource>
</body>
</html>
