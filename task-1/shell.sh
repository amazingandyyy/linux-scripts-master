ls /etc > file1.txt
ls /bin > file2.txt
cat file1.txt file2.txt | tee unsorted.txt | sort -r > reversed.txt
