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

  it 'should add a book to the rentals' do
    book = Book.new('Title', 'Author')
    person = Person.new(24, 'Bob')
    rental = Rental.new('2023-04-27', book, person)

    book.add_rental(rental)

    expect(book.rentals).to include(rental)
  end
end
