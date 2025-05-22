# frozen_string_literal: true

require "rspec/core"
require "rspec/core/formatters/json_formatter"

module RSpec
  module Big
    module Infer
      class Formatter < RSpec::Core::Formatters::JsonFormatter
        ::RSpec::Core::Formatters.register self

        private

        def format_example(example)
          return unless example.example_group.described_class.is_a?(Class)

          {
            test_file_path: relative_path(example.file_path),
            described_class_defined_source_location: source_location(example.example_group.described_class),
          }
        end

        def source_location(klass)
          relative_path(klass.const_source_location(klass.name).first)
        end

        def relative_path(path)
          if path.start_with?('./')
            path.sub('./', '')
          elsif path.start_with?('/')
            path.sub(%r{^#{Dir.pwd}/}, '')
          else
            path
          end
        end
      end
    end
  end
end
