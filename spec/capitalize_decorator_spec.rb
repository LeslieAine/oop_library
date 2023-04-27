require_relative '../capitalize_decorator'
require_relative '../person'

describe CapitalizeDecorator do
  let(:person) { Person.new(18, 'john', 1) }
  let(:decorator) { CapitalizeDecorator.new(person) }

  describe '#correct_name' do
    it 'should return the correct name' do
      expect(decorator.correct_name).to eq('John')
    end
  end

  describe '#correct_name=' do
    it 'should set the correct name' do
      person.name = 'david'
      expect(decorator.correct_name).to eq('David')
    end
  end
end
