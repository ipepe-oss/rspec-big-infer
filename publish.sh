#!/bin/bash

rm -f rspec-big-infer-*.gem
gem build rspec-big-infer.gemspec
gem push rspec-big-infer-*.gem
