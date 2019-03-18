# frozen_string_literal: true

RSpec.describe Osakana::Website, :vcr do
  subject { Osakana::Website }

  context "when given an valid domain" do
    let(:website) { subject.new(domain: "github.com", date: "2019-01-01") }
    describe "#ipv4" do
      it "should return an IP as a String" do
        expect(website.ipv4).to be_a(String)
      end
    end

    describe "#vt_link" do
      it "should return a link" do
        expect(website.vt_link).to eq("https://www.virustotal.com/#/domain/github.com")
      end
    end

    describe "#urlscan_link" do
      it "should return a link" do
        expect(website.urlscan_link).to eq("https://urlscan.io/domain/github.com")
      end
    end

    describe "#summary" do
      it "should return a summary of website" do
        expect(website.summary).to eq("github.com, 192.30.253.113 🇺🇸 (date: 2019-01-01)")
      end
    end
  end

  context "when given an invalid domain" do
    let(:website) { subject.new(domain: "never_ever_exists.com", date: "2019-01-01") }
    describe "#ipv4" do
      it "should return N/A" do
        expect(website.ipv4).to eq("N/A")
      end
    end
  end

  context "when given an IP with no active domain" do
    let(:website) { subject.new(ipv4: "67.229.196.131", date: "2019-01-01") }
    describe "#domain" do
      it "should return N/A" do
        expect(website.domain).to eq("N/A")
      end
    end
  end
end
