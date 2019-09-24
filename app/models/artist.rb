class Artist

  attr_reader :name, :years_experience

  @@all = []

  def self.all
    @@all
  end

  def self.total_experience
    experiences_years = self.all.map do |artist|
      artist.years_experience
    end

    experiences_years.inject { |sum, el| sum + el}
  end

  def self.most_prolific
    find_hash = {}

    self.all.each_with_index do |artist, index|
      find_hash[index] = (artist.years_experience / artist.paintings.size).to_f
    end

    largest_index = find_hash.max_by { |index, value| value }

    self.all.each_with_index do |artist, index|
      return artist if index == largest_index[0]
    end
  end

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    self.class.all << self
  end

  def paintings
    Painting.all.select do |painting|
      painting.artist == self
    end
  end

  def galleries
    paintings.map do |painting|
      painting.gallery
    end
  end

  def cities
    galleries.map do |gallery|
      gallery.city
    end
  end

  def create_paininting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end

end
