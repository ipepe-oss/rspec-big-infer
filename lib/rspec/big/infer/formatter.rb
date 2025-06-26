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
          return if already_processed?(example.file_path)

          already_processed!(example.file_path)

          {
            test_file_path: relative_path(example.file_path),
            described_class_defined_source_location: source_location(example.example_group.described_class),
          }
        end

        def source_location(klass)
          return unless klass.is_a?(Class)

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

        def already_processed!(test_file_path)
          # Prevents the formatter from processing the same file multiple times
          @already_processed ||= Set.new
          return if @already_processed.include?(test_file_path)

          @already_processed.add(test_file_path)
        end

        def already_processed?(test_file_path)
          @already_processed ||= Set.new
          @already_processed.include?(test_file_path)
        end
      end
    end
  end
end
