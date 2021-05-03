
# cmd 

标签（空格分隔）： tools

---

# tr
- to transliterate characters
- tr [options] source-char-list replace-char-list
- options

```
-c complement the value in source-char-list
-d delete characters
-s squeeze out duplicate characters
```
- test
```
  delete carriage return: tr -d '\r' < tmp 
  tr -d '4' < tmp  > tmp2
  for f in tmp*; do tr -d '6' < $f >> tmp4; done
  tr -d '5' < tmp4 | sort > tmp5
  cat tmp | tr a-z A-Z
  cat tmp | tr [:lower:] [:upper:]
  cat tmp | tr -c 1
  cat tmp | tr -c tmp2
  echo 123 | tr -c 5 789
  echo "linuxidc" | tr "l" "m"
  echo "linuxidc" | tr "lu" "my"
  echo "linuxidc" | tr "l-n" "w-z"
  echo "linuxidc" | tr -c "li" "xy"
  echo "GNU  \ Linux" | tr -s " "
  echo "linuxidc" | tr "lin" "red"
  echo "my phone is 123-456-7890" | tr -cd [:digit:]
  echo "my phone is 123-456-7890" | tr -d [:alpha:]
  echo "12345" | tr -c '13' 'a' 
  echo "12345" | tr -d [:digit:]
```
# grep
- to print lines of text that match one or more patterns
- grep [options] pattern-spec [files...] 
- options

```
-E match using extended regular expressions 
-f pat-file : read patterns from the file pat-file 
-i ignore lettercase
-n line number 
-r recursive
```
- test

```
 grep -nrw main ./ 
 grep -E -i '^[0-9]+' test 
 grep -E -i '^[0-9]+$' test 
 grep -E -i 'the\s' test 
 grep -E -i 'the\\s' test 
 grep -E -i 'the/\s' test 
 grep -E '^(From|Subject|Date)'  ../Mail
 grep -E '^(From)' ./
 grep -nr -E '^(From)' ./
 grep -E '^(From)' ./
 grep -nr -E '^(From)' ./
 grep -nr -E -i '^(From)' ./
 grep -E -ni '\<([a-z]+) +\1\>'  ./
 grep -nr -E i '\<([a-z]+) +\1\>'  ./
 grep -E -nr -i 'cat'  test
 grep -E -nr -i '^cat'  test
 grep -E -nr -i '\bcat'  test
 grep -E -nr -i '\bcat\b'  test
 grep -E -nr '[Yy]ang' ./
 grep -E -nr -i '<H[123]>' ./
 grep -E -nr -i '<H[12]>' ./
 grep -E -nr -i '<H[1]>' ./
 grep -E -nr -i '[0-9A-Z_!]' ./
 grep -E '[a-d]'  test 
 grep -E '^' test 
 grep -E '$' test 
 grep -E '[^1234]' test 
 grep -E -ii '(%d%d[-./]+)'
 grep -E -i '(%d%d[-./]+)'
 grep -E -i '(%d%d[-./]+)' test 
 grep -E -i '(%d%d[-./])+' test 
 grep -E -i '%d%d' test 
 grep -E -i '\d\d' test 
 grep -E -i '/d' test 
 grep -E -i '\d' test 
 grep -E -i '\\d' test 
 grep -E  '\d' test 
 grep -E '\d' test 
 grep -E '\w' test 
 grep -E '\d' test 
 grep -E '\D' test 
 grep -E '[0-9]' test 
 grep -E '[0-9]+' test 
 grep -E '([0-9][0-9][.-/])+' test 
 grep -E '[0-9][0-9][.-/]' test 
 grep -E '[0-9][0-9][.-\/]' test 
 grep -E '([0-9][0-9][.-\/])+' test 
 grep -E '([0-9][0-9][-.\/])+' test 
 grep -E '([0-9][0-9][-.\/])+' TEST 
 grep -E '[0-9]{1}' test
 grep -E '[0-9]{2}' test
 grep -E '[0-9]3}' test
 grep -E '[0-9]{3}' test
 grep -E '[0-9]{2,5}' test
 grep -E '[0-9]{3,5}' test
 grep -E '[0-9]{7}' test
 grep -E 'gr[Ee]y' test
 grep -E 'geff' test
 grep -E -i 'geff' test
 grep -E -i 'jeff' test
 grep -E  'jeff' test
 grep -E -i '[0-9]+' test
 grep -E -i '[0-9]?' test
 grep -E -i 'colou?r' test
 grep -E -i 'H[1-6]' test
 grep -E -i 'H[1-6] ' test
 grep -E -i 'H[1-6]*' test
 grep -E -i 'H[1-6]{1}' test
 grep -E -i 'H[1-6]{2}' test
 grep -E -i 'H[1-6]{3}' test
 grep -E -i 'the the' test
 grep -E -i 'the the ' test
 grep -E -i '(the )+' test
 grep -E -i '(the )' test
 grep -E -i '(the )+' test
 grep -E -i '[a-zA-Z]+' test
 grep -E -i '([a-zA-Z]+) +\1\' test
 grep -E -i '([a-zA-Z]+) +/\1/\' test
 grep -E -i '([a-zA-Z]+) +/\1\\' test
 grep -E -i '([a-zA-Z]+) +\1\' test
 grep -E -i '([a-zA-Z]+) +\1' test
 grep -i '([a-zA-Z]+) +\1' test
 grep -E -i '([a-zA-Z]+) +\1' test
 grep -E -i '([a-zA-Z]+) +\1' test
 grep -E -i '([a-zA-Z]+) +\1 ' test
 grep -E -i '([a-zA-Z]+) +\1\1 ' test
 grep -E -i '([a-zA-Z]+) +\1\1 ' test
 grep -E -i '([a-zA-Z]+) +\1\1' test
 grep -E -i '([a-zA-Z]+) +\1' test
 grep -E -i '([a-zA-Z]+) +\1 +\1' test
 grep -E -i '([a-zA-Z]+) +\1 \1' test
 grep -E -i '([a-zA-Z]+) +\1\1' test
 grep -E -i '\<([a-zA-Z]+) +\1\>' test
 grep -E -i 'ega' test
 grep -E -i 'ega.' test
 grep -E -i 'ega\\.' test
 grep -E -i 'ega\.' test
 grep -E -i 'ega.att' test
 grep -E -i 'ega\.att' test
 grep -E -i 'ega.att' test
 grep -E -i 'ega.att' test
 grep -E -i 'ega\.att' test
 grep -E -i 'ega\.' test
 grep -E -i 'ega.' test
 grep -E -i 'ega\.' test
 grep -E -i '\$' test
 grep -E -i '\$[0-9]+.[0-9]' test
 grep -E -i '\$[0-9]+.[0-9]+' test
 grep -E -i 'j$([0-9]+.[0-9]+' test
 grep -E -i '$[0-9]+\.[0-9]+' test
 grep -E -i '$[0-9]+\.' test
 grep -E -i '$[0-9]+' test
 grep -E -i '\$[0-9]+' test
 grep -E -i '\$[0-9]+\.' test
 grep -E -i '\$[0-9]+(\.[0-9]+)' test
 grep -E -i '' test
 grep -E -i '[0-9]+:[0-9]+' test
 grep -E -i '[0-9]+:[0-9]+[am|pm]' test
 grep -E -i '[0-9]+:[0-9]+[a|p]m' test
 grep -E -i '(1[012]|[1-9])' test
 grep -E -i '(1[012]|[1-9]):' test
 grep -E -i '(1[012]|[1-9]):[0-5]' test
 grep -E -i '(1[012]|[1-9]):[0-5][0-9]' test
 grep -E -i '(1[012]|[1-9]):[0-5][0-9](am|pm)' test
 grep -E -i 'a*' test
 grep -E -i 'a*(ab)' test
 grep -E -i '([a-z]+)' test
 grep -E -i '([a-z]+) ' test
 grep -E -i '([a-z]+) \1' test
```
# sed
- a stream editor. to perform basic text transformations on an input stream.
- sed SCRIPT INPUTFILE 
- options
```
-e editing command  
-f script-file : read commands from file 
-n suppress automatic printing of pattern space 
```
- test

