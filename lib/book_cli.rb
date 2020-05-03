# frozen_string_literal: true

class BookCLI
  def run
    clean
    prompt = TTY::Prompt.new
    @prompt = prompt
    user_selection = ''
    until user_selection == 'Exit'
      user_selection = prompt.select('Google Books CLI Menu', ['Search for Books', 'Reading List', 'Exit'])
      case user_selection
      when 'Search for Books'
        clean
        input = prompt_for_search
        query = parse_input(input)
        fetch_books(query)
        render_books(Book.all)
        fav_check
        Book.all.clear
        sleep(0.65)
        clean
      when 'Reading List'
        clean
        render_books(Book.favorites)
      else
        clean
        puts 'Goodbye!'
      end
    end
end

  def clean
    puts "\e[H\e[2J"
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
    adapter.fetch_books
  end

  def render_books(input)
    books = input
    if books.empty?
      puts 'No results found'
    else
      books.each_with_index do |book, index|
        puts "#{index + 1}. Title: #{book.title}"
        puts "   Author: #{book.author_names}"
        puts "   Publisher: #{book.publisher_name}"
        puts ' '
      end
   end

    def fav_check
      unless Book.all.empty?
        fav_ask = @prompt.yes?('Would you like to add one of these books to your reading list?')
        if fav_ask
          favorite_input = @prompt.ask('Select a book from #1-5: ') do |q|
            q.in '1-5'
            q.messages[:range?] = 'Invalid input, please select a number 1 through 5'
          end
          Book.add_favorites(favorite_input)
          puts 'Successfully added!'
        end
      end
    end
      end
end
