# require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

class Restaurants < CSV
  def parseurl( url )
    @col_sep = 9.chr
    while url
      open(url)
      doc = Nokogiri::HTML(open(url))
      nexturl=doc.at_css('.rightArrow')
      url=nexturl ? nexturl[:href] : nil
      doc.css('.listing_summary').each {|item|
        href=item.at_css('.listing_summary_header h3 a')[:href]
        title = item.at_css('.listing_summary_header h3 a').text
        img = item.at_css('.listing_summary_image')[:src]
        address = item.at_css('.listing_summary_body_content_address').text.gsub(/\s+/, ' ').strip
        zip = item.at_css('.zip').text
        detail = item.at_css('.listing_summary_body_content_review a').text.gsub(/\s+/, ' ').strip
        self<<[title,href,address,zip,detail,img]
      }
    end
    
  end
end

