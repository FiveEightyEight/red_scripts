#!/bin/bash

#VARIABLES

CRESET='\e[49m\e[39m\e[0m'

#Text Colors
CBLA='\e[30m'
CBLU='\e[34m'
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

resetapp() {
        if [ $1 = 'resetapp' ] && [[ -z "$2" ]]
        then
                printf 'Resetting App...'
                rm -rf node_modules && npm cache clear --force && rm package-lock.json && npm i
                printf "\n...Reset Complete"
                exit 0
        elif [ $1 = 'qa-build' ]
        then
                git log | head -1 | sed -E 's/commit //g'
                exit 0
        elif [ $1 = 'resetapp' ] && [ $2 = '-c' ]
        then
                printf " 🚀 $CLBU Executing $ABLI$1$CRESET...\n"
                echo -ne "Removing Node Modules...\r"
                rm -rf node_modules
                echo -ne "Clearing npm cache... \r"
                npm cache clear --force
                echo -ne "Removing package-lock... \r"
                rm package-lock.json
                echo -ne "Reinstalling node_modules... \r"
                npm i
                echo -ne "add and commiting new package-lock... \r"
                git status
                git add package-lock.json
                [[ -z "$3" ]] && printf "\n"$CLRED"no commit message argument, using default message$CRESET\n" && git commit -m 'reset package-lock' || git commit -m "$3"
                printf "\n 🛩   "$CGRE"Execution Complete$CRESET\n"
                exit 0       
        else
                printf 'WHAT???'
                exit 1
        fi
}

graph() {
        git log --graph
}

diff() {
        git diff --color . | cat
}

#function cd() {
#  builtin cd "$@" && ls -lrthG;
#}



while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - attempt to capture frames"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help                show brief help"
      echo "-a, --action=ACTION       specify an action to use"
      echo "-o, --output-dir=DIR      specify a directory to store output in"
      exit 0
      ;;
    -a)
      shift
      if test $# -gt 0; then
        export PROCESS=$1
      else
        echo "no process specified"
        exit 1
      fi
      shift
      ;;
    --action*)
      export PROCESS=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    -o)
      shift
      if test $# -gt 0; then
        export OUTPUT=$1
      else
        echo "no output dir specified"
        exit 1
      fi
      shift
      ;;
    --output-dir*)
      export OUTPUT=`echo $1 | sed -e 's/^[^=]*=//g'`
      shift
      ;;
    *)
      break
      ;;
  esac
done
