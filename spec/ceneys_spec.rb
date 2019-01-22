# frozen_string_literal: true

RSpec.describe Osakana::Censys, :vcr do
  subject { Osakana::Censys }

  describe ".lookup" do
    it "should return an Array" do
      result = subject.lookup("sagawa.apk")
      expect(result).to be_a(Array)
      expect(result.first).to be_an(Osakana::Website)
    end
  end
end
