require_relative '../config/environment.rb'

don = Artist.new("Don", 12)
mike = Artist.new("Mike", 5)
leo = Artist.new("Leo", 12)

sewer = Gallery.new("sewer", "NYC")
awesome = Gallery.new("awesome gallery", "Chicago")
cowabunga = Gallery.new("cowabunga gallery", "NYC")

purple = don.create_paininting("purple", 100, sewer)
purple2 = don.create_paininting("purple2", 200, awesome)
purple3 = don.create_paininting("purple3", 300, cowabunga)
orange = mike.create_paininting("orange", 50, sewer)
blue = leo.create_paininting("blue", 500, sewer)

test = Artist.most_prolific

binding.pry

puts "Bob Ross rules."
