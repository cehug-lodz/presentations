// +build arm64 amd64 ppc64le s390x
/*
 * Copyright (C) 2017 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * <edited>...
 */
package sys

import "syscall"

const (
	_SYS_GETUID  = syscall.SYS_GETUID // 32bit syscall.SYS_GETEUID32
	_SYS_GETGID  = syscall.SYS_GETGID
	_SYS_GETEUID = syscall.SYS_GETEUID
	_SYS_GETEGID = syscall.SYS_GETEGID
)
