# vm-base-boxes
Vagrant Base Boxes for amd64 (x86_64) Hosts

This repository provides the Packer files for building Vagrant base boxes for AMD64 (x86_64) hosts.

The pre-built boxes can be found on [Vagrant Cloud](https://app.vagrantup.com/ryanchapman)

🚨 These should not be used for production workloads - use them at your own risk! 🚨

These are based on the work of [Adam Hartley](https://github.com/BytesGuy/arm-base-boxes).  He did 99% of the work; I just adapted the scripts to build for Intel instead of ARM.

## Currently Supported Boxes

| Distro | Version | Provider | Source | Box |
| ------ | ------- | -------- | ------ | --- |
| Ubuntu Server | 22.04.4 (Jammy Jellyfish) | VMWare Fusion | [Source](ubuntu-server-22.04/) | [ryanchapman/ubuntu-server-22.04](https://app.vagrantup.com/ryanchapman/boxes/ubuntu-server-22.04) |

## In-Progress / Planned

| Distro | Version | Provider | Source |
| ------ | ------- | -------- | ------ |

## Usage Instructions

TODO

## Building Instructions

The VM images are built with Packer and VMWare Fusion. Each subdirectory in this repo contains all the files needed to build the base box. The easiest way of building the box is to run the `buildbox.sh` command. This will start Packer and build the image, then compact the image into a box and print the checksum.