```
 ~  df /mnt/usb/                                                                                                          
 Filesystem           1K-blocks      Used Available Use% Mounted on                                                        
 /dev/sda1              7970756     28788   7941968   0% /mnt/usb                                                          
 USED_PERCENT=`df /mnt/usb/ | awk 'FNR==2 { print $5 } '| sed 's/\([0-9]\+\)%/\1/'`  
  delete 1 line: sed '1d'
delete last line: sed '$d'
delete string: sed 's/MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA//' 
add N head : sed '1s/^/N:  /
replace 0203 with E: sed 's/0203/\nE:  /'
  find /home/eric/ -type d -print | sed 's;/home/eric/;/home/lt/;'
  find /home/eric/ -type d -print | sed 's;/home/eric/;/home/lt/;'| sed 's/^/mkdir/'
  find /home/eric/ -type d -print | sed 's;/home/eric/;/home/lt/;'| sed 's/^/mkdir /'
  find /home/eric/ -type d -print | sed 's;/home/eric/;/home/lt/;'| sed 's;^;mkdir ;'
  find /home/eric/ -type d -print | sed 's;/home/eric/;/home/lt/;'| sed 's;;mkdir ;'
  find /home/eric/ -type d -print | sed 's;/home/eric/;/home/lt/;'| sed 's;^;mkdir ;'
  find /home/eric/ -type d -print | sed 's;/home/eric/;/home/lt/;'| sed 's;^;mkdir ;'|sh -x
  echo /home/tolstoy/ | sed 's;\(/home\)/tolstoy;\1/lt/;'
  echo /home/tolstoy/ | sed 's;\(/home\)/tolstoy;\1/lt;'
  echo /home/tolstoy/ | sed 's;\(/home\)/tolstoy/;\1/lt;'
  echo /home/tolstoy/ | sed 's;\(/home\)/tolstoy/;\1/lt/;'
  echo /home/tolstoy/ | sed 's;\(/home\)/tolstoy/;\1/lt/;'
  sed 's/\body'
  sed '/wp-content/&,pppp/' < linux-comm-tr.html.old > linux-comm-tr.html
  sed 's/wp-content/&,pppp/' < linux-comm-tr.html.old > linux-comm-tr.html
  sed 's/wp-content/&,pppp/' < linux-comm-tr.html.old > linux-comm-tr.html
  sed 's/assets/&,pppp/' < linux-comm-tr.html.old > linux-comm-tr.html
  sed 's/Tolstoy/Camus/' < example.txt 
  sed 's/Tolstoy/Camus/g' < example.txt 
  sed 's/Tolstoy/Camus/2' < example.txt 
  sed 's/Tolstoy/Camus/1' < example.txt 
  sed -e 's/foo/bar/g' -e 's/chicken/cow/g' < myfile.xml 
  sed -f fixup.sed myfile.xml > myfile2.xml
  sed 's/foo/bar/g ; s/chicken/cow/g' myfile.xml > myfile2.xml 
  sed -n '/<html>/p' *.html
  sed -e 3a\newline testfile 
  sed -e 3a\NEWLIne testfile 
  sed -e 3ax\NEWLIne testfile 
  sed -e 3axNEWLIne testfile 
  sed -e 23axNEWLIne testfile 
  sed -e 1axNEWLIne testfile 
  sed -e 1axrnNEWLIne testfile 
  sed -e 1a\xrnNEWLIne testfile 
  sed '1d' | sed '$d'
  cat testfile | sed '2,3d'
  cat /etc/passwd | sed '2d'
  cat testfile | sed '2d'
  cat testfile | sed '1d'
  cat testfile | sed '2,$d'
  cat testfile | sed '2a drink tea'
  cat testfile | sed '2i drink tea'
  cat testfile | sed '2a Drink tea or ...\'
  cat testfile | sed '2a Drink tea or ...\test?'
  cat testfile | sed '2,3c No 2-5number'
  cat testfile | sed -n '2,3p'
  cat testfile | sed '/linux/p'
  cat testfile | sed '/hello/p'
  cat testfile | sed  -n '/hello/p'
  cat testfile | sed  '/hello/p'
  cat testfile | sed  -n '/hello/p'
  cat testfile | sed  -n '/HEllo/p'
  cat testfile | sed  '/HEllo/p'
  cat testfile | sed  '/HEllo/d'
  cat testfile | sed -n '/HEllo/d'
  cat testfile | sed  '/HEllo/d'
```
# cut
- to select one or more field 
- cut [options] file 
- options
```
-b byte  
-c characters
-d delimiter 
-f field number
```
- test
```
  cut -d : -f 1,5 /etc/passwd
  cut -d : -f 1,2 /etc/passwd
  cut -d : -f 1,3 /etc/passwd
  cut -d : -f 1,4 /etc/passwd
  cut -d : -f 1,5 /etc/passwd
  cut -d : -f 1 /etc/passwd
  cut -d : -f 1,2 /etc/passwd
  cut -d : -f 1,2,3 /etc/passwd
  cut -d : -f 1,3 /etc/passwd
  cut -d : -f 6 /etc/passwd
  cut -d : -f 1,3 /etc/passwd
  ls -l | cut -c 1-10
  ls -l | cut -c 11
  ls -l | cut -c 13
  ls -l | cut -d   -f 2 
  who | cut -b 3
  who | cut -b 4
  who | cut -b 1-3
  who | cut -c 1
  who | cut -c 2
  who | cut -d ' ' -f 1
  who | tr -s ' ' | cut -d ' ' -f 1
  who | tr -s ' ' | cut -d ' ' -f 2
  who | tr -s ' ' | cut -d ' ' -f 3
  who | tr -s ' ' | cut -d ' ' -f 4
  who | tr -s ' ' | cut -d ' ' -f 5
  cut -b 1,2,3 state.txt 
  cut -b 1-2,5-6 state.txt 
  cut -b 1- state.txt 
  cut -b 2- state.txt 
  cut -b -3 state.txt 
  cut -c 1-7 state.txt 
  cut -f 1 state.txt 
  cut -f 2 state.txt 
  cut --complement -d " " -f 1 state.txt 
  cut -f 1 state.txt 
  cut -f 2 state.txt 
  cut --complement  -d " " -f 1 state.txt 
  cut --complement  -c 5 state.txt 
  cut -d " " -f 1,2 state.txt 
  cut -d " " -f 1,2 state.txt --output-delimiter='#'
  cut --version 
  cat state.txt | cut -d ' ' -f 1 | sort 
  cat state.txt | cut -d ' ' -f 1 | sort -r
  cat state.txt | cut -d ' ' -f 1 | sort -u
  cat  state.txt | head -n 3 | cut -d ' ' -f 1 
```
# join
- to merge records in sorted files based on a common key
- join [options] file1 file2 
- options
```
-i ingnor case  
-j FIELD
-1 FIELD 
-2 FIELD 
```
- test
https://www.geeksforgeeks.org/join-command-linux/
```
  join sales.sorted  quotas.sorted 
  join file1.txt  file2.txt 
  join file1.txt  file2.txt  -a 1
  join file1.txt  file2.txt  -a 2
  join file1.txt  file2.txt  -v 1
  join -1 2 -2 2 file1.txt  file2.txt 
  join -1 1 -2 2 file1.txt file2.txt 
  join -1 2 -2 1 file1.txt file2.txt 
  join -i file1.txt file2.txt 
```
# awk
- could rearranging fields
- awk 'program' [file...]
- run action if pattern matches
  pattern  { action }
