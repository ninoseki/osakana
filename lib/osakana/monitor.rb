# frozen_string_literal: true

module Osakana
  class Monitor
    def self.check_newly_domains(keyword)
      websites = DNPedia.search(keyword)
      attachements = websites.map(&:to_attachement)
      Notifier.notify("DNPedia keyword: #{keyword}", attachements)
    end

    def self.censys_lookup(query)
      websites = Censys.lookup(query)
      attachements = websites.map(&:to_attachement)
      Notifier.notify("Censys query: #{query}", attachements)
    end

    def self.ayashige_lookup(keyword)
      websites = Ayashige.lookup(keyword)
      attachements = websites.map(&:to_attachement)
      Notifier.notify("Ayashige keyword: #{keyword}", attachements)
    end

    def self.urlscan_lookup(query, size:)
      websites = Urlscan.lookup(query, size: size)
      attachements = websites.map(&:to_attachement)
      Notifier.notify("urlscan.io query: #{query}", attachements)
    end
  end
end
