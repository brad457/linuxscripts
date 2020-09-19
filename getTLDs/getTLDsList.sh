######       Script: getTLDsList.sh       ######
###### Description: Gets the updated list ######
###### of Top Level Domains from iana.org ######

result="`wget -qO- https://data.iana.org/TLD/tlds-alpha-by-domain.txt`"

newdate=`echo "${result}" | head -1`
read -r olddate < getTLDsLastUpdated.txt

# Testing variables - BEGIN
#echo "NEW DATE: " $newdate
#echo "OLD DATE: " $olddate
# Testing variables - END

if [[ $newdate = $olddate ]]
then
  echo "The TLDs file is up to date"
else
  echo "The TLDs file is NOT up to date, updating file"
  echo $result > ~/Documents/TLDs.txt 
  echo "Sending KDE Notification"

  kdialog --passivepopup 'THe TLDs file has been updated and is saved at ~/Documents/TLDs.txt' 5 --icon ~/Documents/ICANN_ICO.ico --title 'ICANN TLDs update'

fi
echo "${result}" | head -1 > getTLDsLastUpdated.txt
