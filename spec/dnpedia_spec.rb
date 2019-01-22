# frozen_string_literal: true

RSpec.describe Osakana::DNPedia, :vcr do
  subject { Osakana::DNPedia }

  describe ".search" do
    it "should return an Array" do
      result = subject.search("apple")
      expect(result).to be_a(Array)
      expect(result.first).to be_an(Osakana::Website)
    end
  end
end
