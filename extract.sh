
#!/bin/bash

#####################################################################
# script to extract data from ES to a CSV using es2csv              #
#                                                                   #
# date is passed in the runes2csv.sh script  "$(date +"%Y.%m.%d")"  #
#                                                                   #
# runs every hour @hourly                                           #
#                                                                   #
# created 01/04/2019 by steve coyle                                 #
#####################################################################



#remove old file first
rm /root/es2csv/<filename>.csv



#run es2csv to query for certain fields
#put in file name and credentials if needed, if no uname or pass neded remove -a 
#$1 is so you can pass in the date variable. 

es2csv -q '*' -o /root/es2csv/<filename>.csv -a <username>:<pass> -u https://<ES IP>:9200 -i <indexname>-$1 -f <fields>





#allow es2csv to write the file pasue for 1m 
sleep 1m




#copy file to remote server if need be. Use sshpass to make life easy

sshpass -p <password> scp <filename>.csv <username>@<pass>:<file path to save to>








