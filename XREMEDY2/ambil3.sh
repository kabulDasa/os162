#!/bin/bash
# (c) 2016 Kabul Dasa R -- This is free software
# (c) 2016 Kabul Dasa R -- This is free software
# 
# script bekerja dengan membaca file RK-* dan mencari format AA. [UB-CC]
# format diubah menjadi menjadi U B CC AA dan disimpan ke XHASIL.txt
# isi dari XHASIL.txt disort dan disimpan ke YHASIL.txt
# isi dari YHASIL.txt dengan pola U B CC * yang sama dimerge menjadi satu baris dan disimpan ke ZHASIL.txt

cat RK-*.txt | 
grep http | 
awk -F "." '{print $1 " " $2}'| 
awk -F "]" '{print $1}' | 
grep "-" | 
awk -F "[" '{print $1$2}' | 
awk -F "-" '{print $1 " " $2}' | 
awk -F "U" '{print $1$2}' | 
awk -F " " '{print $2 " " $3 " " $1}' | 
awk '{ if ($1 ~ /^[0-9 ]*$/) print }' | 
awk '{print "U " $0}' > XHASIL.txt

cat XHASIL.txt | sort -k2,4 > YHASIL.txt

awk  '{a[$1FS$2FS$3]=a[$1FS$2FS$3]" "$NF } END {for (ii in a) print i""a[ii]}' YHASIL.txt | sort > ZHASIL.txt
