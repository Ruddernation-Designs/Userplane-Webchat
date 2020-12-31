<%@ Language=VBScript %>

<%
	Response.ContentType = "text/xml; charset=utf-8"
	Response.Write( "<?xml version='1.0' encoding='utf-8'?>" )
	Response.Write( "<!-- COPYRIGHT Userplane 2004 (http://www.userplane.com) -->" )
	Response.Write( "<!-- CS version 1.9.4 -->" )
	Response.Write( "<communicationsuite>" )

	Response.Write( "<time>" & Date & " " & Time & "</time>" )

	strDomainID = Request.QueryString("domainID")
	strFunction = Request.QueryString("function")
	strCallID = Request.QueryString("callID")

	if strFunction = "" then
		strFunction = Request.QueryString("action")
	end if

	if not strFunction = "" and not strDomainID = "" then

		strSessionGUID = Request.QueryString("sessionGUID")
		strKey = Request.QueryString("key")
		strUserID = Request.QueryString("userID")
		strRoomName = Request.QueryString("roomName")
		strBlockedUserID = Request.QueryString("blockedUserID")
		strFriendUserID = Request.QueryString("friendUserID")

		if Request.QueryString("connected") = "true" or Request.QueryString("connected") = "1" then
			bConnected = true
		else
			bConnected = false
		end if
		if Request.QueryString("admin") = "true" or Request.QueryString("admin") = "1" then
			bAdmin = true
		else
			bAdmin = false
		end if
		if Request.QueryString("exists") = "true" or Request.QueryString("exists") = "1" then
			bExists = true
		else
			bExists = false
		end if
		if Request.QueryString("inRoom") = "true" or Request.QueryString("inRoom") = "1" then
			bInRoom = true
		else
			bInRoom = false
		end if
		if Request.QueryString("blocked") = "true" or Request.QueryString("blocked") = "1" then
			bBlocked = true
		else
			bBlocked = false
		end if
		if Request.QueryString("banned") = "true" or Request.QueryString("banned") = "1" then
			bBanned = true
		else
			bBanned = false
		end if
		if Request.QueryString("friend") = "true" or Request.QueryString("friend") = "1" then
			bFriend = true
		else
			bFriend = false
		end if

		if strFunction = "getDomainPreferences" then

			if Request.QueryString("startup") = "true" or Request.QueryString("startup") = "1" then
				bStartup = true
			else
				bStartup = false
			end if

			Response.Write( "<domain>" )
				Response.Write( "<maxxmlretries>5</maxxmlretries>" )
				Response.Write( "<avenabled>false</avenabled>" )
				Response.Write( "<forbiddenwordslist>crap,shit</forbiddenwordslist>" )
				Response.Write( "<allowCalls>setBannedStatus,setBlockedStatus,setFriendStatus</allowCalls>" )
				Response.Write( "<smileys>" )
					Response.Write( "<smiley>" )
						Response.Write( "<name>Ultra Angry</name>" )
						Response.Write( "<image>http://images.yourCompany.userplane.com/images/smiley/UltraAngry.jpg</image>" )
						Response.Write( "<codes>" )
							Response.Write( "<code><![CDATA[>>:O]]></code>" )
							Response.Write( "<code><![CDATA[>>:-O]]></code>" )
						Response.Write( "</codes>" )
					Response.Write( "</smiley>" )
					Response.Write( "<smiley>" )
						Response.Write( "<name>Angry</name>" )
						Response.Write( "<image>DELETE</image>" )
					Response.Write( "</smiley>" )
				Response.Write( "</smileys>" )
				Response.Write( "<chat>" )
					Response.Write( "<allowModeratedRooms>false</allowModeratedRooms>" )
					Response.Write( "<floodControlResetTime>5</floodControlResetTime>" )
					Response.Write( "<floodControlInterval>5</floodControlInterval>" )
					Response.Write( "<floodControlMaxMessages>5</floodControlMaxMessages>" )
					Response.Write( "<labels>" )
						Response.Write( "<userdata initiallines=""0"">" )
							Response.Write( "<line>Age</line>" )
							Response.Write( "<line>Sex</line>" )
							Response.Write( "<line>Location</line>" )
						Response.Write( "</userdata>" )
						Response.Write( "<lobby><name>Waiting Room</name><description>Lobby Description</description></lobby>" )
					Response.Write( "</labels>" )
					Response.Write( "<maxroomusers>20</maxroomusers>" )
					' Allowing multiple dock items could result in bandwidth overage fees.
					' Please contact a userplane representative for details on overage rates and billing questions.
					' http://www.userplane.com/contact.cfm
					Response.Write( "<maxdockitems>0</maxdockitems>" )
					Response.Write( "<characterlimit>200</characterlimit>" )
					Response.Write( "<userroomcreate>true</userroomcreate>" )
					Response.Write( "<roomemptytimeout>600</roomemptytimeout>" )
					Response.Write( "<maxhistorymessages>20</maxhistorymessages>" )
					Response.Write( "<showJoinLeaveMessages>true</showJoinLeaveMessages>" )
					Response.Write( "<gui>" )
						Response.Write( "<viewprofile>true</viewprofile>" )
						Response.Write( "<instantcommunicator>true</instantcommunicator>" )
						Response.Write( "<addfriend>true</addfriend>" )
						Response.Write( "<block>true</block>" )
						Response.Write( "<titleBarColor></titleBarColor>" )
						Response.Write( "<scrollTrackColor></scrollTrackColor>" )
						Response.Write( "<outerBackgroundColor></outerBackgroundColor>" )
						Response.Write( "<innerBackgroundColor></innerBackgroundColor>" )
						Response.Write( "<uiFontColor></uiFontColor>" )
						Response.Write( "<buttonColor></buttonColor>" )
						Response.Write( "<leftPaneMinimized>false</leftPaneMinimized>" )
						Response.Write( "<dockMinimized>false</dockMinimized>" )
						Response.Write( "<images>" )
							Response.Write( "<watermark>http://images.clearplane.userplane.com/im/images/UserplaneLogo.jpg</watermark>" )
						Response.Write( "</images>" )
						Response.Write( "<initialinputlines>1</initialinputlines>" )
						Response.Write( "<help>false</help>" )
					Response.Write( "</gui>" )
					Response.Write( "<roomlist>" )
						' Make as many as you want, these will always appear when the app reloads (even if deleted in the client)
						Response.Write( "<room><name>Singles</name><description>Singles Description</description></room>" )
						Response.Write( "<room><name>Lazy People</name><description>Lazy People Description</description></room>" )
						Response.Write( "<room><name>Athletic People</name><description>Athletic People Description</description></room>" )
					Response.Write( "</roomlist>" )
					Response.Write( "<getannouncementsinterval>-1</getannouncementsinterval>" )
					Response.Write( "<sendarchive>false</sendarchive>" )
					Response.Write( "<banOptions>" )
						Response.Write( "<message>How long would you like to ban this user?</message>" )
						Response.Write( "<list>" )
							Response.Write( "<option>One Hour</option>" )
							Response.Write( "<option>One Day</option>" )
							Response.Write( "<option>One Week</option>" )
							Response.Write( "<option>One Month</option>" )
							Response.Write( "<option>Forever</option>" )
						Response.Write( "</list>" )
					Response.Write( "</banOptions>" )
					Response.Write( "<banNotification><![CDATA[<b>[[NAME]] was banned</b>]]></banNotification>" )
					Response.Write( "<sendConnectionListInterval>-1</sendConnectionListInterval>" )
					Response.Write( "<conferenceCallEnabled>-1</conferenceCallEnabled>" )
					Response.Write( "<conferenceCallText>Call the party line: </conferenceCallText>" )
				Response.Write( "</chat>" )
			Response.Write( "</domain>" )

		elseif strFunction = "getUser" then

			if not strSessionGUID = "" or not strUserID = "" then
				' we are not always going to be doing authentication, so only look it up if strUserID is null or empty
				if strUserID = "" then
					' Need to look up the userID from strSessionGUID and strKey.  If valid, set the value as so...
					strUserID = "846523"
				end if

				if not strUserID = "" then
					' Need to look up data for the specified userID
					Response.Write( "<user>" )
						Response.Write( "<userid>" & strUserID & "</userid>" )
						Response.Write( "<admin>false</admin>" )
						Response.Write( "<speaker>false</speaker>" )
						Response.Write( "<displayname>Jack Jackson</displayname>" )
						Response.Write( "<avsettings>" )
							Response.Write( "<avenabled>true</avenabled>" )
							Response.Write( "<audioSend>true</audioSend>" )
							Response.Write( "<videoSend>true</videoSend>" )
							Response.Write( "<audioReceive>true</audioReceive>" )
							Response.Write( "<videoRecive>true</videoReceive>" )
							Response.Write( "<audiokbps>16</audiokbps>" ) 		' acceptable values: 10,16,22,44,88
							Response.Write( "<videokbps>100</videokbps>" )		' recommended range: 10 - 200
							Response.Write( "<videofps>15</videofps>" )			' acceptable range: 1 - 30
							Response.Write( "<videosize>1</videosize>" )	' acceptable values: 1, 2, 3
							Response.Write( "<videoDisplaySize>2</videoDisplaySize>" )
						Response.Write( "</avsettings>" )
						Response.Write( "<buddylist>" )
							Response.Write( "<user>" )
								Response.Write( "<userid>22222</userid>" )
								Response.Write( "<displayname>joeschmoe</displayname>" )
								Response.Write( "<images>" )
									Response.Write( "<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>" )
									Response.Write( "<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>" )
								Response.Write( "</images>" )
							Response.Write( "</user>" )
							Response.Write( "<user>" )
								Response.Write( "<userid>33333</userid>" )
								Response.Write( "<displayname>johnjohnson</displayname>" )
								Response.Write( "<images>" )
									Response.Write( "<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>" )
									Response.Write( "<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>" )
								Response.Write( "</images>" )
							Response.Write( "</user>" )
						Response.Write( "</buddylist>" )
						Response.Write( "<blocklist>" )
							Response.Write( "<userid>45</userid>" )
							Response.Write( "<userid>21</userid>" )
						Response.Write( "</blocklist>" )
						Response.Write( "<images>" )
							Response.Write( "<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>" )
							Response.Write( "<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>" )
							Response.Write( "<fullsize>http://images.yourcompany.userplane.com/pathToFullSize.jpg</fullsize>" )
						Response.Write( "</images>" )
						Response.Write( "<chat>" )
							Response.Write( "<userdatavalues>" )
								Response.Write( "<line>Milpitas, CA</line>" )
								Response.Write( "<line>Honda of Milpitas</line>" )
								Response.Write( "<line>2003 CBR F4</line>" )
							Response.Write( "</userdatavalues>" )
							Response.Write( "<gui>" )
								Response.Write( "<viewprofile>true</viewprofile>" )
								Response.Write( "<instantcommunicator>true</instantcommunicator>" )
							Response.Write( "</gui>" )
							Response.Write( "<notextentry>false</notextentry>" )
							Response.Write( "<invisible>false</invisible>" )
							Response.Write( "<userroomcreate>true</userroomcreate>" )
							Response.Write( "<adminrooms>" )
								Response.Write( "<room createOnLogin='true'><name>Joe's Room</name><description>A rooom just for Joe</description></room>" )
								Response.Write( "<room createOnLogin='false'><name>Singles</name><description>Singles Description</description></room>" )
								Response.Write( "<room createOnLogin='false'><name>18-24</name></room>" )
							Response.Write( "</adminrooms>" )
							Response.Write( "<restrictedRooms allowRestricted='false'>" )
								Response.Write( "<room createOnLogin='true' creatorID='4377'><name>Only Site Admins</name><description>Only Site admins can get into this room</description></room>" )
							Response.Write( "</restrictedRooms>" )
							Response.Write( "<initialroom createOnLogin='true'>Lazy People</initialroom>" )
							Response.Write( "<maxdockitems>1</maxdockitems>" )
							Response.Write( "<permitCopy>true</permitCopy>" )
							Response.Write( "<sessionTimeout>-1</sessionTimeout>" )
							Response.Write( "<sessionTimeoutMessage>Your session has expired.</sessionTimeoutMessage>" )
							Response.Write( "<selectedUser>123</selectedUser>" )
							Response.Write( "<inactivityTimeout>2</inactivityTimeout>" )
							Response.Write( "<inactivityTimeoutMessage>You were timed out due to inactivity.</inactivityTimeoutMessage>" )
							Response.Write( "<permitWhisper>true</permitWhisper>" )
						Response.Write( "</chat>" )
						Response.Write( "<userlist>" )
							Response.Write( "<gui>" )
								Response.Write( "<modulelist>miniprofile,onlineusers,buddylist</modulelist>" )
								Response.Write( "<viewprofile>false</viewprofile>" )
								Response.Write( "<instantcommunicator>false</instantcommunicator>" )
								Response.Write( "<addfriend>true</addfriend>" )
								Response.Write( "<search>true</search>" )
							Response.Write( "</gui>" )
							Response.Write( "<buddyviewableonly>false</buddyviewableonly>" )
						Response.Write( "</userlist>" )
					Response.Write( "</user>" )
				else
					' This means we weren't able to find it so they are invalid
					Response.Write( "<user>" )
						Response.Write( "<userid>INVALID</userid>" )
					Response.Write( "</user>" )
				end if
			end if

		elseif strFunction = "onRoomStatusChange" then
			' This function is not on by default, use allowCalls in getDomainPreferences to turn it on
			if not strRoomName = "" and not strUserID = "" then
				' bExists is the true or false boolean that specifies whether the room exists or not
				' bAdmin is also available (see docs)
				if bExists then
				else
				end if
				' Handle this event, no need to return anything else
			end if

		elseif strFunction = "onUserConnectionChange" then
			' This function is not on by default, use allowCalls in getDomainPreferences to turn it on
			if not strUserID = "" then
				' bConnected is the true or false boolean that specifies whether they are online or offline
				if bConnected then
				else
				end if
				' Handle this event, no need to return anything lse
			end if

		elseif strFunction = "onUserRoomChange" then
			' This function is not on by default, use allowCalls in getDomainPreferences to turn it on
			if not strRoomName = "" and not strUserID = "" then
				' bInRoom is the true or false boolean that specifies whether they are in the room
				if bInRoom then
				else
				end if
				' Handle this event, no need to return anything else
			end if

		elseif strFunction = "setBannedStatus" then

			strInfo = Request.QueryString("info")

			if not strUserID = "" then
				' bBanned is true or false whether userID has been banned by an admin
				if bBanned then
					if not strInfo = "" then
						'if you're using a banOptions list (see getDomainPreferences), strInfo will contain the text of the <option> tag (i.e "One Day")
					end if
				else
				end if
				' Handle this event, no need to return anything else
			end if

		elseif strFunction = "setBlockedStatus" then

			if not strUserID = "" and not strBlockedUserID = "" then
				' bBlocked is the true or false boolean that specifies whether they are blocked
				if bBlocked then
				else
				end if
				' Handle this event, no need to return anything else
			end if

		elseif strFunction = "setFriendStatus" then

			if not strUserID = "" and not strFriendUserID = "" then
				' bFriend is a boolean true or false whether strUserID is adding or removing strFriendUserID from friend list
				if bFriend then
				else
				end if
				' Handle this event, no need to return anything else
			end if


		elseif strFunction = "getAnnouncements" then
			' This function is not on by default, use getAnnouncementsInterval in getDomainPreferences to turn it on
			Response.Write( "<announcementList>" )
				Response.Write( "<announcement><![CDATA[<b>Site Notification:</b> There will be limbo in the leto lounge at 0200]]></announcement>" )
				Response.Write( "<announcement><![CDATA[Check out our new <a href='newsPage.html' target='_blank'>news section</a>]]></announcement>" )
			Response.Write( "</announcementList>" )


		elseif strFunction = "sendArchive" then
			' This function is not on by default, use sendArchive in getDomainPreferences to turn it on
			strXmlData = Request.Form("xmlData")
			'The incoming POST xmlData will look like this:
			'<?xml version='1.0' encoding='iso-8859-1'?>
			'<messageArchive>
			'	<room>
			'		<name><![CDATA[asfd]]></name>
			'		<messages>
			'			<entry type="announcement">
			'				<timestamp>1126551016075</timestamp>
			'				<displayName><![CDATA[]]></displayName>
			'			</entry>
			'			<entry type="leave">
			'				<timestamp>1126551110781</timestamp>
			'				<displayName><![CDATA[tom]]></displayName>
			'				<userID invisible="false">1</userID>
			'			</entry>
			'			<entry type="join">
			'				<timestamp>1126551112343</timestamp>
			'				<displayName><![CDATA[tom]]></displayName>
			'				<userID invisible="false">1</userID>
			'			</entry>
			'			<entry type="msg">
			'				<timestamp>1126551127685</timestamp>
			'				<displayName><![CDATA[tom]]></displayName>
			'				<userID invisible="false">1</userID>
			'				<content><![CDATA[this is my message]]></content>
			'			</entry>
			'		</messages>
			'	</room>
			'</messageArchive>

		elseif strFunction = "sendConnectionList" then
			' This function is not on by default, use sendConnectionListInterval in getDomainPreferences to turn it on
			strXmlData = Request.Form("xmlData")
			'The incoming POST xmlData will look like this:
			'<?xml version='1.0' encoding='iso-8859-1'?>
			'<rooms>
			'	<room>
			'		<name><![CDATA[Lobby]]></name>
			'		<users>
			'			<user id="1"/>
			'			<user id="2"/>
			'			<user id="3"/>
			'		</users>
			'	</room>
			'	<room>
			'		<name><![CDATA[My Empty Room]]></name>
			'		<users></users>
			'	</room>
			'</rooms>
		end if

	end if

	Response.Write( "</communicationsuite>" )
%>

