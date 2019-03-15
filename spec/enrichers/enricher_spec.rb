# frozen_string_literal: true

RSpec.describe Osakana::Enrichers::Enricher, :vcr do
  subject { Osakana::Enrichers::Enricher.new }

  before do
    allow(ENV).to receive(:[]).with("SECURITYTRAILS_API_KEY").and_return(nil)
  end

  describe "#ipv4_to_domain" do
    before do
      allow(Osakana::Enrichers::Robtex).to receive_message_chain(:new, :ipv4_to_domain)
    end

    it "should return a string or nil" do
      subject.ipv4_to_domain("1.1.1.1")
      expect(Osakana::Enrichers::Robtex.new).to have_received(:ipv4_to_domain).once
    end
  end

  describe "#domain_to_ipv4" do
    before do
      allow(Osakana::Enrichers::Robtex).to receive_message_chain(:new, :domain_to_ipv4)
    end

    it "should return a string or nil" do
      subject.domain_to_ipv4("github.com")
      expect(Osakana::Enrichers::Robtex.new).to have_received(:domain_to_ipv4).once
    end
  end
end
