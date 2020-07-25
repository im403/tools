cd output

count1=$(ls -l . | egrep -c '^-')

if [ $count1 -eq 0 ]; then
echo "starting amass"
amass enum -passive -d hackerone.com > 0.txt
echo "amass ended"
else
amass enum -passive -d hackerone.com > 1.txt
fi

count=$(ls -l . | egrep -c '^-')

if [ $count -eq 2 ]; then
cat 0.txt | sort -u > 00.txt
cat 1.txt | sort -u > 11.txt
comm -23 00.txt 11.txt > /root/test/old.txt
comm -23 11.txt 00.txt > /root/test/new.txt
rm *
cd ..
curl -F file=@new.txt -F "initial_comment=New file has some updates" -F channels=C017HQ67A0N -H "Authorization: Bearer xoxb-614345759605-1247810854871-c2ELG4tXJ40teYszxTtgoUqG" https://slack.com/api/files.upload
curl -F file=@old.txt -F "initial_comment=old file has some updates" -F channels=C017HQ67A0N -H "Authorization: Bearer xoxb-614345759605-1247810854871-c2ELG4tXJ40teYszxTtgoUqG" https://slack.com/api/files.upload
else
echo "its 1 file there"
fi

