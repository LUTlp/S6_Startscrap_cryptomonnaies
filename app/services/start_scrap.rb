require 'rubygems'
require 'open-uri'
require 'nokogiri'

class StartScrap
  def initialize
    @page = Nokogiri::HTML(open("https://coinmarketcap.com"))
    @array_names = [] #Création d'un array "@array_name" vide
    @array_values = [] #Création d'un array "@array_value" vide
  end

  def scrap
    @page.css('a.currency-name-container').each do |node|
      @array_names << node.text #Ajoute dans l'array chaque devise
      end
    @page.css('a.price').each do |node|
      @array_values << node.text #Ajoute dans l'array chaque devise
      end
  end

  def save
    
    @compils = Hash[@array_names.zip(@array_values)] #Fait un Hash des deux arrays : "@array_name" et "@array_value"
    p @compils
    @compils.each do |n, k|
      c = Crypto.create(
        name: n,
        price: k
      )
      p c
    end
    p "méfait accompli"
  end

  def perform
    scrap
    save
  end
end
