# Boss

## Introduction

Boss is a small command line tool to track what programs you actively use in
GNU/Linux, and how long you use them. By being aware of your usage trends, it
can help you track and prevent wasteful activities.

## Installing and running

Check-out the git repository. Install the "xprintidle" package. Run the
"boss.sh" shell script to start Boss. 

Boss records the window title every five seconds. (change the interval and
other parameters in config.sh). The files are stored by default in
`~/.cache/boss/output`. If the keyboard, and mouse are idle for more than 10
seconds, no data will be recorded.

**You need to create a `rules` file to be able to use boss**

## The rules file

There are many programs that change the window title. It can include the
filename, Web page title, etc. This prevents you from getting a meaningful
overview of which programs you're using. A simple solution is to search for
a small string (ex. Firefox, Chromium, iceweasel, etc)

Boss reads a file called `rules` in the root directory of the source. Each line
is a search term. In the `tagged` output file, only the search term is printed,
thus preventing the complete window title from interfering with the analysis.

An example rules file is as follows. Please note that **Comments are not
supported in the rules file**.

```
Firefox
Chromium
Emacs
GVIM
user@localhost
VLC
```

and an output might look like

```
06/20/11 20:30:32 Firefox
06/20/11 20:30:32 Firefox
06/20/11 20:30:32 Emacs 
06/20/11 20:30:32 Emacs
06/20/11 20:30:32 Firefox
```

## Understanding the output

There are two files created in `~/.cache/boss/output/` by default. "tagged" and
"raw".
* "raw" is the file containing raw window titles and timestamps. You are
  encouraged to write your own scripts to get reports using this file.
* "tagged" is the file containing output based on the "rules" file.


## Running an analysis

Simply run the `analyze.sh` script from inside the boss directory. It should
print the amount of time recorded today and overall.

## Contact

Email me. a@DELETETHISninjagod.con

## License

MIT/X11
