# frozen_string_literal: true

require "thor"

module Osakana
  class CLI < Thor
    desc "check_newly_domains [KEYWORD]", "check newly registered domains on DNPedia by a given keyword"
    def check_newly_domains(keyword)
      Monitor.check_newly_domains(keyword)
    end

    desc "censys_lookup [QUERY]", "lookup on Censys by a given query"
    def censys_lookup(query)
      Monitor.censys_lookup(query)
    end

    desc "ayashige_lookup [KEYWORD]", "lookup on Ayashige by a given keyword"
    def ayashige_lookup(keyword)
      Monitor.ayashige_lookup(keyword)
    end

    desc "urlscan_lookup [QUERY]", "look up on urlscan.io by a given query"
    option :size, type: :numeric, default: 100
    def urlscan_lookup(query)
      Monitor.urlscan_lookup(query, size: options.dig("size"))
    end

    no_commands do
      def with_error_handling
        yield
      rescue StandardError => e
        puts "Warning: #{e}"
      end
    end
  end
end
