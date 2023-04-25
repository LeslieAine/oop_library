require_relative 'create'
require_relative './data/loader'

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
      people.push(Student.new(age, name, classroom, parent_permission: parent_permission))
      
      if File.exist?('./data/people.json')
        file = File.read('./data/people.json')
        save = JSON.parse(file)
      end
      
      save << { id: student.id, name: student.name, age: student.age }
    File.write('./data/people.json', JSON.generate(save))

  when '2'
      print 'Specialization: '
      specialization = gets.chomp
      people.push(Teacher.new(age, name, specialization))
      save = []

    if File.exist?('./data/people.json')
      file = File.read('./data/people.json')
      save = JSON.parse(file)
    end

    save << { id: teacher.id, name: teacher.name, age: teacher.age, specialization: teacher.specialization }

    File.write('./data/people.json', JSON.generate(save))
    else
      puts 'Invalid option'
      input_person_info
    end
    puts 'Person created successfully'
  end
end
