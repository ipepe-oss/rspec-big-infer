# frozen_string_literal: true

require "rspec/core"
require_relative "infer/version"
require_relative "infer/formatter"

module RSpec
  module Big
    module Infer
      class Error < StandardError; end
      # Provides helper tools for inferring which specs to run.
    end
  end
end
