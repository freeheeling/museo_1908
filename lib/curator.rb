class Curator
  attr_reader :photographs,
              :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find do |artist|
      artist.id == id
    end
  end

  def find_photograph_by_id(id)
    @photographs.find do |photo|
      photo.id == id
    end
  end

  def find_photographs_by_artist(artist)
    @photographs.find_all do |photo|
      photo.artist_id == artist.id
    end
  end

  def artists_with_multiple_photographs
    @artists.each_with_object([]) do |artist, multiples|
      multiples << artist if find_photographs_by_artist(artist).length > 1
    end
  end

  def photographs_taken_by_artist_from(country)
    @artists.inject([]) do |photos, artist|
      photos << find_photographs_by_artist(artist) if artist.country == country
      photos.flatten
    end
  end

end
