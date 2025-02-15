#!/bin/bash
HOSTNET=`hostname -A`

#check if you are in a machine inside the CERN network
if [[ "$HOSTNET" =~ "cern.ch" ]];then
    echo "It looks like you are inside CERN ..."
    echo "Signing into a cmsusr machine ..."
    echo "ssh -Y -D 10880 ecarrera@cmsusr ... "
    ssh -Y -D 10880 ecarrera@cmsusr
    exit 0
#check if you are in a machine outside the CERN network
else 
    echo "Looks like you are outside the CERN network ..."
    echo "Tunneling through lxplus to a cmsusr machine ..."
    echo 'ssh -Y -t ecarrera@lxplus.cern.ch -L 10880:localhost:8089 "ssh -Y -D 8089 ecarrera@cmsusr.cern.ch"'
    ssh -Y -t ecarrera@lxplus.cern.ch -L 10880:localhost:8089 "ssh -Y -D 8089 ecarrera@cmsusr.cern.ch"
    exit 0
fi
    

