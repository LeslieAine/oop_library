require_relative '../trimmer_decorator'
require_relative '../person'

describe TrimmerDecorator do
  let(:person) { Person.new(18, 'John', 1) }
  let(:decorator) { TrimmerDecorator.new(person) }

  describe '#correct_name' do
    it 'should return the correct name' do
      expect(decorator.correct_name).to eq('John')
    end
  end

  describe '#correct_name=' do
    it 'should set the correct name' do
      person.name = 'David Smith'
      expect(decorator.correct_name).to eq('David Smit')
    end
  end
end
