#/bin/bash

#################################################################
#                                                               #
# Name: common-spam.sh                                          #
#                                                               #
# Author: Thiago Marques (thiagomarquesdums@gmail.com)          #
# Date: 26/10/19                                                #
#                                                               #
# Description: search for words in exim_mainlog and send        #
# information to zabbix                                         #
#                                                               #
# script homologated to centOS 6 and 7                          # 
#                                                               #
# USO: /root/scripts/common-spam.sh                             #
#                                                               #
#################################################################

#ALTER VARIABLE DEFAULT IFS
IFSback=$IFS
IFS=$'\n'

#GET COMMON WORDS USED IN SPAM
/usr/bin/wget https://raw.githubusercontent.com/marquesms/scripts/master/arquivos/common-spam.txt -O /tmp/common-spam.txt

#LOOP THAT WILL CYCLE THROUGH THE EXIM_MAINLOG FILE FOR KEYWORDS IDENTICAL TO THE common.spam.txt FILE
#USE THIS LINE TO SEARCH ON A SPECIFIC DATE
#for i in $(cat /tmp/common-spam.txt); do grep -w $i /var/log/exim_mainlog | grep 2019-10-23; done
for i in $(cat /tmp/common-spam.txt); do grep -w $i /var/log/exim_mainlog | grep /bin/date +%Y-%m-%d; done