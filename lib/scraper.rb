require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  
  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
  
  def get_page 
    doc = Nokogiri::HTML(open("http://learn-co-curriculum.github.io/site-for-scraping/courses"))
    binding.pry
  end

=begin  
The collection of course offerings:
doc.css(".post")
The title of an individual course offering:
doc.css(".post").first.css("h2").text
The schedule of an individual course offering:
doc.css(".post").first.css(".date").text
The description of an individual course offering:
doc.css(".post").first.css("p").text
=end

end

Scraper.new.get_page

