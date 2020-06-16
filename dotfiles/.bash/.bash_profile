# Tools aliases
# Recon Oneliners

# Colours have names too. Stolen from @tomnomnom who stole it from Arch wiki
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;93m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;96m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset

# Pipe colors 'Yaaaaay'
black()  { IFS= ; while read -r line; do echo -e '\e[30m'$line'\e[0m'; done; }
red()    { IFS= ; while read -r line; do echo -e '\e[31m'$line'\e[0m'; done; }
green()  { IFS= ; while read -r line; do echo -e '\e[32m'$line'\e[0m'; done; }
yellow() { IFS= ; while read -r line; do echo -e '\e[33m'$line'\e[0m'; done; }
blue()   { IFS= ; while read -r line; do echo -e '\e[34m'$line'\e[0m'; done; }
purple() { IFS= ; while read -r line; do echo -e '\e[35m'$line'\e[0m'; done; }
cyan()   { IFS= ; while read -r line; do echo -e '\e[36m'$line'\e[0m'; done; }
white()  { IFS= ; while read -r line; do echo -e '\e[37m'$line'\e[0m'; done; }

# Export Personal Binaries
export PATH=${PATH}:~/bin:~/.local/bin:~/Scripts

# Scan for open ports using naabu go tool
Naabu(){

if [ $# -eq 1 ]; then

sudo $HOME/Gotools/bin/naabu -silent -host $1

elif [ $# -eq 2 ]; then

sudo $HOME/Gotools/bin/naabu -silent -host $1 -o $2
echo "${txtgrn}Saved output file as: ${undpur}${2}${txtrst}"

else

echo "${txtred}Kindly provide one argument as host or two arguments one as host and the other as name of output file.${txtrst}"

fi

}

# Find domains and subdomains from certificates using certspotter
certspotter(){ 
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | uniq
}

# Find ip's of domain using dig
domain-ip(){
dig a $1 +short ; alert
}

# Find sub-domains from crtsh
crtsh(){
curl -s https://crt.sh/?Identity=%.$1 | grep ">*.$1" | sed 's/<[/]*[TB][DR]>/\n/g' | grep -vE "<|^[\*]*[\.]*$1" | sort -u | awk 'NF'
}

# Discover domains ips from crtsh and scan with nmap
certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | uniq | dig +short -f - | uniq | sudo nmap -A -sS -sV -i - --open -n ; alert
}

# Runs httprobe on all the hosts from certspotter
certprobe(){ 
if [ -d "$HOME/Drugery/engagements/$1" ]; then

curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a $HOME/Drugery/engagements/$1/httprobes.txt

else

mkdir -p $HOME/Drugery/engagements/$1
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a $HOME/Drugery/engagements/$1/httprobes.txt

fi
}

# Start sublister in its virtual env
sublist3r(){
inenv=$(python -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')
if [ ! -f ~/Gitools/Sublist3r/sublist3r/bin/activate ]
 then

 	python -m virtualenv ~/Gitools/Sublist3r/sublist3r
    source ~/Gitools/Sublist3r/sublist3r/bin/activate
    pip install -r ~/Gitools/Sublist3r/requirements.txt
    python ~/Gitools/Sublist3r/sublist3r.py -d $1 -o $2

else

 if [ inenv==0 ]
  then

  	source ~/Gitools/Sublist3r/sublist3r/bin/activate
    python ~/Gitools/Sublist3r/sublist3r.py -d $1 -o $2

else

python ~/Gitools/Sublist3r/sublist3r.py -d $1 -o $2

 fi

fi
}

# Exit out of a virtualenv
alias out='deactivate'

# Start Burpro
burp(){
$HOME/Scripts/Burp/jre1.8.0_60/bin/java -noverify -Xbootclasspath/p:$HOME/Scripts/Burp/burp-loader-keygen-2_1_07.jar -jar $HOME/Scripts/Burp/burpsuite_pro_v2.1.07.jar& ; firefox -P Burp --class="hacking" -no-remote
}

# Dirsearch from anywhere
dirsearch(){
python3 $HOME/Gitools/dirsearch/dirsearch.py -u $1 -e $2
}

# Start CMSeek
cmseek(){
inenv=$(python -c 'import sys; print ("1" if hasattr(sys, "real_prefix") else "0")')
if [ ! -f ~/Gitools/CMSeeK/cmseek/bin/activate ]
 then

 	python3 -m virtualenv ~/Gitools/CMSeeK/cmseek
    source ~/Gitools/CMSeek/cmseek/bin/activate
    pip3 install -r ~/Gitools/CMSeeK/requirements.txt
    python3 ~/Gitools/CMSeeK/cmseek.py -u $1

else

 if [ inenv==0 ]
  then

  	source ~/Gitools/CMSeeK/cmseek/bin/activate
    python3 ~/Gitools/CMSeeK/cmseek.py -u $1

else

    python3 ~/Gitools/CMSeeK/cmseek.py -u $1

 fi

fi
}


# If we have a file that contains some domains, where their is a specific domain that has both https and http protocal. This removes the duplicate domains with both protocals present and leaves the domain with https protocal only
only-https(){

	echo -e "$(cat $1 | wc -l)\n$(cat $1)" | python3 -c "lines = int(input());l=[input().split(' ')[0] for x in range(lines)];s1={x.split('//')[1] for x in l if 'https' in x};s2={x.split('//')[1] for x in l if 'https' not in x};s2=s2-(s1&s2);print('\n'.join(['https://{}'.format(x) for x in s1]+['http://{}'.format(x) for x in s2]))"

} 
# If we have a file that contains some domains, where their is a specific domain that has both https and http protocal. This removes the duplicate domains with both protocals present and leaves the domain with http protocal only
only-http(){

	echo -e "$(cat $1 | wc -l)\n$(cat $1)" | python3 -c "lines = int(input());l=[input().split(' ')[0] for x in range(lines)];s1={x.split('//')[1] for x in l if 'https' in x};s2={x.split('//')[1] for x in l if 'https' not in x};s1=s1-(s1&s2);print('\n'.join(['https://{}'.format(x) for x in s1]+['http://{}'.format(x) for x in s2]))"
}

# Remove the www. pattern in the begging of the line
remove-www(){

	cat $1 | sed 's/^www.//g' | sort -u
}

# Get domains ip
domains-ip(){

	cat $1 | sed 's/^http[s]:\/\///g' | awk '{print $1}' | xargs -n1 sh -c 'dig a $1 +short' sh | sort -u

}

# Send a file to a list of servers
send2servers(){

	echo -e "${txtcyn}Do make sure, keepass is opened.${txtrst}"
	sleep 5


	for server in $(S-Srs) 
	do 
		scp $1 root@"$server":/root/ 
	done
}

# Pull a file from multiple servers
copy4rmservers(){

	echo -e "${txtcyn}Do make sure, keepass is opened.${txtrst}"
	sleep 5

	echo -e "${txtblu}Enter file path and regex but don't start from root  then press${txtrst} ${txtred}[ENTER]${txtrst} ${txtblu}to continue.${txtrst}"
	read file

	for server in $(S-Srs) 
	do 
		scp root@"$server":/root/$file . 
	done
}

# Pull a file from a single server
copy4rmserver(){
	echo -e "${txtcyn}Do make sure, keepass is opened.${txtrst}"
	sleep 5

	echo -e "${txtblu}Enter file path and regex but don't start from root then press${txtrst} ${txtred}[ENTER]${txtrst} ${txtblu}to continue.${txtrst}"
	read file

		scp root@$1:/root/$file .
}

# Get public ip
ip-address(){
	ip route get 1.2.3.4 | awk '{print $7}'
}

network-device(){
	nmcli -p device show
}

# Create a virtual enviroment when inside a python project folder that requires me to install pip packages
create-virtualenv(){
	echo -e "${txtcyn}Creating Virtual Enviroment ...${txtrst}"
	sleep 1

	#echo -e "${txtblu}Enter virtual enviroment name please then press${txtrst} ${txtred}[ENTER]${txtrst}"

	location=$(pwd)
	envname="virtual-enviroment"
	
	python3 -m virtualenv ${location}/${envname}
    source ${location}/${envname}/bin/activate

    echo -e "${txtblu}Done creating virtual enviroment ${txtred}${envname}${txtrst}"
}

# Enter virtual enviroment when inside a python project folder where I had created a virtual enviroment
enter-virtualenv(){
	echo -e "${txtcyn}Entering Virtual Enviroment ...{txtrst}"
	sleep 1

	#echo -e "${txtblu}Enter virtual enviroment name please then press${txtrst} ${txtred}[ENTER]${txtrst}"

	location=$(pwd)
	envname="virtual-enviroment"

	source ${location}/${envname}/bin/activate
}

# Data analysis options, I use this most of the time hence why they are here!!
# ------------------------------------------------------------------------------

ips-n-ports(){
	cat $1 | sed 1d | awk -F',' '{print $1,$2}' | sort -t',' -n -k2 | awk -F' ' -v OFS=' ' '{x=$1;$1="";a[x]=a[x]","$0}END{for(x in a) print x,a[x]}' | sed 's/, /,/g' | sed 's/ ,/ /' | sort -V -k1 | less
}

ips(){
	cat $1 | sed 1d | awk -F',' '{print $1,$2}' | sort -t',' -n -k2 | awk -F' ' -v OFS=' ' '{x=$1;$1="";a[x]=a[x]","$0}END{for(x in a) print x,a[x]}' | sed 's/, /,/g' | sed 's/ ,/ /' | sort -V -k1 | cut -d " " -f 1 | less
}

ports(){
		cat $1 | sed 1d | awk -F',' '{print $1,$2}' | sort -t',' -n -k2 | awk -F' ' -v OFS=' ' '{x=$1;$1="";a[x]=a[x]","$0}END{for(x in a) print x,a[x]}' | sed 's/, /,/g' | sed 's/ ,/ /' | sort -V -k1 | cut -d " " -f 2 | less
}

ips-n-ports15(){
	awk -F'"|","' -v lines=$(wc -l < $1) '
	BEGIN{
	  print "IpAddr,Ports"
	}
	FNR>1{
	  num=split($3,array," ")
	  for(i=1;i<=num;i++){
	    if(i==1){ printf $2 OFS }
	    printf("%s%s",array[i],i%15==0||i==num?ORS:FNR==lines && i==num?ORS:",")
	    if(i%15==0){ printf $2 OFS }
	  }
	}' $1
}
# ------------------------------------------------------------------------------