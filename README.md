# CoMithia
Archive of the CoMithia Project (I'm just archiving this Project)

> https://www.mediafire.com/file/l6bde8imz4jec58/MithiaEditor.zip/file

> https://www.mediafire.com/file/4j0xk8bbwal5m2n/CoMithia.rar/file

Chronicles of Mithia is compatible with most/any flavor of Linux based operating system. (This includes Cygwin) Below is an installation guide for Ubuntu x86 (32-bit).
 
sudo apt-get install mysql mysqlclient libmysqlclient18\
sudo apt-get install gcc make gdb\
sudo apt-get install liblua-5.1
 
make all
 
debug:
gdb <server> -x=gdbc
 
no debug with interface:
./<server>
 
no debug no interface:
./check-mithia-server-state (note that this starts all servers, so it's advised you set up the ones you want otherwise first.
 
Alter the conf files in the conf folder accordingly, you can see the current values used there.
 
I would suggest anyone to open the mithialua/Developers/Devs.lua and remove characters from the various staff tables.
 
Add a row 0 to Character and Item tables (I know, retarded...)
 
You will need to insert the maps into SQL as well as all tables were wiped clean. Most everything has intuitive names, so should be fairly easy to figure out.
