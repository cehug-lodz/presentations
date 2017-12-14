// +build withtestkeys
/*
 * Copyright (C) 2016 Canonical Ltd
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * <edited>...
 */

package sysdb

import "github.com/snapcore/snapd/asserts/systestkeys"

// init will inject the test trusted assertions when this module build tag
// "withtestkeys" is defined.
func init() {
	InjectTrusted(systestkeys.Trusted)
}
