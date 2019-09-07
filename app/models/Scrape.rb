require 'uri'
require 'nokogiri'
require 'pry'

class Scrape < ApplicationRecord

    def self.get_floristries
        doc = Nokogiri::HTML(open('https://www.expertise.com/ma/boston/florists'))
        doc.css('h4.provider-card__header').each do |name|
            Floristry.create(name: name.text)
        end
    end
end