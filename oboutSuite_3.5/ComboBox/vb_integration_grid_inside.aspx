﻿<%@ Page Title="" Language="VB" MasterPageFile="~/ComboBox/ComboBox.master" AutoEventWireup="true" CodeFile="vb_integration_grid_inside.aspx.vb" Inherits="ComboBox_vb_integration_grid_inside" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ComboBox" Assembly="obout_ComboBox" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Interface" Assembly="obout_Interface" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    
    <span class="tdText"><b>ASP.NET ComboBox - Grid inside ComboBox</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder runat="server" ID="ComboBox1Container" /> 

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT TOP 50 * FROM Customers ORDER BY CompanyName ASC"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
	
    <br /><br />
    
    <span class="tdText">
        The items of the ComboBox can be customized using templates. You can embed any content inside an item template, <br />
        including HTML markup and ASP.NET server controls (any control from the Obout suite may be added to a template).<br /><br />
        
        In order to set up an item template, use the <b>ItemTemplate</b> property of the ComboBox.<br />
        To extract data from the data item, use the <b>Eval</b> method which expects as a parameter <br />
        the name of the data field from which to load the data. <br /><br />
        
        This example showcases the use of <b>Grid</b> control inside the ComboBox.<br />
        The end user is able to select a row from the Grid, which will be copied into the input field of the ComboBox.<br />
        To accomplish this layout, we used a single item in the ComboBox, with no value/text, <br />
        which is customized using an ItemTemplate to contain the Grid.
    </span>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var gridScrollTop = 0;

        function Grid1_Select(sender, records) {
            gridScrollTop = Grid1.GridBodyContainer.scrollTop;

            ComboBox1.text(records[0].CompanyName, true);
            ComboBox1.close();
        }

        function ComboBox1_Open() {
            window.setTimeout(restoreGridScrolling, 150);
        }

        function restoreGridScrolling() {
            Grid1.GridBodyContainer.scrollTop = gridScrollTop;
        }

        window.onload = function () {
            document.getElementById('gridContainer').onclick = stopEventPropagation;
        }

        function stopEventPropagation(e) {
            if (!e) { e = window.event; }
            if (!e) { return false; }
            e.cancelBubble = true;
            if (e.stopPropagation) { e.stopPropagation(); }

            return false;
        }
    </script>
    
    <style type="text/css">
        .ob_iCboICBC li, .ob_iCboICBC li b
        {
            height: 260px !important;
            color: #2b4c61;
        }  
        
        .ob_iCboICBC li.ih, .ob_iCboICBC li.ih b, .ob_iCboICBC li.ih i
        {
            background-image: none !important;
        }      
        
        .column
        {
            float: left;
            width: 130px 
            margin-right: 15px;
        }
        
        .column h4
        {
            font-size: 10px;
        }
    </style>
</asp:Content>