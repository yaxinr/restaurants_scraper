require_relative 'restaurants'
Restaurants.open('result.csv', 'wb') { |file| file.parseurl('http://www.restaurants.com/listing/search/empty/where/Charlotte+NC')}
# puts Restaurants.generate {|file| file.parseurl('spec/test.html')}
puts 'See file result.csv'
