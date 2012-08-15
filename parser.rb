# require 'rubygems'
require 'nokogiri'
require 'open-uri'
# require 'csv'

class Restaurants
  def str( url )
    result=""
    while url
      open(url)
      doc = Nokogiri::HTML(open(url))
      nexturl=doc.at_css(".rightArrow")
      url=nexturl ? nexturl[:href] : nil
      doc.css(".listing_summary").each do |item|
        href=item.at_css(".listing_summary_header h3 a")[:href]
        title = item.at_css(".listing_summary_header h3 a").text
        img = item.at_css(".listing_summary_image")[:src]
        address = item.at_css(".listing_summary_body_content_address").text.gsub(/\s+/, " ").strip
        zip = item.at_css(".zip").text
        detail = item.at_css(".listing_summary_body_content_review a").text.gsub(/\s+/, " ").strip
        result=result+"#{title}\t#{href}\t#{address}\t#{zip}\t#{detail}\t#{img}\n"
      end
    end
    result
  end
end  

open('result.csv',"w") do |file|
  file.puts Restaurants.new.str("http://www.restaurants.com/listing/search/empty/where/Polson")
  file.close
end
puts "See file result.csv"
