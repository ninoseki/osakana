# frozen_string_literal: true

require "osakana/version"

require "osakana/website"

require "osakana/ayashige"
require "osakana/censys"
require "osakana/dnpedia"

require "osakana/notifier"
require "osakana/monitor"

require "osakana/cli"

module Osakana
  class Error < StandardError; end
end
