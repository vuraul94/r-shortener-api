require 'httparty'
require 'openssl'
require 'nokogiri'
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

class ShortUrlTitlesJob < ApplicationJob
  include HTTParty
  queue_as :default

  def perform(short_url)
    puts short_url[:url]
    response = HTTParty.get(short_url[:url])
    title = Nokogiri::HTML(response.body).xpath('//title').text
    short_url.update({title: title})
    # puts response.body, response.code, response.message, response.headers.inspect
  end
end
