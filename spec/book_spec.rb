require 'book'
require 'reading_list'

RSpec.describe Book, "#author_names" do
  context "with no author value" do
    it "displays no author found instead of nil" do
      book1 = Book.new("Clean Code", nil, "Prentice Hall")
      expect(book1.author_names).to eq "No Authors Found"
    end
  end
end

RSpec.describe Book, "#publisher_name" do
  context "with no publisher value" do
    it "displays no publisher found instead of nil" do
      book1 = Book.new("Clean Code", "Robert Cecil Martin", nil)
      expect(book1.publisher_name).to eq "No Publisher Found"
    end
  end
end

RSpec.describe Book, "#author_names" do
  context "with more than two authors" do
    it "joins the two or more authors into one string" do
      book1 = Book.new("Clean Code", ["Robert Cecil Martin", "John Smith", "Carrot Cake"], "Prentice Hall")
      expect(book1.author_names).to eq "Robert Cecil Martin, John Smith, Carrot Cake"
    end
  end
end
