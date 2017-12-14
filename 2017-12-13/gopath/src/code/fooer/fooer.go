package main

import (
	"fmt"
)

// START OMIT
// interface Fooer
type Fooer interface {
	Foo() string
}

type myFoo struct {
	fooAbout string
}

// method of struct myFoo
func (f myFoo) Foo() string { return f.fooAbout }

// takes an interface
func doFoo(f Fooer) {
	fmt.Println(f.Foo())
}

func main() {
	f := myFoo{fooAbout: "nothing"}
	doFoo(&f)
}

// END OMIT