- print record if pattern matches
  pattern  
- run action for every record
           { action }
- pattern
  BEGIN
  END
- build-in scalar varialbes
    FILENAME : name of the current input file
    FNR : record number in the current input file
    FS : field separator(regular expression) (default " ")
    NF : number of fields in current record
    NR : record number in job
    OFS : output field separator(default " ")
    ORS : output record separator (default "\n")
    RS : input record separator(default "\n")
- test
```
  awk '{prinf $1}'
  awk '{ print $1}'
  awk '{ print $2, $5 }'
  awk '{ print $1, $NF }'
  awk 'NF > 0 { print $0 }'
  awk 'NF > 0'
  awk -F: '{ print $1, $5}' /etc/passwd
  awk -F: '{ print $1, $6}' /etc/passwd
  awk -F: '{ print $1,$6}' /etc/passwd
  awk -F: -v 'OFS=**' '{ print $1, $6 }' /etc/passwd
  awk -F: -v 'OFS=   ' '{ print $1, $6 }' /etc/passwd
  awk -F : '{ print "user", $1, "is really", $5}' /etc/passwd
  awk -F: '{printf "user %s is really %s\n", $1, $6}' /etc/passwd
  awk -F : '{ print "user"$1"is really"$5}' /etc/passwd
  awk -F : '{ print "user"$1"is really" $5}' /etc/passwd
  awk -F : '{ print "user "$1"is really" $5}' /etc/passwd
  awk -F : '{ print "user "$1" is really" $5}' /etc/passwd
  awk -F : '{ print "user", $1, "is really",  $5}' /etc/passwd
  awk -F : '{ print "user", $1, "is really", $5}' /etc/passwd

   85  awk 'FNR <=2' tmp
  754  awk -v One=1 -v Two=2 -f showargs.awk Three=3 file1 Four=4 file2 file2
  756  awk -v One=1 -v Two=2 -f showargs.awk Three=3 file1 Four=4 file2 file3
  757  awk 'BEGIN { for (k = 0; k < ARGC; k++)}'
  758  awk 'BEGIN { for (k = 0; k < ARGC; k++)
  782  awk 'BEGIN { print ENVIRON["HOME"]}'
  783  awk 'BEGIN { print ENVIRON["HOME"]};print ENVIRON["USER"]'
  784  awk 'BEGIN { print ENVIRON["HOME"];print ENVIRON["USER"] }'
  785  awk 'BEGIN { print ENVIRON["HOME"];print ENVIRON["USER"]}'
  786  awk 'BEGIN { print ENVIRON["HOME"];print ENVIRON["USER"] }'
  787  echo '  un deux trois' | awk -FS ' ' '{ print NF ":" $0}'
  788  echo '  un deux trois' | awk -FS '' '{ print NF ":" $0}'
  789  echo '  un deux trois' | awk -F ' ' '{ print NF ":" $0}'
  790  echo '  un deux trois' | awk -FS ' ' '{ print NF ":" $0}'
  791  echo '  un deux trois' | awk -F ' ' '{ print NF ":" $0}'
  792  echo '  un deux trois' | awk -F '' '{ print NF ":" $0}'
  793  echo '  un deux trois' | awk -F ' ' '{ print NF ":" $0}'
  794  echo '  un deux trois' | awk -F '[ ]' '{ print NF ":" $0}'
  795  echo '  un deux trois ' | awk -F '[ ]' '{ print NF ":" $0}'
  796  echo '  un deux trois  ' | awk -F '[ ]' '{ print NF ":" $0}'
  805  echo 'one two three four' | awk '{ print $1 $2 $3 }'
  806  echo 'one two three four' | awk '{ print $1, $2, $3 }'
  807  echo 'one two three four' | awk '{ print $3, $2, $1 }'
  808  echo 'one two three four' | awk '{ OFS = "..."; print $1,$2,$3}'
  809  echo 'one two three four' | awk '{ OFS = "\n"; print $1,$2,$3}'
  810  echo 'one two three four' | awk '{ OFS = "/n"; print $1,$2,$3}'
  811  echo 'one two three four' | awk '{ OFS = "\n"; print $1,$2,$3}'
  812  echo 'one two three four' | awk '{ OFS = "\t"; print $1,$2,$3}'
  813  echo 'one two three four' | awk '{ OFS = "\r"; print $1,$2,$3}'
  814  echo 'one two three four' | awk '{ OFS = "\n"; print $1,$2,$3}'
  815  echo 'one two three four' | awk '{ OFS = "\n"; print $1,$2,$3, $0}'
  816  echo 'one two three four' | awk '{ ORS = "\n"; print $1,$2,$3, $0}'
  820  time awk '' *.xml
  822  cat insert_awk_my.sh 
  823  awk 1 insert_awk_my.sh 
  824  awkinsert_awk_my.sh 
  825  awk insert_awk_my.sh 
  826  awk 1 insert_awk_my.sh 
  827  awk '{ print $1, log($1)}' 1
  828  awk '{ print $1, log($1)}' file
  829  echo "1 2 3" | awk '{ print $1, log($1)}'
  830  echo "2" | awk '{ print $1, log($1)}'
  831  echo "10" | awk '{ print $1, log($1)}'
  832  echo "10" | awk '{ print $1, log10($1)}'
  833  echo "10" | awk '{ print $1, log($1)}'
  834  echo "2.2" | awk '{ print $1, log($1)}'
  835  echo "1,2,3" | awk '{ print $1, log($1)}'
  836  echo "2,3,4" | awk '{ print $1, log($1)}'
  837  echo "2" | awk '{ print $1, log($1)}'
  838  echo "2\n3" | awk '{ print $1, log($1)}'
  839  echo "2\\n3" | awk '{ print $1, log($1)}'
  840  echo "2/\n3" | awk '{ print $1, log($1)}'
  841  echo "2\\n3" | awk '{ print $1, log($1)}'
  842  awk 'rand() < 0,05' insert_awk_my.sh 
  843  awk -v COLUMN=6 '{ sum += $COLUMN} END { print sum }' file
  844  awk -v COLUMN=6 '{ sum += $COLUMN} END { print sum }' insert_awk_my.sh 
  846  awk -v COLUMN=3 '{ sum += $COLUMN} END { print sum }' file
  847  awk -v COLUMN=4 '{ sum += $COLUMN} END { print sum }' file
  848  awk -v COLUMN=8 '{ sum += $COLUMN} END { print sum }' file
  849  awk -v COLUMN=9 '{ sum += $COLUMN} END { print sum }' file
  850  awk -v COLUMN=0 '{ sum += $COLUMN} END { print sum }' file
  851  awk -v COLUMN=9 '{ sum += $COLUMN} END { print sum }' file
  852  awk -v COLUMN=5 '{ sum += $COLUMN} END { print sum }' file
  855  awk -v COLUMN=1 '{ sum += $COLUMN} END { print sum }' file
  856  awk -v COLUMN=2 '{ sum += $COLUMN} END { print sum }' file
  857  awk -v COLUMN=3 '{ sum += $COLUMN} END { print sum }' file
  858  awk -v COLUMN=3 '{sum += $COLUMN } END  {print sum / NR}' file 
  859  awk -v COLUMN=4 '{sum += $COLUMN } END  {print sum / NR}' file 
  860  awk -v COLUMN=4 '{sum += $COLUMN } END  {print sum / NR}' file file
  861  awk  '{ sum += $NF; print $0, sum}' file 
  863  echo  1 2 3 | awk '{ sum += $NF; print $0, sum}'
  865  awk '(100 <= FNR) && (FNR <= 150) && /pattern/ {print FILENAME ":" FNR ":" $0}' file
  866  awk -F '\t' -v OFS='\t' '{ print $1, $3, $2, $4}' file
  867  awk -v OFS='\t' '{ print $1, $3, $2, $4}' file
  868  awk -v OFS='\t' '{ print $1, $3, $2, $4}' file > new
  870  awk 'BEGIN { FS = OFS = "\t"} } {print $1, $3, $2, $4}' file
  871  awk 'BEGIN { FS = OFS = "\t"} {print $1, $3, $2, $4}' file
  872  awk 'BEGIN { FS = OFS = " "} {print $1, $3, $2, $4}' file
  873  awk -F "\t" '{ print $1 "\t" $3 "\t" $2 "\t" $4}'file
  874  awk '{ print $1 "\t" $3 "\t" $2 "\t" $4}'file
  875  awk '{ print $1 "\t" $3 "\t" $2 "\t" $4}' file
  877  awk 'BEGIN { FS = "\t"; OFS = "&"}' { $1 = $1; print }' file
  878  awk 'BEGIN { FS = "\t"; OFS = "&"}' { $1 = $1; print }' file
  879  awk 'BEGIN {FS = "\t"; OFS = "&"} { $1 = $1; print}' file
  880  awk 'BEGIN {FS = " "; OFS = "&"} { $1 = $1; print}' file
  881  awk 'BEGIN {FS = " "; OFS = "&"} { print}' file
  883  sort file | awk 'Last != $0 { print } { Last = $0}'
  886  mawk
  887  awk 'BEGIN {RS = "\r\n"} { print }' file
  889  man awk
  891  awk 'BEGIN { ORS = "\n\n" } { print }' file
  892  awk 'BEGIN { ORS = "\n\n"} 1' file 
  893  awk 'BEGIN { ORS = "\n\n"} ' file 
  894  awk 'BEGIN { ORS = "\n\n"} 1' file 
  895  awk 'BEGIN { ORS = "\n\n"} 2' file 
  896  awk '{ print $0 "\n" }' file
  897  awk '{ print; print "" }' file
  898  awk '{ print}' file
  899  awk '{ print; print "" }' file
  900  awk '{ print; print 1 }' file
  901  awk '{ print; print 1 2 }' file
  902  awk '{ print; print 1,2 }' file
  903  gawk
  904  awk '{ print; print 1,2 }' file
  905  gawk 'BEGIN { RS="\n *\n"} { print }' file
  906  gawk 'BEGIN { RS=""} { print }' file
  910  awk 'length($0) > 72 {print FILENAME ":" FNR ":" $0 }' file
  911  gawk 'BEGIN { RS = "[^-0-9Xx]" } [0-9][-0-9]-[0-9Xx]' file
  912  gawk 'BEGIN { RS = "[^-0-9Xx]" } /[0-9][-0-9]-[0-9Xx]/' file
  913  gawk 'BEGIN { ORS = " "; RS = "<[^<>]*>"} { print }'  *.html 
  914  gawk 'BEGIN { ORS = " "; RS = "<[^<>]*>"} { print }'  file
  915  gawk -v ORS=' ' -v RS='[ \n]' '/<title *>/, /<\/title *>/' *.xml | sed -e 's@</title *> *@&\n@g'
  916  gawk -v ORS=' ' -v RS='[ \n]' '/<title *>/, /<\/title *>/' file | sed -e 's@</title *> *@&\n@g'
  923  awk '{ print $1}' file 
  925  awk '{ print $1}' file 
  926  awk '1 { print }' file
  927  awk 1 file
  928  awk '{ print }' file 
 
```
- new lines 
awk '/^LoadedHandle:/ { print $2 }' input.txt 
- without new lines 
awk '/^LoadedHandle:/ { printf $2 }' input.txt 

