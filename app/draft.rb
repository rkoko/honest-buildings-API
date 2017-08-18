# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'
require 'byebug'
#
# def url_scraper
#   array = []
#   alphabet=('a'..'z').to_a
#   url = 'https://www.nybits.com/managers/'
#   url_2 = '_letter_managers.html'
#   alphabet.each do |letter|
#     doc = Nokogiri::HTML(open(url+letter+url_2))
#       doc.css('ul.spacyul a').each do |link|
#         array.push(link['href'])
#       end
#   end
#   puts(array.uniq)
# end

def url_scraper
  array = []
  doc = Nokogiri::HTML(open('https://www.nybits.com/managers/residential_property_managers.html'))
  doc.css('ul.spacyul a').each do |link|
    array.push(link['href'])
  end
  array.uniq
end


def building_scraper
  array = []
  url_scraper.each do |url|
    doc = Nokogiri::HTML(open(url))
    doc.css('ul.spacyul a').each do |link|
      array.push(link['href'])
    end
    end
    array.uniq
end

def create_data
    doc = Nokogiri::HTML(open('https://www.nybits.com/apartments/3692_bedford_ave_bk.html'))
    building_name = doc.css('div#dancefloor h1').children.text
    table = doc.css('div#dancefloor table#summarytable tr')
      rows_array = table.map {|row| row.children.text}
      rows_array[0]
      hood = rows_array[1].split(",")[0]
      hood.split(":")[1].slice!(0..1)
      boro = rows_array[1].split(",")[1].slice!(0)

    end
    byebug
end

create_data



#
# def building_scraper
#   url_scraper.each do |url|
#     doc = Nokogiri::HTML(open(url))
#       mgmt = doc.css('div#dancefloor h1')
#       mgmt_name = mgmt.children.text
#       if mgmt_name != "Brodsky Organization" &&  mgmt_name !='IBEC Living' && mgmt_name != 'Landmark Resources LLC' && mgmt_name != 'M & R Management' && mgmt_name != 'Rose Associates, Inc' && mgmt_name != 'RY Management Co., Inc'
#       mgmtInstance = BuildingMgmt.find_or_create_by(name: mgmt_name)
#       doc.css('ul.spacyul li').each do |building|
#         details = building.content
#         parsed_info = details.split(")")[0].split("\n")
#         parsed_info[0].slice!(0)
#         address=parsed_info[0]
#         parsed_info[1].slice!(0)
#         neighborhood = parsed_info[1]
#         building = Building.create(street_address: address, neighborhood: neighborhood, building_mgmt: mgmtInstance)
#     end
#     end
#   end
# end

# building_scraper
