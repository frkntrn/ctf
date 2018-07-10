#!/bin/bash
tshark -r pcap.pcap ip.src == 54.175.216.124 | rev | cut -d" " -f3 | rev | cut -d"." -f1 | xxd -r -p | grep -aEo "sun{.*}" | uniq
