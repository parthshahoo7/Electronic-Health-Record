﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Appointment/appointment.Master" AutoEventWireup="true" CodeBehind="Manager.aspx.cs" Inherits="Electronic_Health_Record.Appointment.Manager" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="float:left; width: 150px;">
            
        <DayPilot:DayPilotNavigator 
            runat="server" 
            ID="DayPilotNavigator1" 
            ClientIDMode="Static"
            BoundDayPilotID="DayPilotScheduler1"
            ShowMonths="3"    
            SelectMode="Month"
            />  
    </div>
    
    <div style="margin-left: 150px;">
        
        <div class="space">Scale: <a href="javascript:scale('shifts')">Shifts</a> | <a href="javascript:scale('hours')">Hours</a></div> 

        <DayPilot:DayPilotScheduler 
            runat="server" 
            ID="DayPilotScheduler1"
            ClientObjectName="dp"
            
            AllowEventOverlap="false"
            UseEventBoxes="Never"
            
            CellWidth ="40"
            DynamicEventRendering="Disabled"
            
            TimeRangeSelectedHandling="CallBack"    
            OnTimeRangeSelected="DayPilotScheduler1_OnTimeRangeSelected"   
            
            EventDeleteHandling="CallBack"
            OnEventDelete="DayPilotScheduler1_OnEventDelete"
            
            OnBeforeEventRender="DayPilotScheduler1_OnBeforeEventRender"
            OnCommand="DayPilotScheduler1_OnCommand"
            >
            <TimeHeaders>
                <DayPilot:TimeHeader GroupBy="Month" />
                <DayPilot:TimeHeader GroupBy="Day" Format="ddd d"/>
                <DayPilot:TimeHeader GroupBy="Hour" Format="ht" />
            </TimeHeaders>            
        </DayPilot:DayPilotScheduler>
        
        <div class="space"><asp:LinkButton runat="server" ID="ButtonClear" OnClick="ButtonClear_OnClick">Delete All Free Slots</asp:LinkButton> (This Month)</div>        

    </div>
    
<script>
    function scale(size) {
        dp.clientState.size = size;
        dp.commandCallBack("refresh");
    }

</script>    
</asp:Content>
