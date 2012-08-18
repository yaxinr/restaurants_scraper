require 'rspec'
require 'csv'
require_relative '../restaurants'

describe Restaurants do
  it "get right string" do
    Restaurants.generate { |file|
      file.parseurl("spec/test.html")
    }.should == "title1\thref1\taddress1 zip1\tzip1\tdetail1\timg1\n"+"title2\thref2\taddress2 zip2\tzip2\tdetail2\timg2\n"
    # .parse_csv.to_csv[['title1','href1','address1 zip1','zip1','detail1','img1'],['title2','href2','address2 zip2','zip2','detail2','img2']]
  end
end