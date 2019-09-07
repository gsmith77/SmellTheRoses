require 'uri'
require 'nokogiri'
require 'pry'

class Scrape < ApplicationRecord

    def self.get_floristries
        doc = Nokogiri::HTML(open('https://www.expertise.com/ma/boston/florists'))
        doc.css('h4.provider-card__header').each do |name|
            #populate database with Floristries :)
            Floristry.create(name: name.text)
        end
    end

    def self.get_flowers
        doc = Nokogiri::HTML(open('https://www.herinterest.com/15-most-popular-flowers-in-the-world/'))
        binding.pry
        doc.css('div#content-area.jpibfi_container')
    end
end