###########################################################################################
#
# I've always skirted around awk, but this is my first time that I've really appreciated 
# its power. I use this command pattern a lot to parse through an `ls -l` output. 

ls -ld $(find /path/to/files/) | grep 'drwxrwsr-x' | sed 's/\s\s*/ /g' | cut -d' ' -f9 

# I grep out the files that I want, and then I just grab the file name out of the ouput 
# with cut. However, an extra step is required to squeeze the whitespace down into one 
# single space so cut can properly split the string by ' '. 

# However, with awk, you can replace the last three commands with a single command:

ls -ld $(find /path/to/files/) | awk '/drwxrwsr-x/ {print $9}'

# Pretty neat, right?

###########################################################################################
#
# Here's another awk one-liner to list every file that is within size constraints. The fact
# that I could skip writing a full bash script to make conditionals is a pleasure. 

ls -l  /path/to/files/* | awk '{if ($5 < 1000000 && $5 != 0) print $9}'

###########################################################################################
#
# Bracket Expansion
#
# I'm a bit embarrassed to admit that I never knew you could do this:  

echo file.{jpeg,png,gif,bmp}
# => file.jpeg file.png file.gif file.bmp

# HOW COOL IS THAT??

echo file{1..3}.jpeg
# => file1.jpeg file2.jpeg file3.jpeg

###########################################################################################
#
# One lined for loop
#
# I've written multilined for loops in bash about a billion times, but I can never remember
# where to put the semicolons in a one line for loop. 
#
# This particular example was used to delete all the files owned by me in a directory with 
# too many files to pass into one command (argument list too long error).
# 
for file in  $(ls -l | awk '/kroppi/ {print $9}' ); do rm -v $file; done

