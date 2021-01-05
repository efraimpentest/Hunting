#!/bin/bash
if [$1 == ""]
then
	echo "-----------------------------------"
	echo "          Comando invalido         "
	echo "-----------------------------------"
	echo "$0 site.com"
else
	echo "Carregando resultados........"
rm index.html
wget $1

cat index.html | grep "href" | cut -d "/" -f 3 | grep "\." | cut -d '|' -f 1 | cut -d '"' -f 1 > lista.txt  ;
rm index.html
	echo "-----------------------------------------------------------------------------------"
	echo "				 	 Fim Da Hunt                                     "
	echo "-----------------------------------------------------------------------------------"
for url in $(cat lista.txt); do host $url | grep "has address";
done
fi
