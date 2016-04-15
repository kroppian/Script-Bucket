# I've always skirted around awk, but this is my first time that I've really appreciated its power.
# I use this command pattern a lot to parse through an `ls -l` output. 

ls -ld $(find /path/to/files/) | grep 'drwxrwsr-x' | sed 's/\s\s*/ /g' | cut -d' ' -f9 

# I grep out the files that I want, and then I just grab the file name out of the ouput with cut. 
# However, an extra step is required to squeeze the whitespace down into one single space so cut 
# can properly split the string by ' '. 

# However, with awk, you can replace the last three commands with a single command:

ls -ld $(find /path/to/files/) | awk '/drwxrwsr-x/ {print $9}'

# Pretty neat, right?

