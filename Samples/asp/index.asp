<!-- This page is an example of a the chat page on your site.  See below for more information -->

<html>
<head>
	<title>Example Webchat Page</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	
	<script language="javascript">
	<!--
		function up_launchChat()
		{
			window.open( "userplane/wc.asp", "UserplaneChatWindow", "width=500,height=400,toolbar=0,directories=0,menubar=0,status=0,location=0,scrollbars=0,resizable=1" );
		}
	//-->
	</script>
</head>

<body>
	<h3>Userplane Webchat:</h3>

	Either pop it up from your nav: <a href="" onClick="javascript: up_launchChat(); return false;">Launch Webchat</a><br>
	
	Or embed it on a chat page:<br>
	<!--#include virtual="userplane/wc.asp"-->

</body>
</html>
