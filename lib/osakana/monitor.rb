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
  end
end
