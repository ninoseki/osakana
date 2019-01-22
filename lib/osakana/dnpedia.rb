# frozen_string_literal: true

require "http"
require "json"
require "zlib"

module Osakana
  class DNPedia
    BASE_URL = "https://dnpedia.com/tlds/ajax.php"

    DEFAULT_HEADERS = {
      "Accept-Encoding" => "gzip",
      "Referer" => "https://dnpedia.com/tlds/search.php",
      "X-Requested-With" => "XMLHttpRequest",
    }.freeze

    def payload(keyword)
      {
        cmd: "search",
        columns: "id,name,zoneid,length,idn,thedate,ipv4,ipasname,ipasnumber,ipchecked,",
        ecf: "name",
        ecv: "~%#{keyword}%",
        days: "1",
        mode: "added",
        _search: "false",
        nd: "1547680980461",
        rows: "500",
        page: "1",
        sidx: "length",
        sord: "asc"
      }
    end

    def search(keyword)
      res = HTTP.headers(DEFAULT_HEADERS).get(BASE_URL, params: payload(keyword))
      return {} unless res.code == 200

      sio = StringIO.new(res.body)
      gz = Zlib::GzipReader.new(sio)
      body = gz.read

      parse body
    end

    def parse(body)
      begin
        json = JSON.parse(body)
      rescue StandardError => _
        return { domains: [] }
      end

      rows = json["rows"]
      rows.map do |row|
        name = row.dig("name")
        zoneid = row.dig("zoneid")
        domain = [name, zoneid].join(".")

        date = row["thedate"]
        Website.new(domain: domain, date: date)
      end
    end

    def self.search(keyword)
      new.search(keyword)
    end
  end
end
