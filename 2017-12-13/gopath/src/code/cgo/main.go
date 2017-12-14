package main

// #cgo CFLAGS: -Wall -Wextra -Wno-unused
// #include <foo.h>
import "C"
import (
	"fmt"
	"time"
)

func main() {
	v := time.Now()
	fmt.Println("-- time:    ", v)
	fmt.Println("-- as Unix: ", v.Unix())
	C.foo(C.int(v.Unix()))
	fmt.Println("-- back in Go code")
}
