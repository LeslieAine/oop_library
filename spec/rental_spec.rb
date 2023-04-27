require_relative '../student'
require_relative '../teacher'
require_relative '../book'
require_relative '../rental'
describe Rental do
  let(:student) { Student.new(18, 'John', 1, 'Math') }
  let(:teacher) { Teacher.new(30, 'David', 2, 'Math') }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:rental) { Rental.new('2020-10-20', book, student) }
  describe '#new' do
    it 'should create a new rental' do
      expect(Rental.new('2020-10-20', book, student)).to be_an_instance_of(Rental)
    end
  end
  describe '#date' do
    it 'should return the date of the rental' do
      expect(rental.date).to eq('2020-10-20')
    end
  end
  describe '#book' do
    it 'should return the book of the rental' do
      expect(rental.book).to eq(book)
    end
  end
  describe '#person' do
    it 'should return the person of the rental' do
      expect(rental.person).to eq(student)
    end
  end
  describe '#book=' do
    it 'should set the book of the rental' do
      new_book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
      rental.book = new_book
      expect(rental.book).to eq(new_book)
    end
  end
  describe '#person=' do
    it 'should set the person of the rental' do
      rental.person = teacher
      expect(rental.person).to eq(teacher)
    end
  end
end
