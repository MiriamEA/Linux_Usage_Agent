#!/bin/bash

function getHostname {
	hostname=$(hostname -f)
}

function getCPU { 
	cpu=$(lscpu | egrep '^CPU\(s\)' | awk '{print $2}')
}

getHostname
echo $hostname
getCPU
echo $cpu
