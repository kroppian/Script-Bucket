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
# Bracket Expansion
#
# I'm a bit embarrassed to admit that I never knew you could do this:  

echo file.{jpeg,png,gif,bmp}
# => file.jpeg file.png file.gif file.bmp

# HOW COOL IS THAT??

echo file{1..3}.jpeg
# => file1.jpeg file2.jpeg file3.jpeg


