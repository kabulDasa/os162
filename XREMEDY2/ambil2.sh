#!/bin/bash
# 2016 Kabul Dasa R -- This is free software
#
# REV00 Sat Dec 31 16:20:31 WIB 2016 - use awk instead of sed
# START Sat Dec 31 15:45:37 WIB 2016  
# script bekerja dengan menyimpan no. ranking dan urlnya pada array,
# lalu array url dicek hasil text dumpnya, jika berhasil dump disimpan dalam
# file bernama RK-XX.txt, jika gagal dibuat RK-XX-GAGAL.txt

arrRK=()
arrURL=()

RK="$(awk '{print $2}' ranking.txt)"
URL="$(awk '{print $3}' ranking.txt)"


for value in $RK ; do
  arrRK+=("$value")
done

for value1 in $URL ; do
  arrURL+=("$value1")
done

for  (( ii=0; ii<${#arrRK[@]}; ii++ )) ; do 
  var="$(w3m -dump ${arrURL[ii]})"
  if [ -z "$var" ]; then
    touch "${arrRK[ii]}-GAGAL.txt"
  else
    w3m -dump -cols 1000 ${arrURL[ii]} > "${arrRK[ii]}.txt" 
  fi 	  
done 
