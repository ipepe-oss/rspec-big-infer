# 0001 Add RSpec development dependency

Date: 2025-05-22

## Status
Accepted

## Context
RSpec is used for testing this gem, but it was not included in the Gemfile. Without it, running specs via Bundler fails.

## Decision
Add `gem "rspec", "~> 3"` under the `development` group in the Gemfile. Running `bundle install` will lock the dependency.

## Consequences
Developers can run `bundle exec rake spec` without globally installed RSpec. The gemspec remains unchanged.
