# frozen_string_literal: true

RSpec.describe Osakana::Enrichers::Robtex, :vcr do
  subject { Osakana::Enrichers::Robtex.new }

  describe "#ipv4_to_domain" do
    it "should return a string or nil" do
      result = subject.ipv4_to_domain("1.1.1.1")
      expect(result).to be_a(String)
    end
  end

  describe "#domain_to_ipv4" do
    it "should return a string or nil" do
      result = subject.domain_to_ipv4("github.com")
      expect(result).to be_a(String)
    end
  end
end
