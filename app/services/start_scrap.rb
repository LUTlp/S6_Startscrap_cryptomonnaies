require 'rubygems'
require 'open-uri'
require 'nokogiri'

class StartScrap
  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com"))
  end

  def perform
  end

  def save
  end
end
