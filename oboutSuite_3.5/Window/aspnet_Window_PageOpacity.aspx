<%@ Page Language="C#" %>
<%@ Register TagPrefix="owd" Namespace="OboutInc.Window" Assembly="obout_Window_NET"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Window PageOpacity</title>

<script runat="server">
    void Page_Load(object o, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            myWindow.PageOpacity = Convert.ToInt32(txtPageOpacity.Text);
        }
        else
        {
            txtPageOpacity.Text = "25";
        }
    }
</script>
</head>
<body style="font-family:Tahoma;font-size:10pt;">
            <a href="Default.aspx?div=aspnet">� Back to examples</a>
	        <br /><br /><br /><br />
        <br />
        
        <form id="Form1" runat="Server">
        
        <asp:TextBox runat="server" ID="txtPageOpacity" />
        <asp:Button runat="server" ID="btnSetPageOpacity" Text="Change Page Opacity" />
        
        <br /><br />
        
        
            <input type="Button" value="Open" onclick="myWindow.Open()" />
       
        <br />
        <!--Create Hello World Dialog -->
        <owd:Window ID="myWindow" runat="server" IsModal="true" ShowCloseButton="true" Status="Hello" Left="200" Top="100" Height="240"  Width="320" VisibleOnLoad="true" StyleFolder="wdstyles/blue" Title="Obout Window">

        </owd:Window>
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        <br /><br /><br /><br /><br /><br />
        </form>
</body>
</html>
