require 'uri'
require 'nokogiri'
require 'pry'

class ScraperController < ApplicationController

    def scrape
        doc = Nokogiri::HTML(open('https://www.yelp.com/search?cflt=florists&find_loc=Boston%2C+MA'))
        binding.pry
    end
end