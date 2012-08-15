require 'rspec'
require_relative '../parser'

describe Restaurants do
  it "get right string" do
    Restaurants.new.str("spec/test.html").should =="title1\thref1\taddress1 zip1\tzip1\tdetail1\timg1\n"+"title2\thref2\taddress2 zip2\tzip2\tdetail2\timg2\n"

  end
end