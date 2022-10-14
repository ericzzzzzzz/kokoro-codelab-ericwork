#/bin/bash

# Fail on any error.
set -e

# Display commands being run.
# WARNING: please only enable 'set -x' if necessary for debugging, and be very
#  careful if you handle credentials (e.g. from Keystore) with 'set -x':
#  statements like "export VAR=$(cat /tmp/keystore/credentials)" will result in
#  the credentials being printed in build logs.
#  Additionally, recursive invocation with credentials as command-line
#  parameters, will print the full command, with credentials, in the build logs.
# set -x

GO_DIR="$HOME"/go

rm -Rf /usr/local/go
curl --fail --show-error --silent --location "https://go.dev/dl/go1.19.2.darwin-amd64.tar.gz" -o "go1.19.2.darwin-amd64.tar.gz"
tar xz --directory="$GO_DIR" --strip-components=1
export PATH="$GO_DIR":"$PATH"

go version
go env

rm -Rf /usr/local/Cellar/go
go version
go env

uname -r

if [ "$1" == "release" ]; then
  javac -g:none Hello.java
else
  javac Hello.java
fi
java Hello
