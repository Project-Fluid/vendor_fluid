package generator

import (
	"fmt"

	"android/soong/android"
)

func magmaExpandVariables(ctx android.ModuleContext, in string) string {
	magmaVars := ctx.Config().VendorConfig("magmaVarsPlugin")

	out, err := android.Expand(in, func(name string) (string, error) {
		if magmaVars.IsSet(name) {
			return magmaVars.String(name), nil
		}
		// This variable is not for us, restore what the original
		// variable string will have looked like for an Expand
		// that comes later.
		return fmt.Sprintf("$(%s)", name), nil
	})

	if err != nil {
		ctx.PropertyErrorf("%s: %s", in, err.Error())
		return ""
	}

	return out
}
