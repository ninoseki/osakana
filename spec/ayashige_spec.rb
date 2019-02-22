# frozen_string_literal: true

RSpec.describe Osakana::Ayashige, :vcr do
  subject { Osakana::Ayashige }

  describe ".lookup" do
    it "should return an Array" do
      result = subject.lookup("softbank")
      expect(result).to be_a(Array)
      expect(result.first).to be_an(Osakana::Website)
    end
  end
end
