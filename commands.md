
```bash
find -type f -print0 | xargs -0 md5sum > www.md5                           #use find to search and then Xargs to split that to a single line command for md5sum to do a recursive md5sum of search path can also use -name '*.XXX' to search for any file with extention XXX
find . -name '*.oma' -print0 | xargs -0 -I % cp % /mnt/MUSIC/OMA           #copys all OMA file in the DIR tree to /mnt/MUSIC/OMA
find . -name '*.XXX' -print0 | xargs -0 rm -fV                             #find and remove all files with XXX in dir TREE
find . -name 'FILE'		                                           #FIND FILE
netstat -an | grep PORT                                                    #do a portmap look up and display all entries with PORT
nmap IPADDRESS -p PORT                                                     #probes the PORT on IPADDRESS can also use a HOSTNAME with out the -p maps all ports that are OPEN
cat OS.sh | wall                                                           #print the file OS.sh into Wall to displayied on ALL ttys
sudo apt-get dist-upgrade                                                  #install all upgrades
sudo fdisk -l                                                              #list all file systems connected to the computer
sudo ufw status                                                            #FIREWALL status
uuidgen >> uuid.dat                                                        #make a random uuid and print to uuid.dat APPEND
uptime                                                                     #displays the uptime for the server
hostname --fqdn                                                            #display the full qualified domain name
md5sum -c FILE.md5                                                         #check files against FILE.md5
md5sum -b *.* > FILE.md5                                                   #make an md5sum for files and store in FILE.md5
sudo /etc/init.d/networking restart                                        #restart the Network interface deamon
nslookup WWW                                                               #look up IP with WWW host
sudo sed -i 's/OLD-WORD/NEW-WORD/g' FILE-NAME                              #replace OLD-WORD with NEW-WORD in file with name FILE as ROOT
      (sed can also use 's:OLD-PATTERN:NEW-PATTERN:g')
sudo mount SERVER-ADDY:/LocalRepos LOCAL-MOUNT-DIR                         #mount remote SERVER-ADDY:/LocalRepos into the local LOCAL-MOUNT-DIR
chown NEWUSER FILE                                                         #change owner of FILE to NEWUSER. MUST BE ROOT!!!!
sudo dhclient ADAPTER							   #release and renew the lease for ADAPTER
sudo iptraf                                                                #IPtrafic monitor paket sniffer
ps -aux                                                                    #display Process the 2nd colume is the PID
kill -9 PID                                                                #PID is the Process ID can be found using ps -aux see above
sudo crontab -l                                                            #list all Crontab Jobs that are running

sudo cat /home/admiral/blacklist.domains >> /etc/squid/bad_domains         #update bad_domains with blacklist.domain
sudo reload squid                                                          #reloads all the config files to squid
sudo restart squid                                                         #restarts the squid proxy server



tar xvzf file.tgz						           #will unzip FILE.tgz
tar -zxvf file.tar.gz							   # will extract everything from file.tar.gz
tar -zcvf tarfile.tar.gz -C /path/to/foldername_tocompress  # Compress Entire directory with Subdirectories
dpkg --get-selections | grep php					#this will grab the installed list and then filter it for a single package
dpkg -L php5-gd										#this will locate all the files for a specific package

grep -c processor /proc/cpuinfo				# count number of processors on your system
cat /proc/cpuinfo							#print out a list of information about your processor
grep NR_CPUS /boot/config-`uname -r`		#grab the MAX number of processors suported by KERNEL
dmesg |grep processor						#find the Number of processors in a system
lscpu										#indepth processor info including 64 bit compatability

iperf -s -p 65000						           #on machine1 (host, this one will receive)
iperf -c [ip of server] -p 65000				           #on machine2 (client, this one will upload)


----------------------------------------------------------------- FIREWALL RULES ---------------------------------------------------------

iptables -A INPUT -m mac --mac-source MAC:ADDRSS:HERE -j ACCEPT            #MAC adress filter ACCEPT from mac-source when defualt policy is DROP
iptables -A INPUT -m mac ! --mac-source MAC:ADDRSS:HERE -j DROP            #MAC adress filter DROP from ALL BUT mac-source

_________________________________________________________ server / client file transfers _________________________

nc EXAMPLE.COM PORT | pv | tar -xf -			#Client side to download with a speed bar on it
tar -cf - PATH/TO/FILE | pv -s $(du -sb PATH/TO/FILE | awk '{print $1}') | nc -l PORT #server side with ETA


sudo arp-scan --interface=eth1 --localnet #scan all addresses localnet using eth1 grabs fingerprint for mac IDs


______________________________________ Hard drive Clone and Virtualization ___________________________________________

dd if=/dev/sdb of=dd-image.raw                                                #Clones the /dev/sdb drive
VBoxManage convertdd dd-image.raw sda.vdi --format VDI --variant Fixed        #Convert clone to Virtual drive

______________________________________ A/V Converstion ___________________________________________

for f in *.mkv; do avconv -i "$f" -codec copy "${f%.mkv}.mp4"; done

curl http://URL_HERE | grep "[Mm][Pp]3" | sed 's:FILTER_TO_STRIP::g' | sed 's:PATTERN_TO_STRIP::g' | sed 's|.*:|http:|g' > MP3Links.txt
```

