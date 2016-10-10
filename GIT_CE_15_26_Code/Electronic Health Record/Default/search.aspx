<%@ Page Title="" Language="C#" MasterPageFile="~/Default/Site1.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="Electronic_Health_Record.Default.search" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    

    <div class="contact-us">
        <div class="container">

            <div class="row">
            </div>

        </div>



        <div class="leave-msg dark-back" id="div1">

            <div class="container">
                <div class="form">
                    <div class="row">
                        <div>
                            Click on the
            ListBox and type the word to search<br />
                            <br />
                            <br />
                            <asp:ListBox ID="ListBox1" runat="server"></asp:ListBox>
                            <br />
                            <br />
                            <asp:ListSearchExtender ID="ListSearchExtender1" runat="server" TargetControlID="ListBox1">
            </asp:ListSearchExtender>
                            &nbsp;<br />
                            Click on the
            DropDownList and type the word to search<br />
                            <br />
                            <br />
                            
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            </asp:DropDownList>

                            <asp:ListSearchExtender ID="ListSearchExtender2" runat="server" TargetControlID="DropDownList1">
            </asp:ListSearchExtender>
                            <br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
</asp:Content>
