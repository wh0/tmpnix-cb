#!/bin/sh -eux
gpg -d ~/secrets.tar.gz.gpg | tar -xz