# sort
- to sort file,arrange the records in a particular order
- sort [options] [file]
- options
```
-r Option: Sorting In Reverse Order
-n Option : To sort a file numerically used –n option.
-nr option : To sort a file with numeric data in reverse order
-k : define the sort key
-c: check that input is correctly sorted
-t char: Use the single character char as  the default field seperator
```
- test
https://www.geeksforgeeks.org/sort-command-linuxunix-examples/
```

  tr -d '5' < tmp4 | sort > tmp5
  tr -d '\r' < tmp4 | sort > tmp6
  sed 's/:.*//' /etc/passwd | sort -u
  sed -n 's/:.*//' /etc/passwd | sort -u
  cat state.txt | cut -d ' ' -f 1 | sort 
  cat state.txt | cut -d ' ' -f 1 | sort -r
  cat state.txt | cut -d ' ' -f 1 | sort -u
  sort -k1,1 /etc/passwd
  sort -t: -k1,1 /etc/passwd
  sort -t: -k1,1 ./tmp
  sort -k1,1 ./tmp
  sort -t: -k3nr ./tmp
  sort -t: -k3n ./tmp
  sort -t: -k4n ./tmp
  sort -t: -k3n ./tmp
  sort -t: -k4n -u ./tmp
  cat ../dat/my-friends | awk -v RS="" '{ gsub("\n", "^Z"); print }' | sort -f
  cat ../dat/my-friends | awk -v RS="" '{ gsub("\n", "^Z"); print }' | sort -f | awk -v ORS="\n\n" '{ gsub("^Z", "\n"); print }'
  cat ../dat/my-friends | awk -v RS="" '{ gsub("\n", "^Z"); print }' | sort -f | awk -v ORS="\n\n" '{ gsub("^Z", "\n"); print }'|grep -v '#SORTKEY'
  cat ../dat/my-friends | awk -v RS="" '{ gsub("\n", "^Z"); print }' | sort -f | awk -v ORS="\n\n" '{ gsub("^Z", "\n"); print }'
  cat ../dat/my-friends | awk -v RS="" '{ gsub("\n", "^Z"); print }' | sort -f | awk -v ORS="\n\n" '{ gsub("\^Z", "\n"); print }'
  sort ../dat/latin-numbers | uniq -c
  sort ../dat/latin-numbers | uniq -d
  sort ../dat/latin-numbers | uniq -u
  sort file.txt 
  sort mix.txt 
  sort mix.txt > output.txt
  sort -r mix.txt 
  sort -r file.txt 
  sort -n file1.txt 
  sort  file1.txt 
  sort -nr file1.txt 
  sort -k 2n employee.txt 
  sort -k 2nr employee.txt 
  sort -c f1.txt 
  sort f1.txt | sort -c 
  sort -u car.txt 
  sort -M months.txt 
```
# fmt
- reformating paragraphs
- fmt [-WIDTH] [OPTION]... [FILE].
- options
```
-w, – -width=WIDTH option
-s option : This option split long lines
-u, – -uniform-spacing option
```
- test
https://www.geeksforgeeks.org/fmt-command-unixlinux/
```
  cat kt.txt | fmt | fmt -w 10
  fmt test
  fmt -w 0 test
  fmt -s kt.txt
  fmt -u kt.txt

```
# wc
- counts 
- test
```
  echo this is a good news | wc
  echo this is a good news | wc -c
  echo this is a good news | wc -l
  echo this is a good news | wc -w
  wc /etc/passwd /etc/group
```
# head
# extracting the first 7 lines
```
head -n 7 files
head -7 files
awk 'FNR <= 7' files
sed -e 7q files
sed 7q

```
# tail

