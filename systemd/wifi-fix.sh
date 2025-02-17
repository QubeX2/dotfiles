#!/bin/bash
rmmod brcmfmac_wcc brcmfmac ; modprobe brcmfmac feature_disable=0x82000

