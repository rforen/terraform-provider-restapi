#!/bin/bash -e

cd $(dirname $0)

export PATH="$PATH:$HOME/go/bin"

export GOOS=""
export GOARCH=""

[[ -z "${GOPATH}" ]] && export GOPATH=$HOME/go

cd ../restapi

echo "Running tests..."
# Use -v for verbose output and add stack traces with
# either GOTRACEBACK=all or GOTRACEBACK=system environment variable
export GOTRACEBACK=all

# The -v flag enables verbose output
# You can also add -test.v if you're running specific tests
if ! go test -v -count=1  "$@";then
  echo "Failed testing. Aborting."
  exit 1
fi

#echo "Vetting result..."
#go vet ./...

#echo "Checking for linting..."
#golint -set_exit_status ./...