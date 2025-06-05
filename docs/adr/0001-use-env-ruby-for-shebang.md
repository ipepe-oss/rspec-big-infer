# 1. Use `/usr/bin/env ruby` for shebang

Date: 2025-06-05

## Status
Accepted

## Context
The executable `exe/rspec-big-infer` previously used `#!/bin/env ruby` as its shebang.
Some systems do not provide `/bin/env`, but most provide `/usr/bin/env`.

## Decision
Update the shebang line in `exe/rspec-big-infer` to `#!/usr/bin/env ruby` to increase portability.

## Consequences
The script now uses the more common path for `env`, improving compatibility across environments.
