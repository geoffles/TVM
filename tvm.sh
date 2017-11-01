function tvm()
{
	TERRAFORM_DIR='/c/tools/terraform'
	PLATFORM='windows_amd64'
		
	if [ -z "$1" ]
	then
		echo -e "Set: $( echo $PATH | awk -F ":" '//{for(i=1;i<NF;i++){print $i}}' | awk -F "/" '/terraform/{print $5;}')"
		echo ""
		echo "Available:"
		ls -l $TERRAFORM_DIR | awk '/^d/{print $9;}'
		return
	fi
	
	if [ "$1" == "checkupdates" ]
	then
		curl -s https://releases.hashicorp.com/terraform/?_ga=2.242595202.1674966510.1509370400-1120994974.1509370400 | awk '/\s*<a href="\/terra/ { start=index($2,">")+1;end=index($2,"<"); tver=substr($2,start, end - start); print tver; }'
		return
	fi
	
	if [ "$1" == "install" ]
	then
		if [ -z "$2" ]
		then
			echo "You must specify a terraform version!"
			return
		fi
		
		echo -e "https://releases.hashicorp.com/terraform/$2/terraform_$2_$PLATFORM.zip -> $TERRAFORM_DIR/$2..."
		return
	fi

	if [ ! -d "$TERRAFORM_DIR/$1" ]
	then
	 echo -e "Terraform version $1 not found"
	 return
	fi

	echo Setting Terraform Version $1

	for d in $(ls -l $TERRAFORM_DIR | awk '/^d/{print $9;}')
	do
		PATH="$(echo $PATH | sed -e 's/$TERRAFORM_DIR\/$d\/://')"    
	done

	PATH="$(echo -e "$TERRAFORM_DIR/$1/:$PATH")"	
} 	