#!/bin/sh
cp -R ../RHCSA_cs/ ~/Dropbox/
ruby build.rb
cp -R ../RHCSA_cs 
git add -A; git commit -m "update"; git push origin master
