<?php
	/* 
	 *	You need to set these variables to be appropriate for your site and user.
	 */
	$strFlashcomServer = "flashcom.yourcompany.userplane.com";
	$strDomainID = "yourdomain.com";
	$strSessionGUID = "aaaaa";			// The session identifier for the currently logged in user
	$strKey = "";						// Additional login information you may need passed
	$strEvent = "";						// The event to send to the Flash Communication Server (see CSHTML.rtf)
	$strParameter = "";					// Any additional data the message needs to pass (see CSHTML.rtf)



	// Only set these if using with Webmessenger (see WMHTML.rtf)
	$strMemberID = "";					// The memberID of the currently logged in user
	$strDestinationMemberID = "";		// The memberID of the user that is on the other end of the Webmessenger
	
	
	
	
	
	
	
	// Do not change anything below here
	$strSwfServer = "swf.userplane.com";
	$strApplicationName = "CommunicationSuite";
	$strLocale = "english";
?>

<html>
<head>
	<title>CMD Frame</title>
</head>

<body bottommargin="0" leftmargin="0" marginheight="0" marginwidth="0" rightmargin="0" topmargin="0">

<script type="text/javascript" src="flashobject.js"></script>

<?php
//	The content of this div should hold whatever HTML you would like to show in the case that the 
//	user does not have Flash installed.  Its contents get replaced with the Flash movie for everyone
//	else.
?>
<div id="flashcontent">
	<strong><a href="http://www.macromedia.com/go/getflash/" target="_blank">You need to upgrade your Flash Player by clicking this link</a></strong>
</div>

<script type="text/javascript">
	// <![CDATA[
	
	var fo = new FlashObject("http://<?php echo( $strSwfServer ); ?>/CommunicationSuite/cmd.swf", "cmd", "1", "1", "6", "#ffffff", false, "best");
	fo.addParam("scale", "noscale");
	fo.addParam("menu", "false");
	fo.addParam("salign", "LT");
	fo.addVariable("strServer", "<?php echo( $strFlashcomServer ); ?>");
	fo.addVariable("strSwfServer", "<?php echo( $strSwfServer ); ?>");
	fo.addVariable("strApplicationName", "<?php echo( $strApplicationName ); ?>");
	fo.addVariable("strDomainID", "<?php echo( $strDomainID ); ?>");
	fo.addVariable("strSessionGUID", "<?php echo( $strSessionGUID ); ?>");
	fo.addVariable("strKey", "<?php echo( $strKey ); ?>");
	fo.addVariable("strLocale", "<?php echo( $strLocale ); ?>");
	fo.addVariable("strEvent", "<?php echo( $strEvent ); ?>");
	fo.addVariable("strParameter", "<?php echo( $strParameter ); ?>");
	fo.addVariable("strMemberID", "<?php echo( $strMemberID ); ?>");
	fo.addVariable("strDestinationMemberID", "<?php echo( $strDestinationMemberID ); ?>");
	fo.write("flashcontent");
	
	// COPYRIGHT Userplane 2006 (http://www.userplane.com)
	// CS version 1.9.4
	
	// ]]>
</script>

</body>
</html>
