# require "ipify/version"
require 'net/http'

API_URI = 'https://api.ipify.org'

module Ipify
  def self.ip format = nil
    res = Net::HTTP.get_response(self.build_request(format))
    res.body
  end

  private

  def self.build_request format = nil
    uri = URI(API_URI)
    uri.query = URI.encode_www_form({ format: format }) if format
    uri
  end
end
