# (c) 2016 Kabul Dasa R -- This is free software
# REV00 Thu Dec 29 12:27:14 WIB 2016
# START Thu Dec 29 09:20:34 WIB 2016
# script menyimpan webpage dalam format text dan mengambil konten
# yang berada diantara string ZCZC dan NNNN

start="================================================== START BERKAS"
stop="================================================== STOP BERKAS"
page="$(w3m -dump http://os162.vlsm.org/2016/11/ranking-os162.html)"

echo "$page" 					> temp
sed -n '/ZCZC/,/NNNN/{/ZCZC/b;/NNNN/b;p}' temp	> rangking.txt
rm temp
echo "$start$(cat rangking.txt)"		> rangking.txt
echo "$stop"				       >> rangking.txt
