require "ipify/version"
require 'net/http'

API_URI = 'https://api.ipify.org'

module Ipify
  def self.ip format = nil, callback = nil
    res = Net::HTTP.get_response(build_request(format, callback))
    res.body
  end

  private

  def self.build_request format = nil, callback = nil
    uri = URI(API_URI)
    if format
      query = { format: format }
      query[:callback] = callback if callback
      uri.query = URI.encode_www_form(query)
    end
    uri
  end
end
