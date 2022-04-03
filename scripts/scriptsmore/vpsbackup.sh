#!/bin/sh

#DUMP ALL MYSQL DATABASES and archive all of /var/www then move them to /tmp then copy them to local machine
#TODO: maybe get password for mysql to get the databases taht way with -u thing from that website and also after getting them dumped make it so ONLY i can read them not public




#TODO: test speed of archiving then copying compared to the speed of just using scp to get all the files and rsync 

#TODO: try to only type password in one time instead of 3 times do finish script

#duplicate variables, because variables inside the ' on the remote server are separate to the ones on the local machine
vpsbackupdir=/tmp/backups/
DATE=$(date +%Y-%m-%d)
##
localsitesfolder=$HOME/websitebackups/$DATE
mkdir -p $localsitesfolder




if [ -z $SERVER_USERNAME ]; then echo "SERVER_USERNAME variable is unset check zprofile secretvariables"; fi
if [ -z $SERVER_IP ]; then echo "SERVER_IP variable is unset check zprofile secretvariables"; fi

#connect to REMOTE MACHINE and do commands
# NEED SINGLE QUOTES SO VARIABLES CAN BE SAVED WITHIN THE SCRIPT
ssh -t $SERVER_USERNAME@$SERVER_IP '

vpsbackupdir=/tmp/backups/
dbbackupdir=$vpsbackupdir/databases
wwwbackupdir=$vpsbackupdir/fullsites
DATE=$(date +%Y-%m-%d)

mkdir -p $dbbackupdir
mkdir -p $wwwbackupdir



#mkdir -p $HOME/databasebackups
#dbbackupdir=$HOME/databasebackups

#dump every sql database into a separate sql file name file with current date
#PROBLEM WITH THIS IS if the table has a space in it wont work and if i put quotes around it trys to make the folder with quotes so also wont work
for DB in $(sudo mysql -e '\''show databases'\'' -s --skip-column-names); do
     sudo mysqldump $DB > $dbbackupdir/$DB-$DATE.sql;
     echo $DB
done


#archive everything in /var/www/ so it will be quicker to download name file with current date
sudo 7z a $wwwbackupdir/varwww-$DATE.7z /var/www/

'
echo DONE now back to local machine  

#copy backups from remote machine to local machine
scp -r $SERVER_USERNAME@$SERVER_IP:/$vpsbackupdir/ $localsitesfolder

