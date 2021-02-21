#!/bin/bash
echo "Welcome to Batch-to-Bash v1.0!\n"
echo "Enter Batch File Source Directory: "
read srcdir
cd $srcdir
echo "\nEnter the name of the Batch file: "
read batname
filename="$batname"
n=1
echo "\nConverting..."
while read line; do
  sed 's/%/$/g'
  sed 's///-/g'
  sed 's/\///g'
  sed 's/==/=/g'
  sed 's/!==!/!=/g'
  sed 's/|/|/g'
  sed 's/@/set +v/g'
  sed 's/*/*/g'
  sed 's/>/>/g'
  sed 's/>>/>>/g'
  sed 's/</</g'
  sed 's/%VAR%/$VAR/gI'
  sed 's/REM/#/gI'
  sed 's/NOT/!/gI'
  sed 's/NUL//dev/null/gI'
  sed 's/ECHO/echo/gI'
  sed 's/ECHO./echo/gI'
  sed 's/ECHO OFF/set +v/gI'
  sed 's/FOR %%VAR IN (LIST) DO/for var in [list]; do/gI'
  #sed 's/:LABEL//g'
  #sed 's/GOTO//g'
  sed 's/PAUSE/sleep/gI'
  sed 's/CHOICE/select/gI'
  sed 's/IF/if/gI'
  #sed 's/IF EXIST FILENAME/if [ -e filename ]/gI'
  #sed 's/IF !%N==!/if [ -z "$N" ]/gI'
  sed 's/CALL/source/gI'
  sed 's/SET/export/gI'
  sed 's/SHIFT/shift/gI'
  #sed 's/SGN/-lt/g'
  #sed 's/SGN/-gt/g'
  sed 's/ERRORLEVEL/$?/gI'
  sed 's/CON/stdin/gI'
  #sed 's/PRN//dev/lp0/gI'
  #sed 's/LPT1//dev/lp0/gI'
  #sed 's/COM1//dev/ttyS0/gI'
  n=$((n+1))
echo "\nDone!"
echo "Enter Destination Directory: "
read dstdir
echo "Enter a name for the Bash file: "
read bashname
done < $dtdir$bashname
exit
