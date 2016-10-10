<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="teapp.aspx.cs" Inherits="Electronic_Health_Record.user.teapp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server">
            <asp:DataList runat="server" ID="DataList1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                <ItemTemplate>
                    <div>
                        <div style="width: 200px height:200px">
                            <asp:Image ID="docimage" runat="server" ImageUrl='<%# Bind("imagename")%>' Height="100px" Width="100px" />
                        </div>
                        <div>
                            <asp:Label Text="docname" ID="docname" runat="server" />
                        </div>
                    </div>

                </ItemTemplate>
            </asp:DataList>
        </div>
    </form>
</body>
</html>
