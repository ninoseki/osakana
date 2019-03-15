# frozen_string_literal: true

module Osakana
  module Enrichers
    class Base
      def domain_to_ipv4(_domain)
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end

      def ipv4_to_domain(_ipv4)
        raise NotImplementedError, "You must implement #{self.class}##{__method__}"
      end
    end
  end
end
