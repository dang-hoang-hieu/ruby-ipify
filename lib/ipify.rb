require "ipify/version"
require 'net/http'

API_URI = 'https://api.ipify.org'
MAX_RETRIES = 3

module Ipify
  ConnectionError = Class.new(StandardError)
  ServiceError = Class.new(StandardError)

  # @return [String] this machine's public ip
  def self.ip format = nil, callback = nil
    res = Net::HTTP.get_response(build_request(format, callback))

    raise ServiceError, "Received an invalid status code from ipify: #{res.status_code}. The service might be experiencing issues." if '200' != res.code

    res.body
  rescue Net::OpenTimeout
    retries ||= 0
    if retries < MAX_RETRIES
      retries += 1
      sleep 2 ** retries
      retry
    else
      raise ConnectionError, "The request failed because it wasn't able to reach the ipify service. This is most likely due to a networking error of some sort."
    end
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
