# frozen_string_literal: true

require "date"
require "robtex"

module Osakana
  class Website
    attr_reader :primal_type, :date

    def initialize(ipv4: nil, domain: nil, date: nil)
      raise ArgumentError, "Please provide ipv4 or domain for the initialization." if ipv4.nil? && domain.nil?

      @primal_type = domain ? "domain" : "ipv4"

      @ipv4 = ipv4
      @domain = domain
      @date = date ? DateTime.parse(date).to_date.to_s : "N/A"

      @robtex = Robtex::API.new
    end

    def domain
      @domain ||= [].tap do |out|
        res = @robtex.ip(ipv4)
        active = res.dig("act")
        next unless active
        next if active.empty?

        out << active.first.dig("o")
      end.first || "N/A"
    end

    def ipv4
      @ipv4 ||= [].tap do |out|
        results = @robtex.fpdns(domain)
        result = results.find do |res|
          res.dig("rrtype") == "A"
        end
        next unless result

        out << result.dig("rrdata")
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
