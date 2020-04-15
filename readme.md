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

## reading files

### cat - concatenate - tac

```shell
$ cat file[1-5].txt > all.txt
$ cat file[1-5].txt | tac > reversed-vertically.txt
$ cat file[1-5].txt | rev > reversed-line.txt
```

### less

```shell
$ less long.txt
$ cat long.txt | less
$ cat long.txt | head -n 5
$ cat long.txt | tail -n 2
```

## sort

```shell
$ sort rand.txt
$ sort rand.txt | tac
$ sort -r rand.txt > reversed.txt
$ sort -n rand-number.txt
$ sort -u rand-number-unique.txt
$ ls -l /private/etc | head -n 20 | sort -k 5n # sorted by column
$ ls -l /private/etc | head -n 20 | sort -k 5hr # sorted by column, human readible
$ ls -l /private/etc | head -n 20 | sort -k 6Mr # sorted by column, by month data
```

## grep

```shell
$ grep -c andy gadsby.txt
$ grep -v none gadsby.txt
$ grep -i gadsby gadsby.txt
```

## tarball ,compress

```shell
# make a tarball
$ tar -cvf ourarchive.tar hello/file[1-5] # c: archive v: verbose f: files
$ tar -tf ourarchive.tar # t: test file, f: files
# compression
$ gzip ourarchive.tar
$ gunzip ourarchive.tar # then tar -tf
$ bzip2 ourarchive.tar  # compress more
# or
$ zip ourthing.zip hello/file[1-5]
$ unzip ourthing.zip

# one step, tarball and compress
$ tar -cvzf ourarchive.tar.gz hello/file[1-5] # z: use gzip to compress files
$ tar -cvjf ourarchive.tar.bz2 hello/file[1-5] # j: use bzip2 to compress files

# one step, decompress and tarball
$ tar -xvzf ourarchive.tar.gz      # x: extract
$ tar -xvjf ourarchive.tar.bz2
```

## Create bash tool

```shell
#!/usr/bin/bash
# add shebang to the first line
# chmod +x ./file.sh
# mv hello.sh /bin/hello
# add PATH="$PATH:$HOME/bin" to .bashrc or .zshrc
```

## cron

[crontab.guru](https://crontab.guru/)

```shell
$ crontab -e
# edit the crontab file: 6 columns
m   h   dom   mon    dow   command
*   *   *     *      *      echo hello
*/15   *   *     *      *      echo every 15 minutes > ~/Desktop/every
11  23  10    DEC    SAT     echo hellooo
```
