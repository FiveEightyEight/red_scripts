#!/bin/bash
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
