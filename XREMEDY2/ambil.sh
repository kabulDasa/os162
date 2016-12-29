# (c) 2016 Kabul Dasa R -- This is free software
# REV01 Thu Dec 29 14:14:21 WIB 2016 - remove bracket
# REV00 Thu Dec 29 12:27:14 WIB 2016 - extract content
# START Thu Dec 29 09:20:34 WIB 2016
# script menyimpan webpage dalam format text, mengambil konten
# yang berada diantara string ZCZC dan NNNN, dan menghapus bracket'[]'

start="========================================================== START BERKAS"
stop="========================================================== STOP BERKAS"
page="$(w3m -dump http://os162.vlsm.org/2016/11/ranking-os162.html)"

echo "$page" 					> temp
sed -n '/ZCZC/,/NNNN/{/ZCZC/b;/NNNN/b;p}' temp	> temp1
echo "$start$(cat temp1)"			> temp1
echo "$stop"				       >> temp1
sed 's/\[//g;s/\]//g' temp1			> rangking.txt
rm temp
rm temp1
