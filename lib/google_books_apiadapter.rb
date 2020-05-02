# frozen_string_literal: true

class GoogleBooksAPIAdapter
  attr_reader :query
  BASE_URL = 'https://www.googleapis.com/books/v1/volumes'

  def initialize(query)
    @query = query
  end

  def fetch_books
    spinner = TTY::Spinner.new('Fetching Books... [:spinner]')
    spinner.auto_spin
    begin
      response = RestClient.get("#{BASE_URL}?q=#{query}&maxResults=5")
      data = JSON.parse(response)
    rescue StandardError
      data = ''
    end
    book_data = data['items']
    book_data&.each do |book|
      Book.new(book['volumeInfo']['title'], book['volumeInfo']['authors'], book['volumeInfo']['publisher'])
    end
    sleep(0.25)
    spinner.stop('Done!')
  end
end