```
tail -n 7 files
tail -7 files
tail -n 25 -f /var/log/messsages
```

# vim 

-  restart insert mode without esc
   A
- add search path
  :set path+=../lib
- view compressed file
  using vim to open file normally
- find and open file 

  ```
  gf
  
  CTRL-W f

  ```
- Encryption
	vim -x exam.txt
- Binary files
	vim -b datafile
	:%!xxd
	:%!xxd -r
- using F1 to learn usr_xx.txt- best tutorial
- run a terminal emulator in a vim window.

```
:term bash
:terminal
:term make myprogram
```
- exchange two split windows
ctrl + w + ctrl + r
- help for error message
```
	E37: No write since last change (use ! to override) ~
	:help E37
```
- discard changes and edit the new file
	:edit! foo.txt

- to see the list of files
    :args
- copy text to several registers 
	"fyas
	"l3Y
    "aaw
- paste text from register
    "fp
- appending to a file
    :writing >> dstfile
- readonly file
    vim -R file
- save and new file
    :saveas newfile - save  and not edit
    :file newfil
- adjust the size of font
    ctrl +
    ctrl -
   
- adjust the size of window
    ctrl  w  +
    ctrl  w  -
- moving bewteen windows

	CTRL-W h	move to the window on the left
	CTRL-W j	move to the window below
	CTRL-W k	move to the window above
	CTRL-W l	move to the window on the right

	CTRL-W t	move to the TOP window
	CTRL-W b	move to the BOTTOM window
