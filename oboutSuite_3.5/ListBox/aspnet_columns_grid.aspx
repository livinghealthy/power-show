﻿<%@ Page Language="C#" MasterPageFile="~/ListBox/ListBox.master" %>
<%@ Register TagPrefix="obout" Namespace="Obout.ListBox" Assembly="obout_ListBox" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .item
        {
            position: relative !important;
            display:-moz-inline-stack;
            display:inline-block;
            zoom:1;
            *display:inline;
            overflow: hidden;
            white-space: nowrap;
        }
        
        .header
        {
            margin-left: 2px;
        }
   
        .c1
        {
            width: 25px;
        }
        
        .c2
        {
            margin-left: 10px;
            width: 180px;
        }
        
        * HTML .c2
        {
            -margin-left: 0px;
        }
        
        .c3
        {
            margin-left: 10px;
            width: 90px;
        }
        
        * HTML .c3
        {
            -margin-left: 0px;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <br />
    
    <span class="tdText"><b>ASP.NET ListBox - Grid-Like Multi-Columns with Header and Footer</b></span>	
    
    <br /><br />
    
    <obout:ListBox runat="server" ID="ListBox3" Width="400" Height="150"
	    DataSourceID="sds1" DataTextField="CompanyName" DataValueField="SupplierID"
	    >
	    <HeaderTemplate>
	        <div class="header c1">ID</div>
	        <div class="header c2">COMPANY NAME</div>
	        <div class="header c3">CITY</div>
	    </HeaderTemplate>
	    <ItemTemplate>
	        <div class="item c1"><%# Eval("SupplierID") %></div>
	        <div class="item c2"><%# Eval("CompanyName") %></div>
	        <div class="item c3"><%# Eval("City") %></div>
	    </ItemTemplate>
	    <FooterTemplate>
	        Displaying <%# Container.ItemsCount %> items.
	    </FooterTemplate>
	</obout:ListBox>
    
    <asp:SqlDataSource ID="sds1" runat="server" SelectCommand="SELECT * FROM Suppliers"
		    ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;" ProviderName="System.Data.OleDb"></asp:SqlDataSource>
    
    <br /><br />
    
    <span class="tdText">
        The items of the ListBox can be displayed in a grid-like structure. By using item templates, <br />
        you can display as many columns of data as you wish. A header and a footer can also be displayed, <br />
        to make the list with items look even more like a grid view.<br /><br />
        
        You can display any data field in the item template, by using the <b>Eval</b> method.<br /><br />
        
        When using this approach to display items, your end users will still benefit from the other features of the ListBox:<br />
        load on demand, virtual scrolling, etc.
    </span>
    
</asp:Content>