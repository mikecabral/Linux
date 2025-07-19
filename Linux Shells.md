##### **sh (Bourne Shell)** The sh shell was the earliest shell, being developed for UNIX back in the late 1970s. Although not widely used on Linux systems, it is still frequently used on UNIX systems.  

##### **bash (Bourne-Again Shell)** The bash shell is an improved version of the sh shell and is one of the most popular shells today. In fact, it’s the shell used by default on most Linux distributions. If you’re using the command-line interface on a Linux system, more than likely you’re using the bash shell.

##### **csh (C Shell)** The csh shell was originally developed for BSD UNIX. It uses a syntax that is very similar to C programming.  
**tsch** The tsch shell is an improved version of the C Shell. It is the default shell used on FreeBSD systems.

##### **zsh** (Z Shell) The Z Shell is an improved version of the bash shell.

```bash
echo $SHELL
```

##### **When a login shell is run, the **bash** **shell** program **searches** for **config** **files** in the following order:**
1.**~/.bash_profile**
2.**~/.bash_login**
3.**~/.profile**