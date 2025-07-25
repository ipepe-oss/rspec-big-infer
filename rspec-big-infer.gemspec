# frozen_string_literal: true

require_relative "lib/rspec/big/infer/version"

Gem::Specification.new do |spec|
  spec.name          = "rspec-big-infer"
  spec.version       = RSpec::Big::Infer::VERSION
  spec.authors       = ["Patryk Ptasinski"]
  spec.email         = ["patryk@ipepe.pl"]

  spec.summary       = "Infer which RSpec test files to run based on currently changed files"
  spec.homepage      = "https://github.com/ipepe-oss/rspec-big-infer"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.1.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = ["rspec-big-infer"]
  spec.require_paths = ["lib"]
  spec.add_dependency "rspec-core", "~> 3"
  spec.add_development_dependency "rspec", "~> 3"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
