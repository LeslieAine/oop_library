require 'rspec'
require './teacher'

describe Teacher do
  before(:each) do
    @teacher = Teacher.new(20, 'Michael', nil, 'Software Engineering')
  end

  it 'should create a new teacher' do
    teacher = Teacher.new(20, 'Michael', nil, 'Software Engineering')
    expect(teacher.class.name).to eq('Teacher')
  end

  it 'teacher can use services' do
    expect(@teacher.can_use_services?).to eq(true)
  end
end
