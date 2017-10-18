#!/bin/bash

echo "How many users: "
read number

for ((i=1; i<=$number; i++))
	do
		user=chmuromaniak$i
		pass=P@ssw0rd123
		portal=chmurowisko-lab
		aws iam create-user --user-name $user
		aws iam add-user-to-group --group-name LabUsers --user $user
		aws iam create-login-profile --user-name $user --password $pass --password-reset-required
		echo https://$portal.signin.aws.amazon.com/console >> users.txt
		echo $user >> users.txt
		echo $pass >> users.txt
		echo '' >> users.txt
done
