#!/bin/sh
set -e
echo "Activating feature 'fsd42-go'"
VERSION=${VERSION:-1.23}
echo "Installing Golang version $VERSION"
curl -sSL https://golang.org/dl/go$VERSION.linux-amd64.tar.gz | tar -C /usr/local -xz
echo "export PATH=\$PATH:/usr/local/go/bin" >> /etc/profile
