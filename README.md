# Ggigasync
Rsync-based Perl script to incrementally mirror enormous directory trees.

Written originally by Matthew R. McEachen:
https://matthew.mceachen.us/geek/gigasync/gigasync.pod.html

Changes
-------
The original script built a list of files starting from the root down to the source directory. And when
the files were copied to the target directory, the same exact tree was recreated on the target server. This
was changed so that relative directories are only created as the root becomes the source directory itself.

In addition, the 2nd parameter to 'gigasync' used to be a hostname. In this version, however, it's a destination
directory (including any needed hostnames to be used with ssh) and is passed to rsync as-is.

Additions
---------
I also supplied a short shell script to facilitate passing rsync options using the evironment variable
RSYNC_OPTIONS.
