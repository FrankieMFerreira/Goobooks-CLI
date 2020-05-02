class Book
  attr_accessor :title, :authors, :publisher
  ALL = []
  FAVORITES = []

  def self.all
    ALL
  end

  def initialize(title, authors, publisher)
    @title = title
    @authors = authors
    @publisher = publisher
    ALL << self
  end

  def author_names
    if authors
      authors.join(", ")
    else
      "No Authors Found"
    end
  end

  def publisher_name
    if publisher
      publisher
    else
      "No publisher found"
    end
  end

  def self.add_favorites(query)
    FAVORITES << ALL[query.to_i - 1]
  end

  def self.favorites
    FAVORITES.uniq {|book| [book.title, book.authors, book.publisher]}
  end

end
