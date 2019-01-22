# frozen_string_literal: true

require "censys"

module Osakana
  class Censys
    def initialize
      @censys = ::Censys::API.new
    end

    def lookup(query)
      res = @censys.ipv4.search(query: query)

      websites = []
      res.each_page do |page|
        page.each do |result|
          ipv4 = result.ip
          view = @censys.ipv4[ipv4]
          updated_at = view.dig("updated_at")
          websites << Website.new(ipv4: result.to_s, date: updated_at)
        end
      end
      websites
    end

    def self.lookup(query)
      new.lookup(query)
    end
  end
end
