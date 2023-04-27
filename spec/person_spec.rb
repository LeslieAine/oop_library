require 'rspec'
require './book'
require './rental'
require './person'
describe Person do
  before(:each) do
    @person = Person.new(20, 'John')
  end
  context 'when creating a new person' do
    it 'should create a new person' do
      expect(@person.name).to eq('John')
      expect(@person.age).to eq(20)
    end
  end
  context 'when I call the correct_name method' do
    it 'should return correct name' do
      expect(@person.correct_name).to eq('John')
    end
  end
  describe '#can_use_services?' do
    let(:person) { Person.new(1, age) }
    let(:book) { instance_double('Book') }
    let(:date) { instance_double('Date') }

    context 'when the person is under 18' do
      let(:age) { 17 }

      it 'returns true when parent permission is given' do
        expect(person.can_use_services?).to eq(true)
      end

      it 'returns false when parent permission is not given' do
        person.instance_variable_set(:@parent_permission, false)
        expect(person.can_use_services?).to eq(false)
      end
    end

    context 'when the person is 18 or older' do
      let(:age) { 18 }

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end
  end

  describe '#to_h' do
            let(:person) { Person.new(1, 18, name: 'Test Name', parent_permission: true) }

            it 'returns a hash with person details and rental details' do
            rental = instance_double('Rental', to_h: { book_id: 1, person_id: 1, date: '2023-04-25' })
            person.instance_variable_set(:@rentals, [rental])
            expect(person.to_h).to eq({
                                        id: 1,
                                        name: 'Test Name',
                                        age: 18,
                                        parent_permission: true,
                                        rentals: [rental.to_h]
                                        })
            end
        end
    end
end
