require_relative 'create'

class CreatePerson < Create
  def input_person_info(people)
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    create(person_type, age, name, people)
  end

  def create(person_type, age, name, people)
    case person_type
    when '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      print 'What is the student\'s classroom? '
      classroom = gets.chomp
      people.push(Student.new(age, name, nil, classroom, parent_permission: parent_permission))
    when '2'
      print 'Specialization: '
      specialization = gets.chomp
      people.push(Teacher.new(age, name, nil, specialization))
    else
      puts 'Invalid option'
      input_person_info
    end
    puts 'Person created successfully'
  end
end
