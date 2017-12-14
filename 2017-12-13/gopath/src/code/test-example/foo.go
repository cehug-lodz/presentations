package testexample

import "errors"

func Foo(in string) error {
	if in == "err-out" {
		return errors.New("error")
	}
	return nil
}
