package main

import "fmt"

func main() {
	type foo struct {
		x int
		y uint
		t string // always utf-8
	}

	manyFoo := []foo{
		{1, 2, "foo"},
		{3, 5, "bar"},
	}

	// i := 0; i < len(manyFoo); i++
	for i, foo := range manyFoo {
		fmt.Printf("%v %v\n", i, foo)
	}
}
