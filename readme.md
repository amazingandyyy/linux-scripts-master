# Master Unix Scripts

```shell
$ history
...
$ !10152 # num 10152 commands
$ !! # last one commands
$ echo $PATH
$ which echo
$ man which # check manual, from page 1
```

## Redirect data stream

```shell
# 0 is standard input
$ cat 1> output.txt # 1 is standard output, redirect standard output to a file
$ cat 1>> output.txt # appending to the file
# 2 is standard error
$ cat 1>> output.txt 2>>error.txt
# read input.txt adn output to hello.txt
$ cat 0< input.txt 1>hello.txt
$ tty
/dev/ttys001
$ cat 1>/dev/ttys002
```

## piping

```shell
$ date | cut -d " " -f 1
# tee is T pipe
$ date | tee fulldate.txt | cut -d " " -f 1 > today.txt
```

## xargs

will convert standard input to be arguments

```shell
$ date | xargs echo
$ date | xargs echo "hello"
$ ls *.txt | xargs rm
```

## alias

```shell
$ alias calmagic=`cal -A 1 -B 1`
```

## Common

```shell
ls
cd
mkdir
rm
```

## whildcard

```shell
$ ls *
$ ls Do*
$ ls *.txt
$ ls ??.txt # only match aa.txt bb.txt
$ ls [12345].txt # regex, either of 12345
$ ls [0-9][a-z].txt # regex, either of 0-9 and a-z e.g. 4f.txt
$ touch {a,b,c}{2011..2018}.txt
```

## find

```shell
$ find . -maxdepth 5 -type f|d -name "*.txt"
$ find -iname "*.TXT"
$ find / -type f -size +100k -size -5M | wc -l # 100k~5M
$ find / -type f -size -100k -o -size +5M | wc -l # 100k- or 5M+
$ sudo find / -type f -size +100k -size -5M -exec mv {} ./ttt \;
$ sudo find / -type f -size +100k -size -5M -ok mv {} ./ttt \; # interactive mode
```
