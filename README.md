# Ggigasync
Rsync-based Perl script to incrementally mirror enormous directory trees.

Written originally by Matthew R. McEachen:
https://matthew.mceachen.us/geek/gigasync/gigasync.pod.html

Changes
-------
The original script builds a list of files descending from the root down to the source directory. When
files are copied to target directory, the same exact tree is recreated on the target server. This is now
changed so that relative directories are only created in target directory (effectively, making the source
directory appear as the root.)

In addition, the 2nd parameter to 'gigasync' used to be a hostname. In this version, however, it's a destination
directory (including any needed hostnames to be used with ssh) and is passed to rsync as-is.

Additions
---------
I also supplied a short shell script to facilitate passing rsync options using the evironment variable
RSYNC_OPTIONS.
