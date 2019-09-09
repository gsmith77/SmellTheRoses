require 'uri'
require 'nokogiri'
require 'pry'

class Scrape < ApplicationRecord

    def self.get_floristry
        Floristry.destroy_all
        doc = Nokogiri::HTML(open('https://www.expertise.com/ma/boston/florists'))
        Floristry.create(name: doc.css('h4.provider-card__header')[0].text)
    end

    def self.get_flowers
        Owner.destroy_all
        Flower.destroy_all
        doc = Nokogiri::HTML(open('https://www.herinterest.com/15-most-popular-flowers-in-the-world/'))
        owner = Owner.create(first_name:'grant', last_name: 'smith', user_name:'username', password:'password')
        doc.css('div#content-area p').slice(1,45).each_slice(3).each do |flower|
            params = {name: flower[0].text.slice(3, flower[0].text.length), image: flower[1].css('img').attribute('src').value, description: flower[2].text, owner_id: owner.id, floristry_id: Floristry.find(Floristry.all[0].id).id}
            Flower.create(params)
        end
    end
end