# Go in embedded

Go `present` tool is needed to view the presentation.


## Getting the `present` tool

Run:

```
$ go get golang.org/x/tools/cmd/present
```

Unless you have set up $GOPATH yourself, the command above will assume a user
default one which is `GOPATH=~/go`. Once `go get` completes, `present` tool
shall be available under `$GOPATH/present`.

## Opening the presentation

While in this directory run the `present` tool like this:

```
# ~/go/bin/present if you haven't set up GOPATH yourself

$ $GOPATH/present 
2017/12/14 12:22:38 Open your web browser and visit http://127.0.0.1:3999
```

Follow the instructions to open the URL. Use arrow keys to navigate the slides.

## Running code samples

The samples are organized in their own GOPATH under `$PWD/gopath`. To set it up
for use with `go` build commands, source `./setup-gopath` in your shell.
Example:

```
$ source ./setup-gopath
$ go code/fooer
```

**NOTE**: not all samples can be built, some are just random pieces of code
extracted from external repositories.
