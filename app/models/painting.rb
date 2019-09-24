class Painting

  attr_reader :title, :price, :artist, :gallery

  @@all = []

  def self.all
    @@all
  end

  def self.total_price
    prices = self.all.map do |paining|
      paining.price
    end

    prices.inject { |sum, el| sum + el}
  end

  def initialize(title, price, artist, gallery)
    @title = title
    @price = price
    @artist = artist
    @gallery = gallery
    self.class.all << self
  end

end
