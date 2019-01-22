# frozen_string_literal: true

RSpec.describe Osakana::Monitor, :vcr do
  subject { Osakana::Monitor }

  describe ".check_newly_domains" do
    it "should output results to STDOUT" do
      output = capture(:stdout) { subject.check_newly_domains "sagawa" }
      expect(output).to include "sagawa"
    end
  end

  describe ".censys_lookup" do
    it "should output results to STDOUT" do
      output = capture(:stdout) { subject.censys_lookup "sagawa.apk" }
      expect(output).to include "sagawa"
    end
  end
end
