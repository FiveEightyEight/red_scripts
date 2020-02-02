#!/bin/bash

#VARIABLES

CRESET='\e[49m\e[39m\e[0m'

#Text Colors
CBLA='\e[30m'
CBLU='\e34m'
CLBU='\e[94m'
CGRE='\e[32m'
CMAG='\e[35m'
CLMAG='\e[95m'
CRED='\e[31m'
CLRED='\e[91m'
CWHI='\e[97m'
CYEL='\e[33m'
CLYEL='\e[93m'

#Background Colors
BBLA='\e[40m'
BRED='\e[41m'
BYEL='\e[43m'

#Attributes
ABOL='\e[1m'
ABLI='\e[5m'
ANOR='\e[0m'
AUND='\e[4m'

#Combo
WARN=$ABOL$CBLA$BYEL$ABLI"WARN"$CRESET

if [ $1 = 'resetapp' ]
then
        printf 'Resetting App...'
        rm -rf node_modules && npm cache clear --force && rm package-lock.json && npm i
        printf "\n...Reset Complete"
        exit 0
elif [ $1 = 'qa-build' ]
then
        git log | head -1 | sed -E 's/commit //g'
        exit 0
elif [ $@ = 'resetapp' && $@ = 'c' ]
then
        printf 'Resetting App...'
        rm -rf node_modules && npm cache clear --force && rm package-lock.json && npm i && git add package-lock.json && git commit -n -m 'reset app by deleting package-lock and reinstalled node_modules'
        printf "\n...Reset Complete"
        exit 0
else
        printf 'WHAT???'
        exit 1
fi
~                                                                                                                                      
~                                                                                                                                      
~                                                                                                                                      
~                                                                                                                                      
~                                                                                                                                      
~                       
