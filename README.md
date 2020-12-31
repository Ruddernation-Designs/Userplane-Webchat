# Userplane-Webchat
This is the old Userplane messenger that is for use on your web server, This includes the advertisement files for advertising on Userplane at the the time.

Userplane Webchat XML Interface
Version 1.9.4



 Overview

The Userplane CommunicationSuite is a distributed system with multiple components, some hosted and controlled by Userplane, some hosted and controlled by you.  Here is a brief overview of the system:

	 HTML :  The HTML is hosted by you and will need to be implemented using some sort of programming language like ASP.NET, ColdFusion, PHP, or Perl.  Userplane will provide examples of this HTML for you to get started with and in the case of some programming languages, will also provide some include files.  When the HTML wants to display a component of the Webchat, it loads the Flash SWF from a Userplane server.
	 Flash SWF :  There are multiple SWF files in the CommunicationSuite.  Each has a purpose.  Most of them are the user interface presented to the end user and some are hidden.  These files do all the communication with the Flash Communication Server.
	 Flash Communication Se rver:  This component is a combination of Macromedia’s technology and custom server-side scripting written by Userplane.  It is responsible for all interaction between users and between the user and your database.
	 XML :  When the Flash Communication Server needs to retrieve information from or send information to your app server, it does this through XML.  XML is a standard way to share data between 2 locations and/or languages.  It is accessed just like HTML and looks remarkably like HTML in all aspects.  Because of that, you will be able to create this interface just like you would create a dynamic HTML page, using whatever backend technology you like.  Userplane will provide you the XML schema to use for interacting with our backend.
	 App Server / Database:  The XML will communicate with your backend to insert, update, select, and handle the data in whatever manner you see fit.
