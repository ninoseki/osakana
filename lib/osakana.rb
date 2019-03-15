# frozen_string_literal: true

require "osakana/version"

require "osakana/enrichers/base"
require "osakana/enrichers/robtex"
require "osakana/enrichers/securitytrails"
require "osakana/enrichers/enricher"

require "osakana/website"

require "osakana/ayashige"
require "osakana/censys"
require "osakana/dnpedia"
require "osakana/urlscan"

require "osakana/notifier"
require "osakana/monitor"

require "osakana/cli"

module Osakana
  class Error < StandardError; end
end
