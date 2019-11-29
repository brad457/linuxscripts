#!/bin/bash
#File         cpuinfo.sh 
#Description  Outputs the type of CPU you have, if it supports 64 bit, what operations / flags it supports, and if it supports hardware virtualization. 
#Author       brad457
#Source       https://github.com/brad457/linuxscripts
#Created      2019.08.04
#Last Updated 2019.11.29
 
## OR better use the following ##
egrep -wo 'vmx|lm|aes' /proc/cpuinfo  | sort | uniq\
| sed -e 's/aes/Hardware encryption=Yes (&)/g' \
-e 's/lm/64 bit cpu=Yes (&)/g' -e 's/vmx/Intel hardware virtualization=Yes (&)/g'
