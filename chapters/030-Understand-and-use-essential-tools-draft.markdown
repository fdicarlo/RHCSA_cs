# Understand and use essential tools

## Access a shell prompt and issue commands with correct syntax
  
This is first requirement should stop anyone who may not know, or may have never used a shell prompt from attempting the test. If you can open your terminal, navigate and type commands then you have accomplished this. If not, then you should check out the basics and start there.

Alternatively

**Ctrl+Alt+F1** to **F6** are the virtual consoles provided by the getty/agetty programs. Ctrl+Alt+F7 is the console where your X server is running. The GUI (Gnome/KDE or any other) runs over X. So to get back into your GUI window manager: type: 
**Ctrl+Alt+F7**.

## Use input-output redirection (>, >>, |, 2>, etc.)
  
Input output redirection is one of the base skills you will need as a sysadmin. On the exam you will have to be able to redirect data from one command into another, and/or into a file.

Some examples:

> $ echo "this is input" > file.txt

or

> $ cat /var/log/messages | less

You can easily redirect input / output to any file other than the screen. This is achieved in Linux using input and output redirection symbols:

* ">" Output redirection
* "<" Input redirection

Using a combination of these symbols and the standard file descriptors you can achieve complex redirection tasks quite easily.

* ">" overwright
* "<" send into a command or file
* ">>" append
* "<<" append into a command or file
* "|" funnel into
* "2>" redirect errors
* "2>&1" redirect errors to std out
  
## Use grep and regular expressions to analyze text

RHCSA requirements state that you must know how to use grep to analyze text. This is actually going to be pretty necessary to do many administration tasks on a daily basis.

Grep returns any lines that have characters, words, or expressions that match your query.

Basic usage examples of this include:

* Find "Permission Denied" entries in a log file

> $ grep -r "Permission Denied" /path/to/logfile/

* Find "Permission Denied" entries in a log file by using output redirection

> $ cat /path/to/file/ | grep "Permission Denied"

## Access remote systems using ssh and VNC.
## Log in and switch users in multiuser runlevels.
## Archive, compress, unpack, and uncompress files using tar, star, gzip, and bzip2.
## Create and edit text files.
## Create, delete, copy, and move files and directories.
## Create hard and soft links.
## List, set, and change standard ugo/rwx permissions.
## Locate, read, and use system documentation including man, info, and files in /usr/share/doc.

\newpage
\pagebreak
