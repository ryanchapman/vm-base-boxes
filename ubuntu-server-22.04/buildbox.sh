#!/bin/bash

packer init vmware-jammy.pkr.hcl
packer build -force vmware-jammy.pkr.hcl


cp metadata.json output/metadata.json
cd output
tar cvzf vmware-jammy.box ./*
md5 vmware-jammy.box
rm -f *.v* *.nvram 
