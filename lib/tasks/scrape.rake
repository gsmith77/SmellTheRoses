desc "Use Scraper to seed database with Floristries"
task :seed_database => :environment do
    puts "Parsing data from Nokogiri..."
    Scrape.get_floristry
    Scrape.get_default_owner
    Scrape.get_flowers
    puts "done."
  end