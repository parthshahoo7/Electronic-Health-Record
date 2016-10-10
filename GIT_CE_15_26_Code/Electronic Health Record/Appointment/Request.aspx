<%@ Page Title="" Language="C#" MasterPageFile="~/Appointment/appointment.Master" AutoEventWireup="true" CodeBehind="Request.aspx.cs" Inherits="Electronic_Health_Record.Appointment.Request" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../css/appointment/modal.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table border="0" cellspacing="4" cellpadding="0">
            <tr>
                <td align="right"></td>
                <td>
                    <div class="header">Request an Appointment</div>
                </td>
            </tr>
            <tr>
                <td align="right">Start:</td>
                <td>
                    <asp:TextBox ID="TextBoxStart" runat="server" Width="200px" Enabled="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">End:</td>
                <td>
                    <asp:TextBox ID="TextBoxEnd" runat="server" Width="200px" Enabled="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">Your Name:</td>
                <td>
                    <asp:TextBox ID="TextBoxName" runat="server" Width="200px"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right"></td>
                <td>
                    <asp:Button ID="ButtonOK" runat="server" OnClick="ButtonOK_Click" Text="  OK  " />
                    <asp:Button ID="ButtonCancel" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />
                </td>
            </tr>
        </table>

    </div>
    <script>
        $(document).ready(function () {
            $("#TextBoxName").keyup(function () {
                var text = $(this).val();
                $("#CheckBoxScheduled").prop("checked", !!text);
            })
        });
    </script>
</asp:Content>
