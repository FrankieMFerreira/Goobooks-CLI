# frozen_string_literal: true

class GoogleBooksAdapter
  attr_reader :query
  BASE_URL = 'https://www.googleapis.com/books/v1/volumes'

  def initialize(query)
    @query = query
  end

  def fetch_books
    begin
      response = RestClient.get("#{BASE_URL}?q=#{query}&maxResults=5")
      data = JSON.parse(response)
    rescue StandardError
      data = ''
    end
  end
end
