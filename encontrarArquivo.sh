#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 -t text -p path"
   echo -e "\t-t Text (substring) file contains"
   echo -e "\t-p Root directory in search tree"
   exit 1 # Exit script after printing help
}

while getopts "t:p:" opt
do
   case "$opt" in
      t ) parameterText="$OPTARG" ;;
      p ) parameterPath="$OPTARG" ;;
      ? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
   esac
done

# Print helpFunction in case parameters are empty
if [ -z "$parameterText" ] || [ -z "$parameterPath" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

grep -Ril $parameterText $parameterPath
