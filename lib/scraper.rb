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
    
    doc.css(".post").each do |post| 
      course = Course.new 
      course.title = post.css("h2").text 
      course.schedule = post.css(".date").text 
      course.description = post.css("p").text
      binding.pry
    end
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

