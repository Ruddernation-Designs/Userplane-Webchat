<!---
	You need to set these variables to be appropriate for your site and user.

	VARIABLES.strFlashcomServer			The flashcom server: flashcom.yourcompany.userplane.com
	VARIABLES.strDomainID				The domain ID of this site: yourdomain.com
	VARIABLES.strSessionGUID			The session identifier for the currently logged in user
	VARIABLES.strKey					Additional login information you may need passed
	VARIABLES.strInitialRoom			Optional room name of the room the user will start in.  This overrides the similar setting in the XML
--->

<cfset VARIABLES.strFlashcomServer = "flashcom.yourcompany.userplane.com">
<cfset VARIABLES.strDomainID = "yourdomain.com">
<cfset VARIABLES.strSessionGUID = "aaaaa">
<cfset VARIABLES.strKey = "">
<cfset VARIABLES.strInitialRoom = "">

<html>
<head>
	<meta http-equiv=Content-Type content="text/html;  charset=ISO-8859-1">
	<title>Userplane AV Webchat</title>

	<script language="JavaScript">
	<!--
		function csEvent( strEvent, strParameter1, strParameter2 )
		{
			if( strEvent == "InstantCommunicator.StartConversation" )
			{
				var strUserID = strParameter1;
				var bServer = strParameter2;
				// open up an InstantCommunicator window.  For example:
				launchWM( "<cfoutput>#VARIABLES.strSessionGUID#</cfoutput>", strUserID );
			}
			else if( strEvent == "User.ViewProfile" )
			{
				var strUserID = strParameter1;
			}
			else if( strEvent == "User.Block" )
			{
				var strBlockedUserID = strParameter1;
				var bBlocked = strParameter2;
			}
			else if( strEvent == "User.AddFriend" )
			{
				var strFriendUserID = strParameter1;
				var bFriend = strParameter2;
			}
			else if( strEvent == "Chat.Help" )
			{
			}
			else if( strEvent == "User.NoTextEntry" )
			{
			}
			else if( strEvent == "Connection.Success" )
			{
			}
			else if( strEvent == "Connection.Failure" )
			{
				if( strParameter1 == "Session.Timeout" )
				{
					//handle timeout here, both inactivity and session timeouts
				}
				if( strParameter1 == "User.Banned" )
				{
					//handle ban event here
				}
			}
		}
		function launchWM( userID, destinationUserID )
		{
			var popupWindowTest = window.open( "wm.cfm?strDestinationUserID=" + destinationUserID, "WMWindow_" + replaceAlpha(userID) + "_" + replaceAlpha(destinationUserID), "width=360,height=397,toolbar=0,directories=0,menubar=0,status=0,location=0,scrollbars=0,resizable=1" );
			if( popupWindowTest == null )
			{
				alert( "Your popup blocker stopped an IM window from opening" );
			}
		}

		function replaceAlpha( strIn )
		{
			var strOut = "";
			for( var i = 0 ; i < strIn.length ; i++ )
			{
				var cChar = strIn.charAt(i);
				if( ( cChar >= 'A' && cChar <= 'Z' )
					|| ( cChar >= 'a' && cChar <= 'z' )
					|| ( cChar >= '0' && cChar <= '9' ) )
				{
					strOut += cChar;
				}
				else
				{
					strOut += "_";
				}
			}

			return strOut;
		}
	//-->
	</script>
</head>
<body bgcolor="#ffffff" bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0">





<!--- Do not change anything below here --->
<cfset VARIABLES.strSwfServer = "swf.userplane.com">
<cfset VARIABLES.strApplicationName = "CommunicationSuite">
<cfset VARIABLES.strLocale = "english">

<cfoutput>
	<script type="text/javascript" src="flashobject.js"></script>

	<!---
		The content of this div should hold whatever HTML you would like to show in the case that the
		user does not have Flash installed.  Its contents get replaced with the Flash movie for everyone
		else.
	--->
	<div id="flashcontent">
		<strong>You need to upgrade your Flash Player by clicking <a href="http://www.macromedia.com/go/getflash/" target="_blank">this link</a>.</strong><br><br><strong>If you see this and have already upgraded we suggest you follow <a href="http://www.adobe.com/cfusion/knowledgebase/index.cfm?id=tn_14157" target="_blank">this link</a> to uninstall Flash and reinstall again.</strong>
	</div>

	<script type="text/javascript">
		// <![CDATA[

		var fo = new FlashObject("http://#VARIABLES.strSwfServer#/#VARIABLES.strApplicationName#/ch.swf", "ch", "100%", "100%", "6", "##ffffff", false, "best");
		fo.addParam("scale", "noscale");
		fo.addParam("menu", "false");
		fo.addParam("salign", "LT");
		fo.addVariable("strServer", "#VARIABLES.strFlashcomServer#");
		fo.addVariable("strSwfServer", "#VARIABLES.strSwfServer#");
		fo.addVariable("strApplicationName", "#VARIABLES.strApplicationName#");
		fo.addVariable("strDomainID", "#VARIABLES.strDomainID#");
		fo.addVariable("strSessionGUID", "#VARIABLES.strSessionGUID#");
		fo.addVariable("strKey", "#VARIABLES.strKey#");
		fo.addVariable("strLocale", "#VARIABLES.strLocale#");
		fo.addVariable("strInitialRoom", "#VARIABLES.strInitialRoom#");
		fo.write("flashcontent");

		// COPYRIGHT Userplane 2006 (http://www.userplane.com)
		// CS version 1.9.4

		// ]]>
	</script>
</cfoutput>

</body>
</html>
