# frozen_string_literal: true

RSpec.describe Osakana::Urlscan, :vcr do
  subject { Osakana::Urlscan }

  describe ".lookup" do
    it "should return an Array" do
      result = subject.lookup("domain:urlscan.io")
      expect(result).to be_a(Array)
      expect(result.first).to be_an(Osakana::Website)
    end
  end
end
