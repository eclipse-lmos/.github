#!/bin/bash
#
set -e -o pipefail

repo="$2"
releaseVersion="$1"
sed "s/^version[[:blank:]]*=.*$/version=$version/" "${repo}/gradle.properties"
git config --global user.email "cicd@ancf.ai"
git config --global user.name "CICD"
git -C "${repo}" commit -a -m "Release: ${releaseVersion}"
git -C "${repo}" tag -a "${releaseVersion}" -m "${releaseVersion}"
git -C "${repo}" push origin "${releaseVersion}"
