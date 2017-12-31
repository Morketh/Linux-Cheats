#!/usr/bin/env python

import random, string, crypt, datetime

userList = ['user1','user2','user3','user4','user5']
dateNow = (datetime.datetime.utcnow() - datetime.datetime(1970,1,1)).days

for user in userList:
        randomsalt = ''.join(random.sample(string.ascii_letters,10))
        randompass = ''.join(random.sample(string.ascii_letters,10))
        print("%s:%s:%s::0:99999:7:::" % (user, crypt.crypt(randompass, "$6$"+randomsalt), dateNow))
