require 'uri'
require 'nokogiri'
require 'pry'

class Scrape < ApplicationRecord

    def self.get_floristries
        Floristry.destroy_all
        doc = Nokogiri::HTML(open('https://www.expertise.com/ma/boston/florists'))
        doc.css('h4.provider-card__header').each do |name|
            #populate database with Floristries :)
            Floristry.create(name: name.text)
        end
    end

    def self.get_flowers
        Owner.destroy_all
        Flower.destroy_all
        doc = Nokogiri::HTML(open('https://www.herinterest.com/15-most-popular-flowers-in-the-world/'))
        owner = Owner.create(first_name:'grant', last_name: 'smith', user_name:'username', password:'password')
        doc.css('div#content-area p').slice(1,45).each_slice(3).each do |flower|
            params = {name: flower[0].text, image: flower[1].css('img').attribute('src').value, description: flower[2].text, owner_id: owner.id, floristry_id: Floristry.find(Floristry.all[0].id).id}
            Flower.create(params)
        end
    end
end