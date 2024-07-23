#!/bin/env python

import skpy
import os

from getpass import getpass

#os.remove("token")

try:
    sk = skpy.Skype("admiralmorketh","x9SSQzeMGhg6gKA","token")
except skpy.core.SkypeAuthException as e:
    print("Error: {}".format(e))
    exit()

print("Logged in getting recent chat list")
while sk.chats.recent():
    pass

print("Removing chat history")

for chat in sk.chats:
    #print(chat.id)
    try:
        print("Attempting to leave chat: {}".format(chat.id))
        chat.leave()
    except:
        print("Leave failed....deleting")
        chat.delete()
