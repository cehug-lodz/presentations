package main

import "fmt"

func main() {
	// START OMIT
	type Foo struct {
		IntField    int
		StringField string
	}
	f := Foo{
		IntField:    3,
		StringField: "foo",
	}
	type Bar struct {
		Foo             // embeds Foo
		BarField string // adds a field
	}
	var b Bar = Bar{Foo: f, BarField: "bar"}
	type Zed struct {
		Bar                // embeds Bar
		StringField string // hides Foos's field
	}
	z := Zed{Bar: b, StringField: "zed"}
	fmt.Println(f.IntField, f.StringField)
	fmt.Println(b.IntField, b.StringField, b.BarField)
	fmt.Println(z.IntField, z.StringField, z.BarField, z.Foo.StringField)
	// END OMIT
}
