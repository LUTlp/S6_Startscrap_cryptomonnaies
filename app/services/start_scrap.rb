require 'rubygems'
require 'open-uri'
require 'nokogiri'

class StartScrap
attr_accessor :nomcrypto, :prixcrypto

  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com"))

  end

  def perform
    Cryptom.destroy_all
    @page = Nokogiri::HTML(open("https://coinmarketcap.com"))
    @array_name = [] #Création d'un array "@array_name" vide
    @array_value = [] #Création d'un array "@array_value" vide
    page.css('a.currency-name-container').each do |node|
      @array_name << node.text #Ajoute dans l'array chaque devise
      end
    page.css('a.price').each do |node|
      @array_value << node.text #Ajoute dans l'array chaque devise
      end
  end


  def save
    perform
    puts Hash[@array_name.zip(@array_value)] #Fait un Hash des deux arrays : "@array_name" et "@array_value"
  end

end
