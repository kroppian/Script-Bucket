# I needed to check which of 10 machines is running a certain script. So needed to ssh to 
# each machine to see if they have the logs belonging to this script. The machines are in 
# the format: 
# 
#   machine02.prod.org
#   machine03.prod.org
#   ...
#   machine10.prod.org
#
#   And there's one weird one off machine called weirdmachine01.prod.org
#
#########################################################################################

# For two through ten 
(("2".."10").to_a.map { |n|
  # build machine names with padded two digit values for each machine, along with the one 
  # off machine
  "machine" + ("%02d" % n) + ".prod.org"}.unshift "weirdmachine01.prod.org").each { |machine| 
    system("ssh myuser@" + machine + ' "ls -l /path/to/my/logs/myprocess*"')}

# 
# Given a directory containing ONLY zip files, decompress each zip into a directory that 
# has the same name as the original zip file. Then delete the original zip file.
#
# For example:
#
#   ./fileOne.zip
#   ./fileTwo.zip
#   ./fileThree.zip
#
# Would turn into 
#   ./fileOne/
#   ./fileTwo/
#   ./fileThree/
#
#########################################################################################

`ls -1`.split(/\n/).each do |a|
  system "mkdir #{a.sub(/.zip/,"")}; unzip #{a} -d #{a.sub(/.zip/,"")}; rm -f #{a}" 
end
