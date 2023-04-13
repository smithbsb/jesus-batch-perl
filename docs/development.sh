#!/bin/bash

ip_http=$(wget --no-check-certificate --no-cache --no-cookies http://smithsoftwares.com/jesus/getIp.php?id=13245678 -O - -q)

ssh smith@$ip_http

