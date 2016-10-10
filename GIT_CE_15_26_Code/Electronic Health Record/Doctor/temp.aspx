<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="temp.aspx.cs" Inherits="Electronic_Health_Record.Doctor.temp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .modalBackground {
            background-color: black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: rgba(237, 236, 236, 0.73);
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 240px;
            height: 240px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
        <div>
            <asp:Calendar ID="confirmappointment" OnSelectionChanged="confirmappointment_SelectionChanged" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="384px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="901px">
                <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="14pt" ForeColor="#333333" Height="10pt" />
                <DayStyle Width="14%" />
                <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                <TodayDayStyle BackColor="#CCCC99" />
            </asp:Calendar>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            <%--<ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" BackgroundCssClass="modalBackground" runat="server" PopupControlID="popup1" CancelControlID="cancle" TargetControlID="Label1"></ajaxToolkit:ModalPopupExtender>--%>
            <asp:Panel ID="popup1" runat="server" CssClass="modalPopup" align="center" style="display:none">
                <asp:Table ID="Table1" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                <asp:ListItem Text="8:00-8:30" />
                                <asp:ListItem Text="8:30-9:00" />
                                <asp:ListItem Text="9:00-9:30" />
                                <asp:ListItem Text="9:30-10:00" />
                            </asp:CheckBoxList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button Text="cancle" ID="cancle" runat="server" />
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:button text="submit" ID="submit" runat="server" />
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:Panel>

            <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
        </div>
    </form>
</body>
</html>
