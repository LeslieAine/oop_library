require_relative '../classroom'
require_relative '../student'
describe Classroom do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(18, 'John Doe', 1, 'Math') }
  describe '#add_student' do
    it 'Adds a student to the classroom' do
      expect(classroom.students).to eq([])
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
    end
  end
  describe '#label' do
    it 'Returns the label of the classroom' do
      expect(classroom.label).to eq('Math')
    end
  end
  describe '#label=' do
    it 'Sets the label of the classroom' do
      classroom.label = 'Science'
      expect(classroom.label).to eq('Science')
    end
  end
end
