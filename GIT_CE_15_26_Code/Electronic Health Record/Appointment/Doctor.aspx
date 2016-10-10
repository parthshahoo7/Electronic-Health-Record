<%@ Page Title="" Language="C#" MasterPageFile="~/Appointment/appointment.Master" AutoEventWireup="true" CodeBehind="Doctor.aspx.cs" Inherits="Electronic_Health_Record.Appointment.Doctor" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../js/daypilot-modal-2.2.js" type="text/javascript"></script>
    <script src="../js/jquery-1.9.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Manage Doctor's Schedule</h1>
    <div class="space">
    Doctor: 
    <asp:DropDownList runat="server" ID="DropDownListDoctor" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="DropDownListDoctor_OnSelectedIndexChanged">
            <asp:ListItem Value="NONE">(no doctors specified)</asp:ListItem>
    </asp:DropDownList>
</div>
    

    <asp:Panel runat="server" ID="Schedule">
    <div style="float:left; width: 150px;">
        <DayPilot:DayPilotNavigator 
            runat="server" 
            ID="DayPilotNavigator1" 
            ClientIDMode="Static"
            BoundDayPilotID="DayPilotCalendar1"
            ShowMonths="3"    
            SelectMode="Week"
        
            OnBeforeCellRender="DayPilotNavigator1_OnBeforeCellRender"
            />  
    </div>
    
    <div style="margin-left: 150px;">
        <DayPilot:DayPilotCalendar 
            runat="server" 
            ID="DayPilotCalendar1"
            ClientObjectName="dp"
            ClientIDMode="Static"
            ViewType="Week"
        
            OnCommand="DayPilotCalendar1_OnCommand"
            TimeRangeSelectedHandling="CallBack"
            OnTimeRangeSelected="DayPilotCalendar1_OnTimeRangeSelected"
            OnBeforeEventRender="DayPilotCalendar1_OnBeforeEventRender"
            EventClickHandling="JavaScript"
            EventClickJavaScript="edit(e);"
            EventMoveHandling="CallBack"
            OnEventMove="DayPilotCalendar1_OnEventMove"
            EventResizeHandling="CallBack"
            OnEventResize="DayPilotCalendar1_OnEventResize"
            />
    </div>
</asp:Panel>

    <script>
        function edit(e) {
            new DayPilot.Modal({
                onClosed: function (args) {
                    if (args.result == "OK") {
                        dp.commandCallBack('refresh');
                    }
                }
            }).showUrl("Edit.aspx?id=" + e.id());
        }
</script>
</asp:Content>
