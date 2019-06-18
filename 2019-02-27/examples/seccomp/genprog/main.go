package main // import "github.com/bboozzoo/talks/cehug-lodz/ebpf/examples/seccomp/genprog"

import (
	"flag"
	"log"
	"os"

	"github.com/seccomp/libseccomp-golang"
)

// to build:
// - go 1.11+
// - run: go build

var pfcPath string

func main() {
	flag.StringVar(&pfcPath, "pfc", "", "output PFC to this file")
	flag.Parse()

	var pfcFile *os.File
	if pfcPath != "" {
		out, err := os.OpenFile(pfcPath, os.O_CREATE|os.O_WRONLY, 0644)
		if err != nil {
			log.Fatalf("failed to open PFC output file: %v", err)
		}
		pfcFile = out
		defer out.Close()
	}

	// default action - ALLOW
	filter, err := seccomp.NewFilter(seccomp.ActAllow)
	if err != nil {
		log.Fatalf("failed to create new filter: %v", err)
	}
	// grab syscall name for current audit architecture
	sysNum, err := seccomp.GetSyscallFromName("read")
	if err != nil {
		log.Fatalf("failed to determine syscall number: %v", err)
	}
	// if $0 == 3
	cond, err := seccomp.MakeCondition(0, seccomp.CompareEqual, 3)
	if err != nil {
		log.Fatalf("failed to make new condition: %v", err)
	}
	// read(3, ..) = -EPERM
	err = filter.AddRuleConditional(sysNum, seccomp.ActErrno.SetReturnCode(1),
		[]seccomp.ScmpCondition{cond})
	if err != nil {
		log.Fatalf("failed to add conditional: %v", err)
	}
	// export as compiled BPF
	if err := filter.ExportBPF(os.Stdout); err != nil {
		log.Fatalf("failed to export to BPF: %v", err)
	}
	// export as pseudo-code
	if pfcFile != nil {
		if err := filter.ExportPFC(pfcFile); err != nil {
			log.Fatalf("failed to export to PFC: %v", err)
		}
	}
}
