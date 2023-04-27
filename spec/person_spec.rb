require 'rspec'
require './book'
require './rental'
require './person'
describe Person do
  before(:each) do
        @person= Person.new(20, 'John')
  end
  context 'when creating a new book' do
    it 'should create a new person' do
      person = Person.new(20, 'John')
      expect(person.name).to eq('John')
      expect(person.age).to eq(20)
    end
  end
  context 'when I call the correct_name method' do
    it 'should return correct name' do
      person = Person.new(20, 'John')
      expect(person.correct_name).to eq('John')
    end
  end
  context 'when I call the can_use_services? method' do
    it 'should return true if person is of age' do
      expect(@person.can_use_services?).to eq(true)
    end
  end
  context 'when I call the add_rental method' do
    it 'should add a rental to the person' do
      book = Book.new('The Lord of the Rings', 'J.R.R. Tolkien')
      person = Person.new('John', 20)
      rental = Rental.new('2020-01-01', book, person)
      expect(person.add_rental(rental)).to eq(person)
    end
  end
end