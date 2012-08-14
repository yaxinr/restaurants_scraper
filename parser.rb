# require 'rubygems'
# require 'net/http'
require 'nokogiri'
require 'open-uri'


url = "http://www.restaurants.com/listing/search/empty/where/Charlotte+NC/screen/64"
# url = "http://www.restaurants.com/listing/results.php?letter=&screen=1&keyword=&where=Charlotte+NC&location_1=1&advsearch="
  # source = Net::HTTP.get(URI.parse(url)) 
  # puts source

while url
# for i in 61..6
# i=63
 # url = "http://www.restaurants.com/listing/search/empty/where/Charlotte+NC/screen/"+i.to_s
 # url = "http://www.restaurants.com/listing/search/empty/where/Charlotte+NC/screen/"+i.to_s
# url = "http://www.restaurants.com/listing/results.php"
    # url = "http://www.artintra.com"
  # puts url
  # res = Net::HTTP.post_form(URI.parse("http://www.restaurants.com/listing/results.php") ,'screen'=> i.to_s, 'where'=>'Charlotte+NC')
  # res = Net::HTTP.get_response(URI.parse(url) )
# p res.body
  # puts source[0..100]
  # OpenURI.open_http(url)
  open(url)
  # io=open(url)
# p io.status #=> ["200", "OK"]
# p io.base_uri
# p io.read[0, 50]
    doc = Nokogiri::HTML(open(url))
  url=doc.at_css(".rightArrow")[:href]
  doc.css(".listing_summary").each do |item|
    title = item.at_css(".listing_summary_body_title").at_css("h3").text
    # address = item.at_css(".listing_summary_body_content_address").text
    # detail = item.at_css(".detail").text

    # price = item.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/\$[0-9\.]+/]
    # price = item.at_css(".camelPrice").text[/\$[0-9\.]+/]
    puts "#{title}"
     # - #{address} - #{detail}"
    puts item.at_css(".listing_summary_body_title").at_css("h3").at_css("a")[:href]
  end
  # <a class="rightArrow" href="http://www.restaurants.com/listing/results.php?letter=&amp;screen=361&amp;keyword=&amp;where=Charlotte+NC&amp;location_1=1&amp;advsearch=" title="next page">next page</a>
  
end
