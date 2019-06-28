#!/usr/bin/env bash

FILENAME="/etc/netplan/50-cloud-init.yaml"
INTERFACE_NAME="ens4"

if grep -q ${INTERFACE_NAME} ${FILENAME}
then
  echo "Interface ${INTERFACE_NAME} already configured in netplan."
else
  sudo echo "            nameservers:
                  addresses: [8.8.4.4, 8.8.8.8]
        ens4:
            dhcp4: true
            match:
                macaddress: fa:16:3e:dc:d2:f6
  " >> ${FILENAME}
  sudo netplan --debug apply
fi
#set-name: ens4
