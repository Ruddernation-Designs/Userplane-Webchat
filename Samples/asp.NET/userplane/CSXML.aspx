<%@ Page Language="C#" ValidateRequest="false" ContentType="text/xml; charset=utf-8" %>

<%
	Response.Write( "<?xml version='1.0' encoding='utf-8'?>" );
	Response.Write( "<!-- COPYRIGHT Userplane 2004 (http://www.userplane.com) -->" );
	Response.Write( "<!-- CS version 1.9.4 -->" );
	Response.Write( "<communicationsuite>" );

	Response.Write( "<time>" + new DateTime() + "</time>" );

	String strDomainID = Request.QueryString["domainID"];
	String strFunction = Request.QueryString["function"];
	String strCallID = Request.QueryString["callID"];

	if( strFunction == null )
	{
		strFunction = Request.QueryString["action"];
	}

	if( strFunction != null && strDomainID != null )
	{
		String strSessionGUID = Request.QueryString["sessionGUID"];
		String strKey = Request.QueryString["key"];
		String strUserID = Request.QueryString["userID"];
		String strRoomName = Request.QueryString["roomName"];
		String strBlockedUserID = Request.QueryString["blockedUserID"];
		String strFriendUserID = Request.QueryString["friendUserID"];
		bool bConnected = Request.QueryString["connected"] == "true" || Request.QueryString["connected"] == "1";
		bool bAdmin = Request.QueryString["admin"] == "true" || Request.QueryString["admin"] == "1";
		bool bExists = Request.QueryString["exists"] == "true" || Request.QueryString["exists"] == "1";
		bool bInRoom = Request.QueryString["inRoom"] == "true" || Request.QueryString["inRoom"] == "1";
		bool bBlocked = Request.QueryString["blocked"] == "true" || Request.QueryString["blocked"] == "1";
		bool bBanned = Request.QueryString["banned"] == "true" || Request.QueryString["banned"] == "1";
		bool bFriend = Request.QueryString["friend"] == "true" || Request.QueryString["friend"] == "1";

		switch( strFunction )
		{
			case "getDomainPreferences":
				bool bStartup = Request.QueryString["startup"] == "true" || Request.QueryString["startup"] == "1";

				Response.Write( "<domain>" );
					Response.Write( "<maxxmlretries>5</maxxmlretries>" );
					Response.Write( "<avenabled>false</avenabled>" );
					Response.Write( "<forbiddenwordslist>crap,shit</forbiddenwordslist>" );
					Response.Write( "<allowCalls>setBannedStatus,setBlockedStatus,setFriendStatus</allowCalls>" );
					Response.Write( "<smileys>" );
						Response.Write( "<smiley>" );
							Response.Write( "<name>Ultra Angry</name>" );
							Response.Write( "<image>http://images.yourCompany.userplane.com/images/smiley/UltraAngry.jpg</image>" );
							Response.Write( "<codes>" );
								Response.Write( "<code><![CDATA[>>:O]]></code>" );
								Response.Write( "<code><![CDATA[>>:-O]]></code>" );
							Response.Write( "</codes>" );
						Response.Write( "</smiley>" );
						Response.Write( "<smiley>" );
							Response.Write( "<name>Angry</name>" );
							Response.Write( "<image>DELETE</image>" );
						Response.Write( "</smiley>" );
					Response.Write( "</smileys>" );
					Response.Write( "<chat>" );
						Response.Write( "<allowModeratedRooms>false</allowModeratedRooms>" );
						Response.Write( "<floodControlResetTime>5</floodControlResetTime>" );
						Response.Write( "<floodControlInterval>5</floodControlInterval>" );
						Response.Write( "<floodControlMaxMessages>5</floodControlMaxMessages>" );
						Response.Write( "<labels>" );
							Response.Write( "<userdata initiallines=\"0\">" );
								Response.Write( "<line>Age</line>" );
								Response.Write( "<line>Sex</line>" );
								Response.Write( "<line>Location</line>" );
							Response.Write( "</userdata>" );
							Response.Write( "<lobby><name>Waiting Room</name><description>Lobby Description</description></lobby>" );
						Response.Write( "</labels>" );
						Response.Write( "<maxroomusers>20</maxroomusers>" );
						// Allowing multiple dock items could result in bandwidth overage fees.
						// Please contact a userplane representative for details on overage rates and billing questions.
						// http://www.userplane.com/contact.cfm
						Response.Write( "<maxdockitems>0</maxdockitems>" );
						Response.Write( "<characterlimit>200</characterlimit>" );
						Response.Write( "<userroomcreate>true</userroomcreate>" );
						Response.Write( "<roomemptytimeout>600</roomemptytimeout>" );
						Response.Write( "<maxhistorymessages>20</maxhistorymessages>" );
						Response.Write( "<showJoinLeaveMessages>true</showJoinLeaveMessages>" );
						Response.Write( "<gui>" );
							Response.Write( "<viewprofile>true</viewprofile>" );
							Response.Write( "<instantcommunicator>true</instantcommunicator>" );
							Response.Write( "<addfriend>true</addfriend>" );
							Response.Write( "<block>true</block>" );
							Response.Write( "<titleBarColor></titleBarColor>" );
							Response.Write( "<scrollTrackColor></scrollTrackColor>" );
							Response.Write( "<outerBackgroundColor></outerBackgroundColor>" );
							Response.Write( "<innerBackgroundColor></innerBackgroundColor>" );
							Response.Write( "<uiFontColor></uiFontColor>" );
							Response.Write( "<buttonColor></buttonColor>" );
							Response.Write( "<leftPaneMinimized>false</leftPaneMinimized>" );
							Response.Write( "<dockMinimized>false</dockMinimized>" );
							Response.Write( "<images>" );
								Response.Write( "<watermark>http://images.clearplane.userplane.com/im/images/UserplaneLogo.jpg</watermark>" );
							Response.Write( "</images>" );
							Response.Write( "<initialinputlines>1</initialinputlines>" );
							Response.Write( "<help>true</help>" );
						Response.Write( "</gui>" );
						Response.Write( "<roomlist>" );
							// Make as many as you want, these will always appear when the app reloads (even if deleted in the client)
							Response.Write( "<room><name>Singles</name><description>Singles Description</description></room>" );
							Response.Write( "<room><name>Lazy People</name><description>Lazy People Description</description></room>" );
							Response.Write( "<room><name>Athletic People</name><description>Athletic People Description</description></room>" );
						Response.Write( "</roomlist>" );
						Response.Write( "<getannouncementsinterval>-1</getannouncementsinterval>" );
						Response.Write( "<sendarchive>false</sendarchive>" );
						Response.Write( "<banOptions>" );
							Response.Write( "<message>How long would you like to ban this user?</message>" );
							Response.Write( "<list>" );
								Response.Write( "<option>One Hour</option>" );
								Response.Write( "<option>One Day</option>" );
								Response.Write( "<option>One Week</option>" );
								Response.Write( "<option>One Month</option>" );
								Response.Write( "<option>Forever</option>" );
							Response.Write( "</list>" );
						Response.Write( "</banOptions>" );
						Response.Write( "<banNotification><![CDATA[<b>[[NAME]] was banned</b>]]></banNotification>" );
						Response.Write( "<sendConnectionListInterval>-1</sendConnectionListInterval>" );
						Response.Write( "<conferenceCallEnabled>-1</conferenceCallEnabled>" );
						Response.Write( "<conferenceCallText>Call the party line: </conferenceCallText>" );
					Response.Write( "</chat>" );
				Response.Write( "</domain>" );
				break;

			case "getUser":
				if( strSessionGUID != null || strUserID != null )
				{
					// we are not always going to be doing authentication, so only look it up if strUserID is null or empty
					if( strUserID == null || strUserID.Trim().Length == 0 )
					{
						// Need to look up the userID from strSessionGUID and strKey.  If valid, set the value as so...
						strUserID = "846523";
					}

					if( strUserID != null && strUserID.Trim().Length > 0 )
					{
						// Need to look up data for the specified userID
						Response.Write( "<user>" );
							Response.Write( "<userid>" + strUserID + "</userid>" );
							Response.Write( "<admin>false</admin>" );
							Response.Write( "<speaker>false</speaker>" );
							Response.Write( "<displayname>Jack Jackson</displayname>" );
							Response.Write( "<avsettings>" );
								Response.Write( "<avenabled>true</avenabled>" );
								Response.Write( "<audioSend>true</audioSend>" );
								Response.Write( "<videoSend>true</videoSend>" );
								Response.Write( "<audioReceive>true</audioReceive>" );
								Response.Write( "<videoReceive>true/videoReceive>" );
								Response.Write( "<audiokbps>16</audiokbps>" ); 		// acceptable values: 10,16,22,44,88
								Response.Write( "<videokbps>100</videokbps>" );		// recommended range: 10 - 200
								Response.Write( "<videofps>15</videofps>" );		// acceptable range: 1 - 30
								Response.Write( "<videosize>1</videosize>" );		// acceptable values: 1, 2, 3
								Response.Write( "<videoDisplaySize>2</videoDisplaySize>" );
							Response.Write( "</avsettings>" );
							Response.Write( "<buddylist>" );
								Response.Write( "<user>" );
									Response.Write( "<userid>22222</userid>" );
									Response.Write( "<displayname>joeschmoe</displayname>" );
									Response.Write( "<images>" );
										Response.Write( "<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>" );
										Response.Write( "<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>" );
									Response.Write( "</images>" );
								Response.Write( "</user>" );
								Response.Write( "<user>" );
									Response.Write( "<userid>33333</userid>" );
									Response.Write( "<displayname>johnjohnson</displayname>" );
									Response.Write( "<images>" );
										Response.Write( "<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>" );
										Response.Write( "<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>" );
									Response.Write( "</images>" );
								Response.Write( "</user>" );
							Response.Write( "</buddylist>" );
							Response.Write( "<blocklist>" );
								Response.Write( "<userid>45</userid>" );
								Response.Write( "<userid>21</userid>" );
							Response.Write( "</blocklist>" );
							Response.Write( "<images>" );
								Response.Write( "<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>" );
								Response.Write( "<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>" );
								Response.Write( "<fullsize>http://images.yourcompany.userplane.com/pathToFullSize.jpg</fullsize>" );
							Response.Write( "</images>" );
							Response.Write( "<chat>" );
								Response.Write( "<userdatavalues>" );
									Response.Write( "<line>Milpitas, CA</line>" );
									Response.Write( "<line>Honda of Milpitas</line>" );
									Response.Write( "<line>2003 CBR F4</line>" );
								Response.Write( "</userdatavalues>" );
								Response.Write( "<gui>" );
									Response.Write( "<viewprofile>true</viewprofile>" );
									Response.Write( "<instantcommunicator>true</instantcommunicator>" );
								Response.Write( "</gui>" );
								Response.Write( "<notextentry>false</notextentry>" );
								Response.Write( "<invisible>false</invisible>" );
								Response.Write( "<userroomcreate>true</userroomcreate>" );
								Response.Write( "<adminrooms>" );
									Response.Write( "<room createOnLogin='true'><name>Joe's Room</name><description>A rooom just for Joe</description></room>" );
									Response.Write( "<room createOnLogin='false'><name>Singles</name><description>Singles Description</description></room>" );
									Response.Write( "<room createOnLogin='false'><name>18-24</name></room>" );
								Response.Write( "</adminrooms>" );
								Response.Write( "<restrictedRooms allowRestricted='false'>" );
									Response.Write( "<room createOnLogin='true' creatorID='4377'><name>Only Site Admins</name><description>Only Site admins can get into this room</description></room>" );
								Response.Write( "</restrictedRooms>" );
								Response.Write( "<initialroom createOnLogin='true'>Lazy People</initialroom>" );
								Response.Write( "<maxdockitems>1</maxdockitems>" );
								Response.Write( "<permitCopy>true</permitCopy>" );
								Response.Write( "<sessionTimeout>-1</sessionTimeout>" );
								Response.Write( "<sessionTimeoutMessage>Your session has expired.</sessionTimeoutMessage>" );
								Response.Write( "<selectedUser>123</selectedUser>" );
								Response.Write( "<inactivityTimeout>2</inactivityTimeout>" );
								Response.Write( "<inactivityTimeoutMessage>You were timed out due to inactivity.</inactivityTimeoutMessage>" );
								Response.Write( "<permitWhisper>true</permitWhisper>" );
							Response.Write( "</chat>" );
							Response.Write( "<userlist>" );
								Response.Write( "<gui>" );
									Response.Write( "<modulelist>miniprofile,onlineusers,buddylist</modulelist>" );
									Response.Write( "<viewprofile>false</viewprofile>" );
									Response.Write( "<instantcommunicator>false</instantcommunicator>" );
									Response.Write( "<addfriend>true</addfriend>" );
									Response.Write( "<search>true</search>" );
								Response.Write( "</gui>" );
								Response.Write( "<buddyviewableonly>false</buddyviewableonly>" );
							Response.Write( "</userlist>" );
						Response.Write( "</user>" );
					}
					else
					{
						// This means we weren't able to find it so they are invalid
						Response.Write( "<user>" );
							Response.Write( "<userid>INVALID</userid>" );
						Response.Write( "</user>" );
					}
				}
				break;

			case "onRoomStatusChange":
				// This function is not on by default, use allowCalls in getDomainPreferences to turn it on
				if( strRoomName != null && strUserID != null )
				{
					// bExists is the true or false boolean that specifies whether the room exists or not
					// bAdmin is also available (see docs)
					if( bExists )
					{
					}
					else
					{
					}
					// Handle this event, no need to return anything else
				}
				break;

			case "onUserConnectionChange":
				// This function is not on by default, use allowCalls in getDomainPreferences to turn it on
				if( strUserID != null )
				{
					// bConnected is the true or false boolean that specifies wheter they are online or offline
					if( bConnected )
					{
					}
					else
					{
					}
					// Handle this event, no need to return anything else
				}
				break;

			case "onUserRoomChange":
				// This function is not on by default, use allowCalls in getDomainPreferences to turn it on
				if( strRoomName != null && strUserID != null )
				{
					// bInRoom is the true or false boolean that specifies whether they are in the room
					if( bInRoom )
					{
					}
					else
					{
					}
					// Handle this event, no need to return anything else
				}
				break;

			case "setBannedStatus":
				String strInfo = Request.QueryString["info"];

				if( strUserID != null )
				{
					// bBanned is true or false whether userID has been banned by an admin
					if( bBanned )
					{
						if( strInfo != null && strInfo != "" )
						{
							//if you're using a banOptions list (see getDomainPreferences), strInfo will contain the text of the <option> tag (i.e "One Day")
						}
					}
					else
					{
					}
					// Handle this event, no need to return anything else
				}
				break;

			case "setBlockedStatus":
				if( strUserID != null && strBlockedUserID != null )
				{
					// bBlocked is the true or false boolean that specifies whether they are blocked
					if( bBlocked )
					{
					}
					else
					{
					}
					// Handle this event, no need to return anything else
				}
				break;

			case "setFriendStatus":
				if( strUserID != null && strFriendUserID != null )
				{
					// bFriend is a boolean true or false whether strUserID is adding or removing strFriendUserID from friend list
					if( bFriend )
					{
					}
					else
					{
					}
					// Handle this event, no need to return anything else
				}
				break;

			case "getAnnouncements":
				// This function is not on by default, use getAnnouncementsInterval in getDomainPreferences to turn it on
				Response.Write( "<announcementList>" );
					Response.Write( "<announcement><![CDATA[<b>Site Notification:</b> There will be limbo in the leto lounge at 0200]]></announcement>" );
					Response.Write( "<announcement><![CDATA[Check out our new <a href='newsPage.html' target='_blank'>news section</a>]]></announcement>" );
				Response.Write( "</announcementList>" );
				break;

			case "sendArchive":
				// This function is not on by default, use sendArchive in getDomainPreferences to turn it on
				String strXmlData = Request.Form["xmlData"];
				/* The incoming POST xmlData will look like this:
				<?xml version='1.0' encoding='iso-8859-1'?>
				<messageArchive>
					<room>
						<name><![CDATA[asfd]]></name>
						<messages>
							<entry type="announcement">
								<timestamp>1126551016075</timestamp>
								<displayName><![CDATA[]]></displayName>
							</entry>
							<entry type="leave">
								<timestamp>1126551110781</timestamp>
								<displayName><![CDATA[tom]]></displayName>
								<userID invisible="false">1</userID>
							</entry>
							<entry type="join">
								<timestamp>1126551112343</timestamp>
								<displayName><![CDATA[tom]]></displayName>
								<userID invisible="false">1</userID>
							</entry>
							<entry type="msg">
								<timestamp>1126551127685</timestamp>
								<displayName><![CDATA[tom]]></displayName>
								<userID invisible="false">1</userID>
								<content><![CDATA[this is my message]]></content>
							</entry>
						</messages>
					</room>
				</messageArchive>
				*/
				break;

			case "sendConnectionList":
				// This function is not on by default, use sendConnectionListInterval in getDomainPreferences to turn it on
				String strXmlData = Request.Form["xmlData"];
				/* The incoming POST xmlData will look like this:
				<?xml version='1.0' encoding='iso-8859-1'?>
				<rooms>
					<room>
						<name><![CDATA[Lobby]]></name>
						<users>
							<user id="1"/>
							<user id="2"/>
							<user id="3"/>
						</users>
					</room>
					<room>
						<name><![CDATA[My Empty Room]]></name>
						<users></users>
					</room>
				</rooms>
				*/
				break;

			default:
				break;
		}
	}

	Response.Writ( "</communicationsuite>" );
%>


