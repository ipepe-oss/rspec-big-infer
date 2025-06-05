# frozen_string_literal: true

require "spec_helper"
require "rspec/big/infer/formatter"
require "stringio"

RSpec.describe RSpec::Big::Infer::Formatter do
  describe "#relative_path" do
    let(:formatter) { described_class.new(StringIO.new) }

    it "removes leading ./ from relative paths" do
      expect(formatter.send(:relative_path, "./foo/bar.rb")).to eq("foo/bar.rb")
    end

    it "removes current directory from absolute paths" do
      absolute = File.join(Dir.pwd, "foo/bar.rb")
      expect(formatter.send(:relative_path, absolute)).to eq("foo/bar.rb")
    end
  end
end
