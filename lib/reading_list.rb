class ReadingList
    READING_LIST = []

    def self.add_favorites(choices)
      choices.each do |choice|
        READING_LIST << Book.all[choice]
      end
      READING_LIST.uniq! {|book| [book.title, book.authors, book.publisher]}
    end

    def self.list
      READING_LIST
    end

end
