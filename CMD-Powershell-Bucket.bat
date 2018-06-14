###########################################################################################
#
# The default redirect for powershell seems to be Unicode, which confuses a lot of CSV 
# parsers. So here's one of likely many ways to redirect to a file in ASCII. 
 echo "hello" | Out-File -Encoding ASCII "C:\Users\kroppian\Desktop\deleteme.txt"
