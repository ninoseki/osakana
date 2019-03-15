# frozen_string_literal: true

require "http"
require "json"

module Osakana
  class Urlscan
    BASE_URL = "https://urlscan.io/api/v1/search/"

    def lookup(query, size: 100)
      res = HTTP.get(BASE_URL, params: { q: query, size: size })
      return [] unless res.code == 200

      websites = []
      json = JSON.parse(res.body.to_s)
      results = json.dig("results") || []
      results.each do |item|
        domain = item.dig("page", "domain")
        ipv4 = item.dig("page", "ip")
        time = item.dig("task", "time")

        websites << Website.new(domain: domain, ipv4: ipv4, date: time)
      end
      websites
    end

    def self.lookup(query, size: 100)
      new.lookup(query, size: size)
    end
  end
end
