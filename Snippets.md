##Sensor Scripts

IPMI Interface
+ Fan Speed
```bash
ipmi-sensors | awk '/RPM/{print}'
```

+ Temperature 
```bash
ipmi-sensors | awk '/Temperature/{print}'
```

##Find Zero Length files and remove them

```bash
find . -size 0c -delete
```

##KILL users terminals 
```bash
ps aux | grep "pts\/[2 4 0]" | awk '{print $2}' | xargs -I {} kill -1 {}
```

##MD5Sums
this next command will take the file downloaded supply that to md5sum to check files we add the grep in to tell see ONLY lines that DON'T contain "OK" that way we can see all broken files and not worry about the good ones
```bash
wget -qO- http://URL-OF-FILE/checksum.dat | md5sum --check | grep -v "OK"
```

##Download and decompress to output location
```bash
wget -qO- http://URL-OF-FILE/FILE_NAME_HERE.tar.gz | tar zxv -C /PATH/TO/OUTPUT/
```
##Proxy over SSH
```bash
ssh -D LOCAL_PROXY_PORT -p REMOTE_SSH_PORT USER@HOST.org
```
+ ```LOCAL_PROXY_PORT``` is the local port you want to set up as your tunnel entry point.
+ ```REMOTE_SSH_PORT`` is normally 22 unless you have to use a nonstandard port for bypassing a firewall.
+ ```USER@HOST.org``` is the host your connecting to. Normally this is your proxy server.
