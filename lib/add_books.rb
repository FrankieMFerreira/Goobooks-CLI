class AddBooks

  def self.add_books(data)
    book_data = data['items']
    book_data&.each do |book|
        Book.new(book['volumeInfo']['title'], book['volumeInfo']['authors'], book['volumeInfo']['publisher'])
    end
  end

end
