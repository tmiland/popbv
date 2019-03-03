# Popular Bible Verse

A small shell script to print kingjamesbibleonline.org's Popular Bible Verse

## Installation

### Install dependencies

```bash
sudo apt-get install w3m && sudo apt-get install figlet
```

#### Download and execute the script:

```bash
$ wget https://github.com/tmiland/popbv/raw/master/popbv.sh
$ chmod +x popbv.sh
$ ./popbv.sh
```

#### Optionally

 ```bash
$ ln -s /path/to/popbv.sh /usr/bin/popbv
$ popbv
```

#### Or add it to motd

```bash
$ ln -s /path/to/popbv.sh /etc/update-motd.d/10-popbv
$ /usr/sbin/update-motd
```
***Requires the update-motd package***

`apt install update-motd`

## Screenshots
![screenshot](https://raw.githubusercontent.com/tmiland/popbv/master/popbv.png)
