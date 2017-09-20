require('spec_helper')

describe(Book) do

  describe("#book_title") do
    it("gives you back the book title") do
      book = Book.new({:book_title => "Title of a Book"})
      expect(book.book_title()).to eq("Title of a Book")
    end
  end

  describe("#save") do
    it('stores a book in the database') do
      book = Book.new({:book_title => "A book"})
      book.save()
      expect(Book.all[0].fetch("title")).to eq("A book")
    end
  end

  describe("#update") do
    it('updates a name of a book in the database') do
      book = Book.new({:book_title => "A book"})
      book.save()
      id = Book.all[0].fetch("id")
      book.update(:update_title => "Some other book", :id => id)
      expect(Book.all[0].fetch("title")).to eq("Some other book")
    end
  end

  describe("#delte") do
    it('delete a selected book') do
      array = []
      book = Book.new({:book_title => "A book"})
      book.save()
      id = Book.all[0].fetch("id")
      book.delete(:id => id)
      Book.all.each do |book|
        array.push(book[0].fetch("name"))
      end
      expect(array).to eq([])
    end
  end
end
