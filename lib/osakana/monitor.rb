# frozen_string_literal: true

module Osakana
  class Monitor
    def self.check_newly_domains(keyword)
      websites = DNPedia.search(keyword)
      new.notify(message: "DNPedia keyword: #{keyword}", websites: websites)
    end

    def self.censys_lookup(query)
      websites = Censys.lookup(query)
      new.notify(message: "Censys query: #{query}", websites: websites)
    end

    def self.ayashige_lookup(keyword)
      websites = Ayashige.lookup(keyword)
      new.notify(message: "Ayashige keyword: #{keyword}", websites: websites)
    end

    def self.urlscan_lookup(query, size:)
      websites = Urlscan.lookup(query, size: size)
      new.notify(message: "urlscan.io query: #{query}", websites: websites)
    end

    def notify(message:, websites: )
      attachements = websites.map(&:to_attachement)
      Notifier.notify(message, attachements)
    end
  end
end
