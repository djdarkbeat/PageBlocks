Instructions on how to install PageBlocks framework version 5.5

################

The following steps describe in a very concentrated way how to install a "blank" project.

Unfortunately I haven't had time to update the manual, it refers currently to version 5.3

################

1. If you don't have a separate Lasso site for the new project go ahead and add one:
In Lasso ServerAdmin add new site <mysite>


2. In Apache 2 add a virtual host for the new site.
/private/etc/hosts  add line <127.0.0.1> www.<mysite>.<dev>
/private/etc/apache2/extra/httpd-vhosts.conf add virtual host similar to this:

# <mysite>
<VirtualHost *:80>
	DocumentRoot 	"/Library/WebServer/Documents/<mysite>"
	ServerName 		www.<mysite>.dev
	LogLevel 		crit
	ErrorLog 		/private/var/log/apache2/<mysite>_errorlog
	CustomLog 		/private/var/log/apache2/<mysite>_accesslog common
	Include			/private/etc/apache2/pageblocks.conf	
</VirtualHost>

The file pageblocks.conf is included with this download and should reside on:
/private/etc/apache2/pageblocks.conf


3. If you don't have a host for MySQL setup yet in the Lasso SiteAdmin for the new site
add a host now:
In Lasso SiteAdmin for <mysite>:
Setup > Site > Summary column Data Sources Summary click MySQL : (Add Host)
Name: <mysql-hostname>
IP: 127.0.0.1 - or whatever the IP is
Port: 3306
Status: Enabled
Host Username: <mysql username>
Host Password: <mysql password>

4. If you don't have a database yet add one now using whatever method you prefer.
Make sure the database is enabled for the MySQL host in Lasso SiteAdmin.

You will typically have at least two databases: one for local development and one for remote
deployment, they may have different names.

Those database names must be added in /_pbInit/_initMasters.lgc in the select line 400 and onwards,
you can leave the two deployment modes, test and beta, to whatever when not used.

5. There is more configuration needed to be done in /_pbInit/_initMasters.lgc, see the manual
and other sources.

################

6. In order to setup a few things in Lasso SiteAdmin you import a settings file
included with this download:

In Lasso SiteAdmin go to Setup > Site > Import/Export:
-> Click on Choose File and select the file "pb_lasso_setup.txt"
-> Click Import

Restart the site.

This file sets basic settings such as file extentions and groups and users.
You can use it as is, but you will probably want to change the user password to something different:

Setup > Security > Users (Group: Any User)
Click one for one pbfiles, pbqueries and pbuploads and for each one enter a new password.
Each new password you enter must also be entered for the corresponding user in:
/_pbInit/_initMasters.lgc -> lines 80, 82 and 84

#################

7. You need to put a few files into the LassoAdmin folder and the LassoStartup folder of the new site:
Put the file in folder "Put_in_LassoAdmin" into LassoAdmin
Put the files in folder "Put_in_LassoStartup" into LassoStartup
Restart the site.

Now instal the folders/files in folder "Put_in_rootfolder" in the webserver root folder of the new web project.

#################

8. With a browser go to www.<mysite>.<dev>/siteDbm. If you get IP address not allowed, copy the IP address
shown on the page and paste into _initMaster.lgc around line 121 so you get a line saying:
$fw_debugIPFilter = '127.0.0.1,XX.XX.XX.XX';
where XX.XX.XX.XX is the IP address we need to allow for.
Refresh the siteDbm-page, you should now get access. Migrate to version 2.

Now go to www.<mysite>.<dev>/siteMngr and login with pb@test.com / pbVrsn550.

#################

Know issues.

Site Admin -> Users Admin -> Edit a user -> Profile tab doesn't save