#/bin/bash
basepath=$(dirname $(readlink -f $0))

if [ -z $1 ]
then
	echo "You need to specify an identity"
	exit
fi

identity=$(cat $basepath/data/git_identities | grep "^$1:" | head -n 1 | cut -d ':' -f2)

if [ -z identity ]
then
	echo "Not found an identity"
	exit
fi

echo "Identity found!"

email=$(echo $identity | cut -d ',' -f1)
name=$(echo $identity | cut -d ',' -f2)

echo Name: $name
echo Email: $email

git config user.email "$email"
git config user.name "$name"
git config user.identity "$identity"
