require 'book'
require 'reading_list'

RSpec.describe ReadingList, "#add_favorites" do
  context "with duplicate books" do
    it "removes duplicates and displays unique books" do
      Book.all.clear
      10.times {Book.new("Clean Code", "Robert Cecil Martin", "Prentice Hall")}
      ReadingList.add_favorites([0,1,2,3,4,5,6,7,8,9])
      expect(ReadingList.all.length).to eq 1
    end
  end
end
