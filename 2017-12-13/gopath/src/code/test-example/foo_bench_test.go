package testexample

import "testing"

func BenchmarkFoo(b *testing.B) {
	for i := 0; i < b.N; i++ {
		Foo("err-out")
	}
}
