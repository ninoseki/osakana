# frozen_string_literal: true

RSpec.describe Osakana::Notifier do
  subject { Osakana::Notifier }

  describe ".notify" do
    it "should output N/A" do
      output = capture(:stdout) { subject.notify("test", [{ title: "foobar" }]) }
      expect(output).to include "foobar"
    end
  end

  context "when given an empty attachments" do
    describe ".notify" do
      it "should output N/A" do
        output = capture(:stdout) { subject.notify("test", []) }
        expect(output).to include "N/A"
      end
    end
  end
end
