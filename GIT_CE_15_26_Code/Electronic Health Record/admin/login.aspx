<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Electronic_Health_Record.admin.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
        <tr>
            <td>
                Username: &nbsp;<asp:TextBox ID="txtUname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Password: &nbsp;<asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
