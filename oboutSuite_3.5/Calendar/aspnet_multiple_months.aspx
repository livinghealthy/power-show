<%@ Page Language="C#" %>
<%@ Register TagPrefix="obout" Namespace="OboutInc.Calendar2" Assembly="obout_Calendar2_NET" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
	<head>
		<title>obout ASP.NET Calendar examples</title>

	    <style type="text/css">
			
			.tdText {
                font:11px Verdana;
                color:#333333;
            }
			body {
				font:11px Verdana;
				color:#333333;
			}
			a {
				font:11px Verdana;
				color:#315686;
				text-decoration:underline;
			}
			a:hover {
				color:crimson;
			}
		</style>
	</head>
	<body>
	    <form id="Form1" runat="server">
	        <span class="tdText"><b>ASP.NET Calendar - Multiple months</b></span>
		    <br /><br />	
			<br /><br />  
		
		    <obout:Calendar runat="server" Rows="2" Columns="2" />
    		
		    <br />
    		
		    See also <a href="http://www.obout.com/calendar/tutorial_scrolling.aspx">months scrolling tutorial</a>
    		
		    <br /><br /><br />
        	    
	        <a style="font-size:10pt;font-family:Tahoma" href="Default.aspx?type=ASPNET">� Back to examples</a>
	        
	    </form>
	</body>
</html>