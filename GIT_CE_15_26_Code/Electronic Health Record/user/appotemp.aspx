<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" AutoEventWireup="true" CodeBehind="appotemp.aspx.cs" Inherits="Electronic_Health_Record.appotemp" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/daypilot-modal-2.2.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
