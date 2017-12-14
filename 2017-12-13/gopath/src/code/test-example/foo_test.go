package testexample

import "testing"

func TestFoo(t *testing.T) {
	if err := Foo("other"); err != nil {
		t.Fail()
	}
	if err := Foo("err-out"); err == nil || err.Error() != "error" {
		t.Fail()
	}
}
