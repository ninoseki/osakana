# frozen_string_literal: true

require "http"
require "json"

module Osakana
  class Ayashige
    BASE_URL = "https://ayashige.herokuapp.com/feed"

    def lookup(keyword)
      res = HTTP.get(BASE_URL)
      return [] unless res.code == 200

      websites = []
      json = JSON.parse(res.body.to_s)
      json.each do |item|
        domain = item.dig("domain") || ""
        updated_on = item.dig("updated_on") || ""
        next unless domain.include?(keyword)

        websites << Website.new(domain: domain, date: updated_on)
      end
      websites
    end

    def self.lookup(keyword)
      new.lookup(keyword)
    end
  end
end
