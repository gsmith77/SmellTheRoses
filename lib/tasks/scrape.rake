desc "Use Scraper to seed database with Floristries"
task :get_floristries => :environment do
    puts "Getting stuff from api..."
    Scrape.get_floristries
    puts "done."
  end