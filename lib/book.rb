class Book
  attr_accessor :title, :authors, :publisher
  ALL = []

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
      "No Publisher Found"
    end
  end

end
