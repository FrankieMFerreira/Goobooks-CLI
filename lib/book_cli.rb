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
        spinner = TTY::Spinner.new('Fetching Books... [:spinner]')
        spinner.auto_spin
        data = GoogleBooksAPIAdapter.new(query)
        AddBooks.add_books(data.fetch_books)
        sleep(0.25)
        spinner.stop('Done!')
        render_books(Book.all)
        add_to_favorites
        Book.all.clear
        sleep(0.65)
        clean
      when 'Reading List'
        clean
        render_books(ReadingList.list)
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

    def add_to_favorites
      unless Book.all.empty?
        fav_ask = @prompt.yes?('Would you like to add one of these books to your reading list?')
        if fav_ask
            clean
            choices = Hash[Book.all.collect.with_index {|book, index| [book.title + " by " + book.author_names + " [Publisher: " + book.publisher_name + "]", index]}]
            favorite_input = @prompt.multi_select("Select Books for Reading List", choices)
            ReadingList.add_favorites(favorite_input)
            if !favorite_input.empty?
              puts "Successfully added!"
            end
        end
      end
    end

  end

end
