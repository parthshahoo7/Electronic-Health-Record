<%@ Page Title="" Language="C#" MasterPageFile="~/Appointment/appointment.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="Electronic_Health_Record.Appointment.edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>New event</title>
    <link href="../css/appointment/modal.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table border="0" cellspacing="4" cellpadding="0">
            <tr>
                <td align="right"></td>
                <td>
                    <div class="header">Edit Time Slot</div>
                    <asp:LinkButton ID="LinkButtonDelete" runat="server" OnClick="LinkButtonDelete_Click">Delete</asp:LinkButton>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td align="right">Start:</td>
                <td><asp:TextBox ID="TextBoxStart" runat="server" Width="200px" Enabled="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">End:</td>
                <td><asp:TextBox ID="TextBoxEnd" runat="server" Width="200px" Enabled="false"></asp:TextBox></td>
            </tr>
            <tr>
                <td align="right">Doctor:</td>
                <td><asp:DropDownList ID="DropDownListRoom" runat="server" Width="200px" Enabled="false"></asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right">Status:</td>
                <td><asp:DropDownList ID="DropDownListStatus" runat="server" >
                        <asp:ListItem Value="free">Free</asp:ListItem>
                        <asp:ListItem Value="waiting">Waiting</asp:ListItem>
                        <asp:ListItem Value="confirmed">Confirmed</asp:ListItem>
                    </asp:DropDownList></td>
            </tr>
            <tr>
                <td align="right">Name:</td>
                <td><asp:TextBox ID="TextBoxName" runat="server" Width="200px"></asp:TextBox></td>
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
            $("#DropDownListStatus").change(function () {
                var status = $(this).val();
                var disabled = status === "free";
                $("#TextBoxName").prop("disabled", disabled);
                if (disabled) {
                    $("#TextBoxName").val("");
                }
            });
            $("#DropDownListStatus").change();
        });
    </script>
</asp:Content>
