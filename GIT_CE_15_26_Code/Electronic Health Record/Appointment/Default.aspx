<%@ Page Title="" Language="C#" MasterPageFile="~/Appointment/appointment.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Electronic_Health_Record.Appointment.Default" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Request an Appointment</h1>

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
    <p>Available time slots:</p>
  
    <DayPilot:DayPilotCalendar 
        runat="server" 
        ID="DayPilotCalendar1"
        ClientIDMode="Static"
        ClientObjectName="dp"
        ViewType="Week"
        
        DurationBarWidth="10"
        
        OnCommand="DayPilotCalendar1_OnCommand"
        OnBeforeEventRender="DayPilotCalendar1_OnBeforeEventRender"
        
        EventClickHandling="JavaScript"
        EventClickJavaScript="edit(e)"
        />
</div>    
    
    
<script>
    function edit(e) {
        new DayPilot.Modal({
            onClosed: function (args) {
                if (args.result == "OK") {
                    dp.commandCallBack('refresh');
                }
            }
        }).showUrl("Request.aspx?id=" + e.id());
    }
</script>
</asp:Content>
