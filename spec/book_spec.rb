require 'rspec'
require './book'
require './rental'
require './person'

describe Book do
  before(:each) do
    @book = Book.new('if tomorrow comes', 'sidney sheldon')
  end

  context 'when creating a new book' do
    it 'should create a new book' do
      book = Book.new('if tomorrow comes', 'sidney sheldon')
      expect(book.title).to eq('if tomorrow comes')
      expect(book.author).to eq('sidney sheldon')
    end
  end

  context 'when I call the add_rental method' do
    it 'should add a book to the rentals' do
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      rental = double('rental')
      expect(rental).to receive(:book=).with(book)
      expect(book.add_rental(rental)).to eq(book)
    end
  end
end
