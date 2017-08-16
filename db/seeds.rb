# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'

def url_scraper
  array = []
  doc = Nokogiri::HTML(open('https://www.nybits.com/managers/residential_property_managers.html'))
  doc.css('ul.spacyul a').each do |link|
    array.push(link['href'])
  end
  array.uniq
end

def building_scraper
  url_scraper.each do |url|
    doc = Nokogiri::HTML(open(url))
      mgmt = doc.css('div#dancefloor h1')
      mgmt_name = mgmt.children.text
      if mgmt_name != "Brodsky Organization" &&  mgmt_name !='IBEC Living' && mgmt_name != 'Landmark Resources LLC' && mgmt_name != 'M & R Management' && mgmt_name != 'Rose Associates, Inc' && mgmt_name != 'RY Management Co., Inc'
      mgmtInstance = BuildingMgmt.find_or_create_by(name: mgmt_name)
      doc.css('ul.spacyul li').each do |building|
        details = building.content
        parsed_info = details.split(")")[0].split("\n")
        parsed_info[0].slice!(0)
        address=parsed_info[0]
        parsed_info[1].slice!(0)
        neighborhood = parsed_info[1]
        building = Building.create(street_address: address, neighborhood: neighborhood, building_mgmt: mgmtInstance)
    end
    end
  end
end

building_scraper
