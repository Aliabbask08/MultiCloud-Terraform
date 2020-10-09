#/bin/bash
ACCESS_KEY="$1"
SECRET_KEY="$2"
filename="aws/.terraform"
if [ -d $filename ]
then
      exit 
else
 cd aws
 terraform init -backend-config="access_key=$ACCESS_KEY" -backend-config="secret_key=$SECRET_KEY"
 cd -
fi