- moving windows
	CTRL-W K
	CTRL-W H	move window to the far left
	CTRL-W J	move window to the bottom
	CTRL-W L	move window to the far right
- quit all and save all windows
    :qall
    :wall
    :wqall
	:qall!
- opening a window for each file
	vim -o one.txt two.txt three.txt
- view differences 
    vimdiff file1 file2
- open and close a fold
    zo
    zc
- move
```
usr_03.txt
               ge      b          w                             e
               <-     <-         --->                          --->
        This is-a line, with special/separated/words (and some more). ~
           <----- <-----         -------------------->         ----->
             gE      B                   W                       E

```
- Moving to a character
```
find:
	To err is human.  To really foul up you need a computer. ~
	---------->--------------->
	    fh		 fy

	To err is human.  To really foul up you need a computer. ~
		  --------------------->
			   3fl
	To err is human.  To really foul up you need a computer. ~
		  <---------------------
			    Fh
 to:
	To err is human.  To really foul up you need a computer. ~
		   <------------  ------------->
			Th		tn
 repeated with ";".  "," 
```
- Moving to a specific line
```
	    |	first line of a file   ^
	    |	text text text text    |
	    |	text text text text    |  gg
	7G  |	text text text text    |
	    |	text text text text
	    |	text text text text
	    V	text text text text    |
            text text text text    |  G
            text text text text    |
            last line of a file    V

			+---------------------------+
	H -->	| text sample text	    |
			| sample text		    |
			| text sample text	    |
			| sample text		    |
	M -->	| text sample text	    |
			| sample text		    |
			| text sample text	    |
			| sample text		    |
	L -->	| text sample text	    |
			+---------------------------+
```
-	Telling where you are
```
    CTRL-G
	:set number
	:set ruler
```
-	Scrolling around
```

                               +----------------+
                               | some text	|
                               | some text	|
                               | some text	|
	+---------------+	       | some text	|
	| some text	    |  CTRL-U  --> |		|
	|		        |	       | 123456		|
	| 123456	    |	       +----------------+
	| 7890		    |
	|		        |	       +----------------+
	| example	    |  CTRL-D -->  | 7890		|
	+---------------+	       |		|
                               | example	|
                               | example	|
                               | example	|
                               | example	|
                               +----------------+

	+------------------+		 +------------------+
	| earlier text	   |		 | earlier text	    |
	| earlier text	   |		 | earlier text	    |
	| earlier text	   |		 | earlier text	    |
	| earlier text	   |   zz--> | line with cursor |
	| earlier text	   |		 | later text	    |
	| earlier text	   |		 | later text	    |
	| line with cursor |		 | later text	    |
	+------------------+		 +------------------+
```
- close file
ZZ
- jumps back and forth
 ``
- mark
```
ma
`a
```
- change
dd: deletes a whole line
cc: changes a whole line
d$
c$
- SHORTCUTS
```
	x  stands for  dl  (delete character under the cursor)
	X  stands for  dh  (delete character left of the cursor)
	D  stands for  d$  (delete to end of the line)
	C  stands for  c$  (change to end of the line)
	s  stands for  cl  (change one character)
	S  stands for  cc  (change a whole line)
```
- REPLACING WITH ONE CHARACTER
```
	there is somerhing grong here ~
	rT	     rt    rw

	There is something wrong here ~

	There is something wrong here ~
			   5rx

	There is something xxxxx here ~

```
- 	Repeating a change
```
To <B>generate</B> a table of <B>contents ~
	f<   find first <     --->
	df>  delete to >	 -->
	f<   find next <	   --------->
	.    repeat df>			    --->
	f<   find next <		       ------------->
	.    repeat df>					    -->

```
- SWAPPING TWO CHARACTERS
```
	teh     th     the ~
	 x       p
```
- Using the clipboard
```
To copy a line to the clipboard: 
	"*yy
To put text from the clipboard back into the text: 
	"*p
    

or  
   "+yy
   "+p

