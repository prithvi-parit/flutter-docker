#!/usr/bin/python3
import subprocess
import cgi
print("content-type:text/html")
print("Access-Control-Allow-Origin:*")
print()

mydata=cgi.FieldStorage()
o1=mydata.getvalue("x")
cmd="sudo {}".format(o1)
o=subprocess.getoutput(cmd)

print(o)
