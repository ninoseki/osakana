# frozen_string_literal: true

require "securitytrails"

module Osakana
  module Enrichers
    class SecurityTrails < Base
      def api
        @api ||= ::SecurityTrails::API.new
      end

      def domain_to_ipv4(domain)
        res = api.history.get_dns_history(domain, "a")
        res&.records&.first&.values&.first&.ip
      end

      def ipv4_to_domain(ipv4)
        res = api.domains.search( filter: { ipv4: ipv4 })
        res&.records&.first&.hostname
      end
    end
  end
end
