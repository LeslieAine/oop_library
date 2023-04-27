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

  describe '#to_h' do
    it 'returns a hash representation of the book' do
      expected_hash = {
        id: book.id,
        title: book.title,
        author: book.author,
        rentals: []
      }
      expect(book.to_h).to eq(expected_hash)
    end
  end
  context 'when adding a new rental' do
    let(:person) { Person.new(24, 'Tomas') }

    it 'creates a new rental object and adds it to the rentals array' do
      rental = book.add_rental('2023-04-26', person)
      expect(rental).to be_an_instance_of(Rental)
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person object' do
      rental = book.add_rental('2023-04-26', person)
      expect(person.rentals).to include(rental)
    end
  end
end
