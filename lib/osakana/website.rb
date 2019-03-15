# frozen_string_literal: true

require "date"

module Osakana
  class Website
    attr_reader :primal_type, :date

    def initialize(ipv4: nil, domain: nil, date: nil)
      raise ArgumentError, "Please provide ipv4 or domain for the initialization." if ipv4.nil? && domain.nil?

      @primal_type = domain ? "domain" : "ipv4"

      @ipv4 = ipv4
      @domain = domain
      @date = date ? DateTime.parse(date).to_date.to_s : "N/A"

      @enricher = Enrichers::Enricher.new
    end

    def domain
      @domain ||= [].tap do |out|
        out << @enricher.ipv4_to_domain(ipv4)
      end.first || "N/A"
    end

    def ipv4
      @ipv4 ||= [].tap do |out|
        out << @enricher.domain_to_ipv4(domain)
      end.first || "N/A"
    end

    def summary
      @summary ||= "#{domain}, #{ipv4} (date: #{date})"
    end

    def vt_link
      primal_type == "domain" ? "https://www.virustotal.com/#/domain/#{domain}" : "https://www.virustotal.com/#/ip-address/#{ipv4}"
    end

    def urlscan_link
      primal_type == "domain" ? "https://urlscan.io/domain/#{domain}" : "https://urlscan.io/ip/#{ipv4}"
    end

    def to_attachement
      {
        fallback: "urlscan.io link",
        title: summary,
        title_link: urlscan_link,
        footer: "urlscan.io",
        footer_icon: "http://www.google.com/s2/favicons?domain=urlscan.io"
      }
    end
  end
end