```
-	Text objects
    Text objects are vim's way of transcending the individual character to allow the user to think in words, sentences, sentences, and paragraphs.
```
	"dl"	delete character (alias: "x")		|dl|
	"diw"	delete inner word			*diw*
	"daw"	delete a word				*daw*
	"diW"	delete inner WORD (see |WORD|)		*diW*
	"daW"	delete a WORD (see |WORD|)		*daW*
	"dgn"   delete the next search pattern match    *dgn*
	"dd"	delete one line				|dd|
	"dis"	delete inner sentence			*dis*
	"das"	delete a sentence			*das*
	"dib"	delete inner '(' ')' block		*dib*
	"dab"	delete a '(' ')' block			*dab*
	"dip"	delete inner paragraph			*dip*
	"dap"	delete a paragraph			*dap*
	"diB"	delete inner '{' '}' block		*diB*
	"daB"	delete a '{' '}' block			*daB*

    a]						*v_a]* *v_a[* *a]* *a[*
    i]						*v_i]* *v_i[* *i]* *i[*
    a)							*v_a)* *a)* *a(*
    a>						*v_a>* *v_a<* *a>* *a<*
    a}							*v_a}* *a}* *a{*
    a"							*v_aquote* *aquote*
    a'							*v_a'* *a'*
    a`							*v_a`* *a`*

	this is some example text. ~
		       daw

	this is some text. ~
    cis
    cas
```
- enable and disable mouse
```
set mouse=a
set mouse=
```
<<<<<<< Updated upstream
- Record and playback commands
1. The "q{register}" command starts recording keystrokes into the register
   named {register}.  The register name must be between a and z.
2. Type your commands.
3. To finish recording, press q (without any extra character).
- substitude
	:[range]substitute/from/to/[flags]
- The global command
	:[range]global/{pattern}/{command}
-  Using an external program
    !{motion}{program}
	
!5Gsort<Enter>
    =======
# unzip
```
unzip -d /home/sunny myfile.zip
unzip FIFO_spiDemo.zip  -d Demo_ori
```
# openssl
- options

```
-s 
```
openssl verify -CAfile Intermediate.pem dtu.pem                                                                             
openssl verify -CAfile RootCA.pem Intermediate.pem                                                                          
openssl verify -CAfile RootCA.pem -untrusted Intermediate.pem dtu.pem                                                       
openssl verify -verbose -CAfile <(cat RootCA.pem Intermediate.pem) dtu.pem                                                  
openssl verify -verbose -CAfile RootCA.pem -untrusted Intermediate.pem dtu.pem                                              
openssl verify -no-CAfile -no-CApath -partial_chain -trusted Intermediate.pem dtu.pem 
openssl x509 -inform pem -in RootCA.pem -noout -text
openssl x509 -inform pem -in Intermediate.pem -noout -text
openssl x509 -inform pem -in dtu.pem -noout -text
openssl rsa -in dtu.key -pubout > dtukey.pub
openssl rsa -in dtu.key -text
 echo 'Hi Alice! Please bring malacpörkölt for dinner!' | openssl rsautl -encrypt -pubin -inkey dtukey.pub >message.encrypted
openssl rsautl -decrypt -inkey dtu.key -in message.encrypted -out message.decrypted
openssl req -in csr_file -noout -text
openssl req -new -key dtukey.pub -days 3650 -out csr_using_pub -subj "/C=CN/ST=GuangZhou/L=GuangZhou/O=Robustel/OU=Robustel/CN=1234567"
 openssl req -in csr_using_pri -noout -text
 openssl req -verbose -new -key dtukey.pub -days 3650 -out csr_using_pub -subj "/C=CN/ST=GuangZhou/L=GuangZhou/O=Robustel/OU=Robustel/CN=1234567"
 openssl x509 -in cert.pem  -text
 
 
 /app/eccdata # openssl s_server -key key.pem -cert simulate_cert  -cert_chain IoTOnlBootstrapFactCA.pem -accept 1080
 sudo openssl s_client -connect 192.168.0.1:1080 -cert simulate_cert -key key.pem -CAfile MergeCA.pem -tls1_2 -showcerts 

- test
```

```
# git

- Please, commit your changes or stash them before you can merge.  
Aborting  
```
git stash
git pull
git stash pop
git revert <commit>
git checkout branch
```
# library
倩妮
user:KQ002228
ps:25434X

# zip
1.zip命令
zip -r myfile.zip ./*
将当前目录下的所有文件和文件夹全部压缩成myfile.zip文件,－r表示递归压缩子目录下所有文件.

2.unzip命令
unzip -o -d /home/sunny myfile.zip
把myfile.zip文件解压到 /home/sunny/
-o:不提示的情况下覆盖文件；
-d:-d /home/sunny 指明将文件解压缩到/home/sunny目录下；

3.其他
zip -d myfile.zip smart.txt
删除压缩文件中smart.txt文件
zip -m myfile.zip ./rpm_info.txt
向压缩文件中myfile.zip中添加rpm_info.txt文件

# date: format
20210116_03h32h33s
date +%Y%m%d_%Hh%Mh%Ss

# syslogd
 file size is 1G, file num is 10                                                                                      
 syslogd -L  -O /mnt/usb/$log_name -s 2097151 -b 10                                                                     

# ros
rmsg event_ems_device action get_various_acquisition   
sdk ems_manager start
sdk ems_manager stop
sdk ems_manager restart
# make
- print log to file and output
make package/wolfssl/clean && make package/wolfssl/install 2>&1 | tee out6

/usr/bin/create -hp 81800000  -ecc nistp256 -bl -kt f -kt p -opr eccpriv.bin -opu eccpub.bin -pwdp J0wPxvsH -pwdk n6CvRlMK -if test_ecc
/usr/bin/load -hp 81800000 -ipr eccpriv.bin -ipu eccpub.bin -pwdp J0wPxvsH
# makefile

- condition and test directory exist

```
APP_DIR_EXIST:=$(shell test -d $(APPLICATION_DIR)/$(PKG_NAME)q 1>&2 2> /dev/null; echo $$?)

ifeq ($(APP_DIR_EXIST),0)
    PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(PKG_VERSION)
else
    PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)
    PKG_SOURCE:=$(PKG_NAME).tar.gz
endif

```
# tar

```
解压 tar zxvf 文件名.tar.gz
解压 tar zxvf 文件名.tar.gz -C newfolder
压缩 tar zcvf 文件名.tar.gz 待压缩的文件名
```
tar –xvf file.tar //解压 tar包
tar -xzvf file.tar.gz //解压tar.gz
tar -xjvf file.tar.bz2   //解压 tar.bz2
tar –xZvf file.tar.Z   //解压tar.Z
unrar e file.rar //解压rar
unzip file.zip //解压zip

# raspberry
- ssh

ssh pi@192.168.1.111
ps: 1

# pkgconfig
 pkg-config --list-all 命令查看 package
$ find / -name pkgconfig
/usr/share/pkgconfig
/usr/local/lib/pkgconfig
/usr/lib/pkgconfig
/usr/lib/arm-linux-gnueabihf/pkgconfig

export PKG_CONFIG_PATH= /usr/lib/arm-linux-gnueabihf/pkgconfig

# find
将stdout 与stderr 分别存到不同的文件夹中：
find /home -name .bashrc > list_right 2> list_error
将错误的数据 丢弃，屏幕上显示正确的数据：
find /home -name .bashrc > list_right 2> /dev/null
将命令的数据全部写入list文件：
find /home -name .bashrc > list 2>&1

# find package
linux下查找库文件所在位置
ldconfig -p | grep libcrypto

# tpm2
- start server

sudo systemctl daemon-reload
sudo systemctl start tpm-server.service
sudo service tpm-server status

sudo systemctl daemon-reload
sudo systemctl start tpm2-abrmd.service
sudo service tpm2-abrmd status

- configure pkcs11
export TPM2_PKCS11_STORE='/opt/tpm2-pkcs11'
alias tpm2pkcs11-tool="pkcs11-tool --module /usr/local/lib/libtpm2_pkcs11.so.0.0.0"
alias tpm2ssl='OPENSSL_CONF=/home/pi/tpm/tpm2-pkcs11.openssl.sample.conf openssl'

# systemctl
https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units
sudo systemctl start application.service
sudo systemctl start application
sudo systemctl stop application.service
sudo systemctl restart application.service
sudo systemctl reload application.service
sudo systemctl reload-or-restart application.service
sudo systemctl enable application.service
sudo systemctl disable application.service
systemctl status application.service:w

# pkg_config
https://www.fujieace.com/kali-linux/pkg_config_path.html
https://blog.csdn.net/lsg9012/article/details/106117895

# if xx has been installed 
dpkg -l | grep xx

# create user
[root@ptr228 ~]# adduser tmp_3452
[root@ptr228 ~]# passwd tmp_3452

# gpg
https://linux.101hacks.com/unix/gpg-command-examples/
https://www.ruanyifeng.com/blog/2013/07/gpg.html

- help
  	gpg --help
- delete key ring
  	gpg --delete-keys yangmeng_1986@126.com  Aleksandr.Tserepov-Savolainen@KONE.complement
- generate key
  	gpg --gen-key
- how to generator a better chance to gain enough entropy 
	  in another terminal run cmd:
	  find / > /dev/null
- show pubkey ring 
	   gpg --list-keys
- show private key ring
	   gpg --list-secret-keys
- export binary public key
   gpg --export hui > wanghui-pub.gpg
   file wanghui-pub.gpg 
- export ascii public key
   gpg --armor --export hui  > hui-pub-asc.gpg
- import others public key 
	gpg --import hui-pub-asc.gpg 

 	gpg --list-key
- encrypt msg using others public key 

 	gpg --recipient hui --encrypt msg 
 		or
 	gpg --local-user meng --recipient hui --armor --sign --encrypt msg4
- decrypt msg 
	gpg --decrypt msg.gpg 
- sign
	gpg --sign msg
- verify sign
	gpg --import public key
    gpg --verify msg3.gpg 
- decrypt and verify sign
	gpg --verbose --decrypt msg4.asc
- detach sign and file
   分离签名的好处：签名及签名消息分开存储及传送;
   分离签名可以被用于对于一个合法文档进行多方签名。每个人的签名彼此独立，并只与该文档相关,否则签名必须嵌套；
   gpg --detach-sign msg5
- verify detach sign and file
   gpg --verify msg5.sig  msg5

# tpm2-tools
from tpm2-tools-3.2.2-RC0/man:
  tpm2_startup -V
  tpm2_startup -V -c
  tpm2_getcap  -h
  tpm2_getcap --capability="properties-fixed"
  tpm2_getcap --capability="ecc-curves" -V
  tpm2_getcap --capability="handles-transient" -V
  tpm2_getcap --capability="handles-persistent" -V
  tpm2_getcap --capability="handles-permanent" -V
  tpm2_getcap --capability="algorithms" -V
  tpm2_getrandom -o random.out 20
  tpm2_getrandom  8

 #tpm2-pkcs11
 ##
 tpm2_ptool.py init --path=~/tmp
 tpm2_ptool.py addtoken --pid=1 --sopin=mysopin --userpin=myuserpin --label=label --path ~/tmp

 tpm2pkcs11-tool  --init-token  --label "teste_label" --so-pin "mysopin"
 tpm2pkcs11-tool  --init-token --label my_token

 ## engine
alias tpm2ssl='OPENSSL_CONF=/app/test_pkcs11_engine/tpm2-pkcs11.openssl.sample.conf'
alias tpm2pkcs11-tool='pkcs11-tool --module /usr/lib/libtpm2_pkcs11.so'



pkcs11-tool --module /usr/lib/libtpm2_pkcs11.so --slot 1 --login -O
tpm2pkcs11-tool --label="my-ecc-keypair" --login --keypairgen --usage-sign --key-type EC:prime256v1

# add patch
https://blog.csdn.net/dl0914791011/article/details/17299103
diff -up linux-2.6.28.8/net/sunrpc/svc.orig.c linux-2.6.28.8/net/sunrpc/svc.c
---在根目录中比较
# iptables
/sbin/iptables -I INPUT -j ACCEPT
/sbin/iptables -I OUTPUT -j ACCEPT
# curl
curl  http://192.168.0.11:8080  -o test -k
curl http://192.168.0.11:8080  --connect-timeout 10 --user  %s -o %s -fk
curl -H "Content-Type: application/json" -d '{"csr":"123","region":"gl","environment":"qa"}'  --connect-timeout 15  http://192.168.0.11:8080/csr

curl -H "Content-Type: application/json" -d '{"csr":"'"$CSR"'","region":"gl","environment":"qa"}'  --connect-timeout 15   http://192.168.0.11:8080/csr

# ebook
https://itbook.store/
# notepad++
- 正则查找不包含某些字符串的行
    ^((?!不想包含的字符串).)*$

 CERT=$(echo "$CERT" | sed 's/\\n/\n/g')

# ctags
ctags --exclude="build_dir/target-eg901x/curl-7.67.0" -R

#pkcs11-tool

reference target-eg901x/opensc-0.20.0/tests/test-pkcs11-tool-sign-verify.sh

- export public key
 pkcs11-tool --module /usr/lib/opencryptoki/libopencryptoki.so --slot=1 --read-object --type pubkey --id 01 -o rsa01pub.key
- change to pem format
 openssl ec -pubin -inform DER -in rsa01pub.key -outform PEM -out rsa01pub.pem
 
- sign
openssl dgst -binary -sha256 msg > data.hash
pkcs11-tool --module /usr/lib/opencryptoki/libopencryptoki.so --slot=1 --id 01 -s -p e38b193a -m ECDSA --input-file data.hash --output-file data.sig -v

- verify
pkcs11-tool --module /usr/lib/opencryptoki/libopencryptoki.so --slot=1 --id 01 --verify -m ECDSA --input-file data.hash --signature-file data.sig -v

- shared secret
openssl ecparam -name prime256v1 -genkey -noout -outform DER -out ggcpu_pri.der
openssl ec  -inform DER -in ggcpu_pri.der -pubout -outform DER -out ggcpu_pub.der

pkcs11-tool --module /usr/lib/opencryptoki/libopencryptoki.so  --slot 1  --id 01 --pin e38b193a  --derive --input-file pubkey.der -m ECDH1-DERIVE --output-file shared_secret
