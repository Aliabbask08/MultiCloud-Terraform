#!/bin/bash

filename="aws/.terraform"

if [ -d $filename ]
then
      exit 
else
 cd aws
 terraform init
 cd -
fi
