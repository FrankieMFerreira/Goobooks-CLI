require 'book_cli'
require 'add_books'
require 'google_books_adapter'

RSpec.describe BookCLI, "#run" do
  context "with foreign language" do
    it "appropriately handles bad search input" do
      data = GoogleBooksAdapter.new('中文')
      Book.all.clear
      AddBooks.add_books(data.fetch_books)
      expect(Book.all.length).to eq 0
    end
  end
end

RSpec.describe BookCLI, "#run" do
  context "with non-ASCII characters" do
    it "appropriately handles bad search input" do
      data = GoogleBooksAdapter.new('£ÃÝë')
      Book.all.clear
      AddBooks.add_books(data.fetch_books)
      expect(Book.all.length).to eq 0
    end
  end
end
