<cfcontent type="text/xml; charset=utf-8"><?xml version='1.0' encoding='utf-8'?>
<!-- COPYRIGHT Userplane 2004 (http://www.userplane.com) -->
<!-- CS version 1.9.4 -->
<communicationsuite>
	<time><cfoutput>#now()#</cfoutput></time>

	<cfparam name="URL.action" default="">
	<cfparam name="URL.function" default="#URL.action#">
	<cfparam name="URL.domainID" default="">
	<cfparam name="URL.callID" default="">

	<cfswitch expression="#URL.function#">

		<cfcase value="getDomainPreferences">
			<cfparam name="URL.startup" default="">

			<domain>
				<maxxmlretries>5</maxxmlretries>
				<avenabled>true</avenabled>
				<forbiddenwordslist>crap,shit</forbiddenwordslist>
				<allowCalls>setBannedStatus,setBlockedStatus,setFriendStatus</allowCalls>
				<smileys>
					<smiley>
						<name>Ultra Angry</name>
						<image>http://images.yourCompany.userplane.com/images/smiley/UltraAngry.jpg</image>
						<codes>
							<code><![CDATA[>>:O]]></code>
							<code><![CDATA[>>:-O]]></code>
						</codes>
					</smiley>
					<smiley>
						<name>Angry</name>
						<image>DELETE</image>
					</smiley>
				</smileys>
				<chat>
					<allowModeratedRooms>false</allowModeratedRooms>
					<floodControlResetTime>5</floodControlResetTime>
					<floodControlInterval>5</floodControlInterval>
					<floodControlMaxMessages>5</floodControlMaxMessages>
					<labels>
						<userdata initiallines="0">
							<line>Age</line>
							<line>Sex</line>
							<line>Location</line>
						</userdata>
						<lobby><name>Waiting Room</name><description>Lobby Description</description></lobby>
					</labels>
					<maxroomusers>20</maxroomusers>
					<!--- Allowing multiple dock items could result in bandwidth overage fees.--->
					<!--- Please contact a userplane representative for details on overage rates and billing questions.--->
					<!--- http://www.userplane.com/contact.cfm--->
					<maxdockitems>0</maxdockitems>
					<characterlimit>200</characterlimit>
					<userroomcreate>true</userroomcreate>
					<roomemptytimeout>600</roomemptytimeout>
					<maxhistorymessages>20</maxhistorymessages>
					<showJoinLeaveMessages>true</showJoinLeaveMessages>
					<gui>
						<viewprofile>true</viewprofile>
						<instantcommunicator>true</instantcommunicator>
						<addfriend>true</addfriend>
						<block>true</block>
						<titleBarColor></titleBarColor>
						<scrollTrackColor></scrollTrackColor>
						<outerBackgroundColor></outerBackgroundColor>
						<innerBackgroundColor></innerBackgroundColor>
						<uiFontColor></uiFontColor>
						<buttonColor></buttonColor>
						<leftPaneMinimized>false</leftPaneMinimized>
						<dockMinimized>false</dockMinimized>
						<images>
							<watermark>http://images.clearplane.userplane.com/im/images/UserplaneLogo.jpg</watermark>
						</images>
						<initialinputlines>1</initialinputlines>
						<help>true</help>
					</gui>
					<roomlist>
						<!--- Make as many as you want, these will always appear when the app reloads (even if deleted in the client) --->
						<room><name>Singles</name><description>Singles Description</description></room>
						<room><name>Lazy People</name><description>Lazy People Description</description></room>
						<room><name>Athletic People</name><description>Athletic People Description</description></room>
					</roomlist>
					<getannouncementsinterval>-1</getannouncementsinterval>
					<sendarchive>false</sendarchive>
					<banOptions>
						<message>How long would you like to ban this user?</message>
						<list>
							<option>One Hour</option>
							<option>One Day</option>
							<option>One Week</option>
							<option>One Month</option>
							<option>Forever</option>
						</list>
					</banOptions>
					<banNotification><![CDATA[<b>[[NAME]] was banned</b>]]></banNotification>
					<sendConnectionListInterval>-1</sendConnectionListInterval>
					<conferenceCallEnabled>-1</conferenceCallEnabled>
					<conferenceCallText>Call the party line: </conferenceCallText>
				</chat>
			</domain>
		</cfcase>

		<cfcase value="getUser">
			<cfparam name="URL.sessionGUID" default="">
			<cfparam name="URL.key" default="">
			<cfparam name="URL.userID" default="">

			<!--- we are not always going to be doing authentication, so only look it up if URL.userID is blank --->
			<cfif len(trim( URL.userID )) EQ 0 AND len(trim( URL.sessionGUID )) NEQ 0>
				<!--- Need to look up the userID from strSessionGUID and strKey.  If valid, set the value as so... --->
				<cfset URL.userID = "639742">
			</cfif>

			<cfif len(trim( URL.userID )) NEQ 0>
				<!--- Need to look up data for the specified userID --->
				<cfoutput>
					<user>
						<userid>#URL.userID#</userid>
						<admin>false</admin>
						<speaker>false</speaker>
						<displayname>My User Name</displayname>
						<avsettings>
							<avEnabled>true</avEnabled>
							<audioSend>true</audioSend>
							<videoSend>true</videoSend>
							<audioReceive>true</audioReceive>
							<videoReceive>true</videoReceive>
							<audiokbps>16</audiokbps> 	<!--- acceptable values: 10,16,22,44,88 --->
							<videokbps>100</videokbps>	<!--- recommended range: 10 - 200 --->
							<videofps>15</videofps>		<!--- acceptable range: 1 - 30 --->
							<videosize>1</videosize>		<!--- acceptable values: 1, 2, 3  --->
							<videoDisplaySize>2</videoDisplaySize>
						</avsettings>
						<buddylist>
							<user>
								<userid>22222</userid>
								<displayname>joeschmoe</displayname>
								<images>
									<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>
									<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>
								</images>
							</user>
							<user>
								<userid>33333</userid>
								<displayname>johnjohnson</displayname>
								<images>
									<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>
									<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>
								</images>
							</user>
						</buddylist>
						<blocklist>
							<userid>77777</userid>
						</blocklist>
						<images>
							<icon>http://images.yourcompany.userplane.com/pathToIcon.jpg</icon>
							<thumbnail>http://images.yourcompany.userplane.com/pathToThumbnail.jpg</thumbnail>
							<fullsize>http://images.yourcompany.userplane.com/pathToFullSize.jpg</fullsize>
						</images>
						<chat>
							<userdatavalues>
								<line>Milpitas, CA</line>
								<line>Honda of Milpitas</line>
								<line>2003 CBR F4</line>
							</userdatavalues>
							<gui>
								<viewprofile>true</viewprofile>
								<instantcommunicator>true</instantcommunicator>
							</gui>
							<notextentry>false</notextentry>
							<invisible>false</invisible>
							<userroomcreate>true</userroomcreate>
							<adminrooms>
								<room createOnLogin="true"><name>Joe's Room</name><description>A rooom just for Joe</description></room>
								<room createOnLogin="false"><name>Singles</name><description>Singles Description</description></room>
								<room createOnLogin="false"><name>18-24</name></room>
							</adminrooms>
							<restrictedRooms allowRestricted="false">
								<room createOnLogin="true" creatorID="4377"><name>Only Site Admins</name><description>Only Site admins can get into this room</description></room>
							</restrictedRooms>
							<initialroom createOnLogin="true">Lazy People</initialroom>
							<maxdockitems>1</maxdockitems>
							<permitCopy>true</permitCopy>
							<sessionTimeout>-1</sessionTimeout>
							<sessionTimeoutMessage>Your session has expired.</sessionTimeoutMessage>
							<selecteduser>123</selecteduser>
							<inactivityTimeout>2</inactivityTimeout>
    						<inactivityTimeoutMessage>You were timed out due to inactivity.</inactivityTimeoutMessage>
  							<permitWhisper>true</permitWhisper>
						</chat>
						<userlist>
							<gui>
								<modulelist>miniprofile,onlineusers,buddylist</modulelist>
								<viewprofile>false</viewprofile>
								<instantcommunicator>false</instantcommunicator>
								<addfriend>true</addfriend>
								<search>true</search>
							</gui>
							<buddyviewableonly>false</buddyviewableonly>
						</userlist>
					</user>
				</cfoutput>
			<cfelse>
				<!--- This means we weren't able to find it so they are invalid --->
				<user>
					<userid>INVALID</userid>
				</user>
			</cfif>
		</cfcase>

		<cfcase value="onRoomStatusChange">
			<!--- This function is not on by default, use allowCalls in getDomainPreferences to turn it on --->
			<cfparam name="URL.roomName" default="">
			<cfparam name="URL.ownerID" default="">
			<cfparam name="URL.admin" default=""> <!--- boolean true or false whether room was created by admin --->
			<cfparam name="URL.exists" default=""> <!--- boolean true or false whether room exists or not --->

			<!--- Handle this event, no need to return anything else --->

		</cfcase>

		<cfcase value="onUserConnectionChange">
			<!--- This function is not on by default, use allowCalls in getDomainPreferences to turn it on --->
			<cfparam name="URL.userID" default="">
			<cfparam name="URL.connected" default=""> <!--- boolean true or false whether user is connected --->

			<!--- Handle this event, no need to return anything else --->

		</cfcase>

		<cfcase value="onUserRoomChange">
			<!--- This function is not on by default, use allowCalls in getDomainPreference to turn it on --->
			<cfparam name="URL.roomName" default="">
			<cfparam name="URL.userID" default="">
			<cfparam name="URL.inRoom" default=""> <!--- boolean true or false whether user is in room --->

			<!--- Handle this event, no need to return anything else --->

		</cfcase>

		<cfcase value="setBannedStatus">
			<cfparam name="URL.userID" default="">
			<cfparam name="URL.banned" default=""> <!--- boolean true or false whether userID has been banned by an admin --->
			<cfparam name="URL.info" default=""> <!--- if you're using a banOptions list (see getDomainPreferences), the info parameter will contain the text of the <option> tag (i.e "One Day") --->
			<!--- Handle this event, no need to return anything else --->

		</cfcase>

		<cfcase value="setBlockedStatus">
			<cfparam name="URL.userID" default="">
			<cfparam name="URL.blockedUserID" default="">
			<cfparam name="URL.blocked" default=""> <!--- boolean true or false whether userID has blockedUserID blocked --->

			<!--- Handle this event, no need to return anything else --->

		</cfcase>

		<cfcase value="setFriendStatus">
			<cfparam name="URL.userID" default="">
			<cfparam name="URL.friendUserID" default="">
			<cfparam name="URL.friend" default=""> <!--- boolean true or false whether userID is adding or removing friendUserID from friend list --->

			<!--- Handle this event, no need to return anything else --->

		</cfcase>

		<cfcase value="getAnnouncements">
			<!--- This function is not on by default, use getAnnouncementsInterval in getDomainPreferences to turn it on --->
			<announcementList>
				<announcement><![CDATA[<b>Site Notification:</b> There will be limbo in the leto lounge at 0200]]></announcement>
				<announcement><![CDATA[Check out our new <a href="newsPage.html" target="_blank">news section</a>]]></announcement>
			</announcementList>
		</cfcase>

		<cfcase value="sendArchive">
			<!--- This function is not on by default, use sendArchive in getDomainPreferences to turn it on --->
			<cfparam name="FORM.xmlData" default="">
			<!--- the incoming POST xmlData will look like this: --->
			<!---
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
			--->
		</cfcase>

		<cfcase value="sendConnectionList">
			<!--- This function is not on by default, use sendConnectionListInterval in getDomainPreferences to turn it on --->
			<cfparam name="FORM.xmlData" default="">
			<!--- the incoming POST xmlData will look like this: --->
			<!---
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
			--->
		</cfcase>

	</cfswitch>

</communicationsuite>


