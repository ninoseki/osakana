# frozen_string_literal: true

require "robtex"

module Osakana
  module Enrichers
    class Robtex < Base
      def api
        @api ||= ::Robtex::API.new
      end

      def domain_to_ipv4(domain)
        results = api.fpdns(domain)
        result = results.find do |res|
          res.dig("rrtype") == "A"
        end
        result&.dig("rrdata")
      end

      def ipv4_to_domain(ipv4)
        res = api.ip(ipv4)
        active = res.dig("act")
        active&.first&.dig("o")
      end
    end
  end
end
