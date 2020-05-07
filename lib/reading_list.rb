class ReadingList
    READING_LIST = []

    def self.all
      READING_LIST
    end
    
    def self.add_favorites(choices)
      choices.each do |choice|
        READING_LIST << Book.all[choice]
      end
      READING_LIST.uniq! {|book| [book.title, book.authors, book.publisher]}
    end

end
