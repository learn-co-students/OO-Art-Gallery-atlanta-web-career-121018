class Gallery

  attr_reader :name, :city

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, city)
    @name = name
    @city = city
    self.class.all << self
  end

  def paintings
    Painting.all.select do |painting|
      painting.gallery == self
    end
  end

  def artists
    paintings.map do |painting|
      painting.artist
    end
  end

  def artist_names
    artists.map do |artist|
      artist.name
    end
  end

  def most_expensive_painting
    prices = paintings.map do |painting|
      painting.price
    end

    highest_price = prices.max

    paintings.find do |painting|
      painting.price == highest_price
    end
  end

end
