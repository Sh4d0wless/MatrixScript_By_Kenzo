
 AntiSpam Bot By hanzla for HanzlaScript MX
 -----------------------------------------------------------
 AntiSpam Bot is used to detect spam in your channels and kick and ban the user 
 reponsible. This is useful because advertisers are getting clever with their tactics.
 This script will deal with invites, website adverts, DCC sends, backdoor attempts
 and autogreets. 

 
 Installing
 ----------
 To install the script you must unzip the antispam.zip file (which you have already 
 done), then you must load the antispam.mrc file in mIRC. 

 To load the file you can either use the /load command by typing the following in
 mIRC. You must change 'directory' to the directory that it has been saved to.
when u unzip the zip file there is a folder copy and past in HanzlaScript MX Folder
and type in status window
  
   /load -rs antispam/antispam.mrc

 Once you have completed the install you should have a message in your status window
 confirmin gthat you have loaded the script. 

 Using
 -----
 Once you have installed the script you may choose to change the settings, you can
 do this by selecting it from the menu bar in mIRC or the channel menu bar. You should
 see a new AntiSpam Bot menu, under this menu you can choose "Connect to..." or 
 "Settings", you do not need to edit the settings for it to connect but you may choose
 to edit them if you wish. 
 
 Once connected you can make the bot protect any channels you need by right clicking
 on the channel window then clicking "Add/join this channel". The bot will now join the
 channel and monitor spam, you may control what things users will be kicked from the 
 settings.


 Settings
 --------
 You can customise the settings of AntiSpam Bot by using the settings dialog. The settings
 come under several tabs:

  General
  -------
  Relay to    - Any messages recieved by the bot will be relayed to the channel you
                specify here, as default everything is relayed to #AntiSpamBot. If u dont
	want to send message #AntiSpamBot uncheck the box

  Cycle time  - The cycle time controls how often the bot will leave and part every
                channel, the purpose of this is to check for spammers or virus sends
                that are sent when the user joins the channel. You can choose to
                exclude channels from cycles in the channel options.

  Identify    - If you enable this and enter a password in the box provided the bot will
                identify to NickServ with this password.
 
  Reconnect   - If this option is chosen once the bot becomes disconnected it will 
                attempt to reconnect every 15 seconds.

  Mode -i     - If you choose this option the bot will try to set mode -i on itself on
                connect allowing users to see it in /who lists. The purpose of this is 
                to detect spammers that rely on users in the /who list to spam.

  
  Personalize
  -----------
  This section allows you to personalize the bot.

  Nickname    - This is the name the bot will try to connect to IRC with, you can use
                ? marks to represent random letters and # marks to represent random
                numbers.

  Randomize   - The randomize on cycle option will force the bot to change it's nickname
                when cycling. Note: To make this work you MUST have used ? or # characters
                in the nickname field.
  
  Hold        - This will make the bot try to hold it's nickname and change back to it
                when it becomes available.

  Full name   - The text in this field is what appears on the whois information for the
                bot.

  Identd      - This is what appears before the address of the bot in it's whois 
                information. ? marks to represent random letters and # marks to represent
                random numbers. In this version an IDENTD server is coded solving the 
                problem of bots being unable to connect if the network needs identd 
                enabled.
 
  Channels
  --------
  In this section you can setup which channels the bot will join, in this version you 
  can setup the settings for each channel individually.

  Add         - Use this button to add channels to the bots protection list.
 
  Remove      - Select a channel and click remove and the bot will stop joining and 
                protecting that channel.
 
  Settings    - Select a channel and click settings and you will be able to edit the 
                settings for the channel.
                 
                This is the instructions for setting up the channel options:
 
                General
                -------
                These are a few settings to control how the bot acts in the channel.
 
                Stay in this channel:
                -
                This should normally be checked and you need it if you want the bot
                to join the channel, however if it isn't checked and cycle is enabled
                the bot will join and part the channel every cycle.

                Cycle this channel:
                -
                This option will make the bot cycle the channel when the bot tries to
                cycle all channels, you need this enabled to check for virus senders
                and spammers that send messages to users as they join.
                      
                Filter kick when banning
                -
                With this enabled you will kick anyone from the address that you are 
                banning ensuring that cloned spammers are kicked and spammers that use
                clients outside the channel to spam are also kicked. A *!*@host.domain
                ban is recommended for this option.

                Ban spammers if they were recently on the channel
                -
                This option will on reciept of an invite, virus send etc. will check
                to see if they were on the channel within the last 5 minutes. If they
                were then they will be banned. This is useful to deal with inviters 
                such as xGuest.

                Exclude opped/voiced users
                -
                This is self explantory, you can choose to exclude users from being
                kicked by selecting these options.


                Protection
                ----------
                This is self explanatory, users in the channel you are changing the  
                settings for will be kicked for what you decide.
 
                
                Settings
                --------
                Ban mask type
                -
                Change this to the type of ban mask you need for the channel, ban 
                mask type 2 (*!*@host.domain) is recommended because it is hard to
                evade and also allows full use of the filter kick and ban recent users
                feature.
 
                Ban time
                -
                Here you can select the number of minutes a user is banned from the channel
                for.

  Messages
  --------
  Now you don't have to rip my script! :) You can customize the kick messages here 
  yourself, select the offence from the drop down menu and type what message you want
  to kick users with.

  
  Kills
  -----
  If you're an IRCop you can choose to automatically kill users for any of the things 
  listed.


  New in this version
  -------------------
  The best two newest features help protect against two types of cleverly coded spam 
  scripts: 

   > One script works by connecting to the server more than once, one client sits
     in channels looking for people to spam. The other does the spamming, as the
     spamming client isn't in the channel it's very hard for them to be kicked without
     checking the hostname against users in the channel. In this version of 
     AntiSpam Bot the filter kick option deals with it.

     Note: For this to work you must have enabled "Filter kick when banning" in the 
     options for the channel you want it for. 

   > Another type of inviter works by joining a channel, collecting a list of names,
     parting then spamming the people in the channel. It is hard to ban the user because
     they are not in the channel when the spam is recieved. AntiSpam Bot can be made to
     remember people that have left the channel within the last 5 minutes, if they have
     then they will be banned from the channel providing you have enabled the option for
     the script to do this.

     Note: For this to work you must have enabled "Ban spamming if they were recently on
     the channel" in the options for the channel you want it for. 


  Further help
  ------------
  If you need further help or have comments or suggestions contact hanzlas@hotmail.com

								Thanx for using mine Script
									hanzla