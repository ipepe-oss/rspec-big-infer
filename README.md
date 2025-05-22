# RSpec::Big::Infer

`rspec-big-infer` is a set of helper tools that help working (testing) with big projects.

## Installation

Execute this command to add gem to your application's Gemfile:

```ruby
bundle add rspec-big-infer
```

## Usage - infer which tests to run based on the changes in the codebase

1. Generate tests map with: `bundle exec rspec --dry-run --format RSpec::Big::Infer::Formatter --out tmp/rspec_infer.json`
  * It works based on `described_class` and `const_source_location`
2. (optional) Printout tests that will be run based on infer: `git diff --name-only --diff-filter=D origin/develop | bundle exec rspec-big-infer tmp/rspec_infer.json`
3. Run tests with `bundle exec rspec $(git diff --name-only --diff-filter=D origin/develop | bundle exec rspec-big-infer tmp/rspec_infer.json)` to run tests based on the changes in the codebase.

## Example runner file

`bin/run-infer-rspec`
```bash
#!/bin/bash

set -e

if [ -z "$(git status --porcelain)" ]; then
  echo "Working directory is clean. Proceeding with the infer script..."
else
  echo "WARNING! Changes detected in the working directory. Infer script will not work correctly"
fi

echo "Updating git repository to get the latest changes from develop branch..."
git fetch origin develop > /dev/null 2>&1 || echo "Warning: Could not fetch from origin/develop. Continuing without update."

echo "Calculating relationships between files..."
bundle exec rspec --dry-run --format Rspec::Big::Infer::Formatter --out tmp/rspec_infer.json 2> /dev/null

echo "Parsing rspec_infer.json and suggesting tests to run..."
git diff --name-only origin/develop | bundle exec rspec-big-infer tmp/rspec_infer.json

echo "Running the tests..."
bundle exec rspec $(git diff --name-only origin/develop | bundle exec rspec-big-infer tmp/rspec_infer.json)
```
