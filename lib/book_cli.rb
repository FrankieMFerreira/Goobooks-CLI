class BookCLI

  def run
    prompt = TTY::Prompt.new
    user_selection = ""
    until user_selection == "Exit"
      user_selection = prompt.select('Welcome to the Google Books CLI Application', ["Search for Books", "Reading List", "Exit"])
        case user_selection
        when "Search for Books"
          input = prompt_for_search
          query = parse_input(input)
          fetch_books(query)
          render_books(Book.all)
          if !Book.all.empty?
            fav_ask = prompt.yes?('Would you like to add one of these books to your reading list?')
          end
          if fav_ask
            favorite_input = prompt.ask('Select a book from #1-5: ') do |q|
              q.in '1-5'
          end
            Book.add_favorites(favorite_input)
          end
          Book.all.clear
        when "Reading List"
          render_books(Book.favorites)
        else
          "Goodbye!"
        end
    end
end


def prompt_for_search
  print 'Please enter a search term: '
  input = gets.strip
end

def parse_input(input)
  query = input.gsub(' ', '+')
end

def fetch_books(query)
  adapter = GoogleBooksAPIAdapter.new(query)
  adapter.book_response
end

def render_books(input)
  books = input
  if books.empty?
    puts "No results found"
  else
    books.each_with_index do |book, index|
      puts "#{index + 1}. Title: #{book.title}"
      puts "   Author: #{book.author_names}"
      puts "   Publisher: #{book.publisher_name}"
      puts " "
  end
end

end
end
