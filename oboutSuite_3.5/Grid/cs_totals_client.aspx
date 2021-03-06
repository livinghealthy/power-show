﻿<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="Obout.Grid" Assembly="obout_Grid_NET" %>

<script runat="server" Language="C#">
    Grid grid1 = new Grid();
    
    void Page_load(object sender, EventArgs e)		
	{			
		grid1.ID = "grid1";
		grid1.CallbackMode = true;
		grid1.Serialize = true;
		grid1.AutoGenerateColumns = false;		
		grid1.FolderStyle = "styles/grand_gray";
        grid1.AllowAddingRecords = false;
        grid1.DataSourceID = "sds1";
        grid1.ShowColumnsFooter = true;

        grid1.ClientSideEvents.OnClientSelect = "OnSelect";
        grid1.ClientSideEvents.OnClientCallback = "OnCallback";

		// setting the event handlers
        grid1.RowDataBound += new Obout.Grid.GridRowEventHandler(RowDataBound);		

		// creating the columns
		Column oCol1 = new Column();
		oCol1.DataField = "ProductID";
		oCol1.ReadOnly = true;
		oCol1.HeaderText = "PRODUCT ID";
		oCol1.Width = "150";
        oCol1.Visible = false;

		Column oCol2 = new Column();
		oCol2.DataField = "ProductName";
		oCol2.HeaderText = "PRODUCT NAME";
		oCol2.Width = "150";

		Column oCol3 = new Column();
		oCol3.DataField = "UnitPrice";
		oCol3.HeaderText = "PRICE";
		oCol3.Width = "150";

		Column oCol4 = new Column();
		oCol4.DataField = "UnitsInStock";
		oCol4.HeaderText = "UNITS IN STOCK";
		oCol4.Width = "150";

		Column oCol5 = new Column();
		oCol5.DataField = "UnitsOnOrder";
		oCol5.HeaderText = "UNITS ON ORDER";
		oCol5.Width = "150";

		// add the columns to the Columns collection of the grid
		grid1.Columns.Add(oCol1);
		grid1.Columns.Add(oCol2);
		grid1.Columns.Add(oCol3);
		grid1.Columns.Add(oCol4);
		grid1.Columns.Add(oCol5);

		// add the grid to the controls collection of the PlaceHolder
		phGrid1.Controls.Add(grid1);
	}
    
    public void RowDataBound(object sender, GridRowEventArgs e)
    {
        if (e.Row.RowType == GridRowType.ColumnFooter)
        {
            e.Row.Cells[1].Text = "Selected record total:";
            e.Row.Cells[2].Text = " ";
            e.Row.Cells[3].Text = " ";
            e.Row.Cells[4].Text = " ";
        }
    }
</script>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html>
<head>
    <title>obout ASP.NET Grid examples</title>
    <style type="text/css">
        .tdText
        {
            font: 11px Verdana;
            color: #333333;
        }
        .option2
        {
            font: 11px Verdana;
            color: #0033cc;
            padding-left: 4px;
            padding-right: 4px;
        }
        a
        {
            font: 11px Verdana;
            color: #315686;
            text-decoration: underline;
        }
        a:hover
        {
            color: crimson;
        }
    </style>

    <script type="text/javascript">


        var isIE = (window.navigator.userAgent.indexOf("MSIE") > 0);

        if (!isIE) {
            HTMLElement.prototype.__defineGetter__("innerText",
              function() { return (this.textContent); });
            HTMLElement.prototype.__defineSetter__("innerText",
              function(txt) { this.textContent = txt; });
        }

        function Load() {
            window.setTimeout("FindFooter();", 250);
        }

        var columnFooterContainer = null;
        function FindFooter() {
            if (columnFooterContainer == null) {
                var trElements = document.getElementsByTagName('TR');

                for (var i = 0; i < trElements.length; i++) {
                    if (trElements[i].className == 'ob_gCFR') {
                        columnFooterContainer = trElements[i];
                        break;
                    }
                }
            }
        }
        
        function OnSelect(arrSelectedRecords) {

            var totUnitPrice = 0;
            var totUnitsInStock = 0;
            var totUnitsOnOrder = 0;

            for (var i = 0; i < grid1.SelectedRecords.length; i++) {
                var record = grid1.SelectedRecords[i];

                totUnitPrice += eval(record.UnitPrice);
                totUnitsInStock += eval(record.UnitsInStock);
                totUnitsOnOrder += eval(record.UnitsOnOrder);

            }

            var row = grid1.GridColumnsFooterContainer.firstChild.firstChild.firstChild.firstChild;

            row.childNodes[2].firstChild.firstChild.innerText = totUnitPrice;
            row.childNodes[3].firstChild.firstChild.innerText = totUnitsInStock;
            row.childNodes[4].firstChild.firstChild.innerText = totUnitsOnOrder;
        }
        
        function addLoadEvent(func) {
            var oldonload = window.onload;
            if (typeof window.onload != 'function') {
                window.onload = func;
            } else {
                window.onload = function() {
                    if (oldonload) {
                        oldonload();
                    }
                    func();
                }
            }
        }

        addLoadEvent(function() {
            Load();
        });

        function OnCallback() {
            columnFooterContainer = null;
            FindFooter();
        }	    
		</script>

</head>
<body>
    <form id="Form1" runat="server">
    
    <br />
    
    <span class="tdText"><b>ASP.NET Grid - Calculating totals of selected records</b></span>
    
    <br /><br />
    
    <asp:PlaceHolder ID="phGrid1" runat="server"></asp:PlaceHolder>
    
    <br />
    
    <span class="tdText">
        This sample demonstrates how to show total of selected records from client side.
    </span>
        
    <asp:SqlDataSource runat="server" ID="sds1" SelectCommand="SELECT TOP 25 * FROM Products"
        ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|Northwind.mdb;"
        ProviderName="System.Data.OleDb"></asp:SqlDataSource>
        
    <br /><br /><br />
    
    <a href="Default.aspx?type=CSHARP">« Back to examples</a>
    </form>
</body>
</html>
