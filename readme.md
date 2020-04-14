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

## 
