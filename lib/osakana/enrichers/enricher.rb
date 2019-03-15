# frozen_string_literal: true

module Osakana
  module Enrichers
    class Enricher < Base
      def initialize
        @enrichers = [SecurityTrails.new, Robtex.new]
      end

      def ipv4_to_domain(ipv4)
        @enrichers.each do |enricher|
          return enricher.ipv4_to_domain(ipv4)
        rescue ArgumentError, ::SecurityTrails::Error, ::Robtex::ResponseError, URI::InvalidURIError => _
          next
        end
        nil
      end

      def domain_to_ipv4(domain)
        @enrichers.each do |enricher|
          return enricher.domain_to_ipv4(domain)
        rescue ArgumentError, ::SecurityTrails::Error, ::Robtex::ResponseError => _
          next
        end
        nil
      end
    end
  end
end
