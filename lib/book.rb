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

  def self.add_favorites(choices)
    choices.each do |choice|
      FAVORITES << ALL[choice]
    end
    FAVORITES.uniq! {|book| [book.title, book.authors, book.publisher]}
  end

  def self.favorites
    FAVORITES
  end

end
